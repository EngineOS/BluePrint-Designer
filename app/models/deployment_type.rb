class DeploymentType < ActiveRecord::Base

  def to_handle
    name.downcase.gsub(' ', '_')
  end

  def to_label
    name
  end
  
end
