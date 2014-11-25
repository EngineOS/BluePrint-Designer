class Software < ActiveRecord::Base
  
 belongs_to :owner
  
 has_one :swframeworks
 has_one :langauge
 has_one :blocking_worker, dependent: :destroy
 has_one :published_software, dependent: :destroy
 has_one :license
 has_one :softwaredeploytype


 has_many :softwareservices
 has_many :persistantdirs , dependent: :destroy
 has_many :replacementstrings, dependent: :destroy
 has_many :persistantfiles, dependent: :destroy
 has_many :installedpackages, dependent: :destroy
 has_many :ospackages, dependent: :destroy
 has_many :cron_jobs, dependent: :destroy
 has_many :work_ports, dependent: :destroy
 has_many :worker_commands, dependent: :destroy
 has_many :environment_variables, dependent: :destroy
 has_many :rake_tasks, dependent: :destroy
 has_many :template_files, dependent: :destroy
 has_many :file_write_permissions, dependent: :destroy
 has_many :custom_php_inis, dependent: :destroy
 has_many :apache_htaccess_files, dependent: :destroy
 
 validates :name, presence: true, length: { minimum: 5}
 validates :description, presence: true, length: { minimum: 15}

   enum http_protocol: [:http_only, :http_and_https, :https_only]
   
 def langauge_name
   lang = Langauge.where("id = " + self.langauge_id.to_s)
   l = lang[0]
   return l.name
 end
 def swframework_name
   swf = Swframework.where("id = " + self.swframework_id.to_s)
     return swf.first.name
  
 end
  def license_name
    lic = License.where("id = " + self.license_id.to_s)  
        return  lic.first.name
  end
  
def license_sourceurl
   lic = License.where("id = " + self.license_id.to_s)  
       return  lic.first.sourceurl
 end

 
 def have_custom_start_script
   if custom_start_script ==nil  || custom_start_script.length <1
     return false
   else
     return true
  end
 end
 
 def have_custom_install_script
   if custom_install_script ==nil  || custom_install_script.length <1
        return false
      else
        return true
   end
 end
 def   have_custom_post_install_script
   if custom_install_script ==nil  || custom_post_install_script.length <1
        return false
      else
        return true
   end
 end
 
 

end
