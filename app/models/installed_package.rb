class InstalledPackage < ActiveRecord::Base
  belongs_to :blueprint_version
end
