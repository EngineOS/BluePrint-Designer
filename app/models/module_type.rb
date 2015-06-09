class ModuleType < ActiveRecord::Base

  # has_many :blueprint_modules

  def to_handle
    name.downcase.gsub(' ', '_')
  end

  def to_label
    title.present? ? title : name.to_s.titleize
  end
  
end
