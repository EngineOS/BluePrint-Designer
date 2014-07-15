class Softwareservice < ActiveRecord::Base
  has_one :servicetype
  belongs_to :software
  
 

end  
