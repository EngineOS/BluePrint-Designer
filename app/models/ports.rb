class Port < ActiveRecord::Base
  belongs_to :blueprint_version
  enum protocol: [:tcp , :udp]
end
