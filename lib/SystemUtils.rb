class SystemUtils
  @@debug=true
  @@level=5
  
  attr_reader :debug,:level,:last_error
  
 def SystemUtils.debug_output(label,object)
  if SystemUtils.debug == true
    p label.to_sym  
    p object
  end  
 end
  
 def SystemUtils.log_output(object,level)
  if SystemUtils.level < level
    p :Error  
    p object.to_s
  end 
 end
 
 #@Logs to passeenger std out the @msg followed by @object.to_s
 #Logs are written to apache/error.log
 # error mesg is truncated to 512 bytes
 # returns nothing
  def SystemUtils.log_error_mesg(msg,object)
    obj_str = object.to_s.slice(0,512)
    SystemUtils.log_output(msg + ":->:" + obj_str ,10)
  end
 
 
  def SystemUtils.log_error(object)
    SystemUtils.log_output(object,10)
   end
 
 
  def SystemUtils.symbolize_keys(hash)
    hash.inject({}){|result, (key, value)|
      new_key = case key
                when String then key.to_sym
                else key
                end
      new_value = case value
                  when Hash then symbolize_keys(value)
                  when Array   then
                    newval=Array.new 
                    value.each do |array_val|
                      if array_val.is_a?(Hash)
                        array_val = SystemUtils.symbolize_keys(array_val)
                      end
                      newval.push(array_val)                                          
                    end
                      newval      
                  else value
                  end
      result[new_key] = new_value
      result
    }
  end
  
  def SystemUtils.log_exception(e)
      e_str = e.to_s()
      e.backtrace.each do |bt |
        e_str += bt + " \n"
      end
      @@last_error = e_str
      p e_str
      SystemUtils.log_output(e_str,10)
    end
    
  def SystemUtils.last_error
      return @@last_error
  end
    
  def SystemUtils.level
      return @@level
    end
  def SystemUtils.debug
       return @@debug
     end
     
  def SystemUtils.run_system(cmd)
    @@last_error=""
      begin
        cmd = cmd + " 2>&1"
        res= %x<#{cmd}>
        SystemUtils.debug_output("Run " + cmd + " Result:", res)
          
        return res        
      rescue Exception=>e
        SystemUtils.log_exception(e)
        return "Error: " +e.to_s
      end
    end   
def SystemUtils.get_default_domain
    if File.exists?(SysConfig.DefaultDomainnameFile)
        return File.read(SysConfig.DefaultDomainnameFile)
    else
       return "engines"
    end
end

#@return [Hash] completed dns service_hash for engine on the engines.internal dns for
#@param engine [ManagedContainer] 
def SystemUtils.create_dns_service_hash(engine)
  service_hash = Hash.new
  
      service_hash[:publisher_namespace] = "EnginesSystem"
      service_hash[:type_path] = 'dns'
      service_hash[:parent_engine]=engine.containerName
        
        service_hash[:variables] = Hash.new
        service_hash[:variables][:parent_engine]= engine.containerName
        
          if engine.ctype == "service"
            service_hash[:variables][:hostname]=engine.hostName
          else
            service_hash[:variables][:hostname]=engine.containerName
          end
        service_hash[:variables][:name]=service_hash[:variables][:hostname]
        service_hash[:container_type]=engine.ctype
        service_hash[:variables][:ip]=engine.get_ip_str.to_s
      
        service_hash[:service_handle]=service_hash[:variables][:name]
  p :created_dns_service_hash
  p service_hash        
          return service_hash
end

#@return [Hash] completed nginx service_hash for engine on for the default website configured for
#@param engine [ManagedContainer] 
def SystemUtils.create_nginx_service_hash(engine)

  proto ="http_https"
  case engine.protocol
  when :https_only
    proto="https"
  when :http_and_https
    proto ="http_https"
  when :http_only
    proto="http"
  end
  #
  #    p :proto
  #    p proto

  service_hash = Hash.new()
  service_hash[:variables] = Hash.new
  service_hash[:parent_engine]=engine.containerName
  service_hash[:variables][:parent_engine]=engine.containerName
  service_hash[:variables][:name]=engine.containerName
  service_hash[:service_handle] =  engine.fqdn
  service_hash[:container_type]=engine.ctype
  service_hash[:variables][:fqdn]=engine.fqdn
  service_hash[:variables][:port]=engine.port.to_s
  service_hash[:variables][:proto]= proto
  service_hash[:type_path] = 'nginx'
  service_hash[:publisher_namespace] = "EnginesSystem"
  SystemUtils.debug_output("create nginx Hash",service_hash)
  return service_hash

  
end
end