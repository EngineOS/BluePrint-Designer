require 'cfoundry'

class PassController

  def initialize(userid)
    @userid = userid
#owner
  @cfhandle = CFoundry::Client.new endpoint
  #for now static assigned but will get cred key from user table cred token and not the user name password below 
  username ="admin"
  password ="EPAdmin"
  @cfhandle.login username, password
#space
    client.services.collect { |x| x.description }
  end
 
  
end