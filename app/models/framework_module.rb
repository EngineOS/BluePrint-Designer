class FrameworkModule < ActiveRecord::Base
  belongs_to :framework
  belongs_to :module_type

  def to_handle
    framework.to_handle + '_' + module_type.to_handle
  end

  def to_label
    framework.to_label + ' - ' + module_type.to_label
  end
  
end
