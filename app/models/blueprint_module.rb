class BlueprintModule < ActiveRecord::Base

  belongs_to :blueprint_version
  belongs_to :module_type

  attr_accessor :_destroy

  def as_json(options={})
    {os_package: os_package, module_name: module_name, module_type: module_type.name}
  end 

end