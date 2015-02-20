class PersistentFile < ActiveRecord::Base
  belongs_to :blueprint_version
end
