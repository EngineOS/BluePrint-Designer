class Port < ActiveRecord::Base
  belongs_to :blueprint_version
  enum protocol: [:TCP , :UDP, :'TCP and UDP']

end
