class Softwareservice < ActiveRecord::Base
  has_one :servicetype
  belongs_to :software
  
 def servicetype_name
   st = Servicetype.where("id = " + self.servicetype_id.to_s)
      
      return st.first.name      
 end

end  
