class Softwareservice < ActiveRecord::Base
  has_one :servicetype
  belongs_to :software
  has_many :service_environment_variables
 def servicetype_name
   st = Servicetype.where("id = " + self.servicetype_id.to_s)
      
      return st.first.name      
 end

end  
