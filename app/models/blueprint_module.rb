class BlueprintModule < ActiveRecord::Base

  belongs_to :blueprint_version
  belongs_to :module_type

  attr_accessor :_destroy

end
