class Framework < ActiveRecord::Base
  has_many :software_versions
  has_many :framework_modules
  has_many :module_types, through: :framework_modules
  belongs_to :language

  accepts_nested_attributes_for :framework_modules, :reject_if => :all_blank, :allow_destroy => true


  def to_handle
    name.downcase.gsub(' ', '_')
  end

  def to_label
    name
  end
  
end
