class Worker < ActiveRecord::Base
  belongs_to :blueprint_version
  attr_accessor :_destroy
end
