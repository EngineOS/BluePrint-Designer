class WorkPort < ActiveRecord::Base
  belongs_to :software
  enum protocol: [:tcp , :udp]
end
