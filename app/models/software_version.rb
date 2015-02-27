class SoftwareVersion < ActiveRecord::Base

  attr_accessor :_destroy

  belongs_to :software

  has_many :blueprint_versions, dependent: :destroy
  
  # validates :record_label, presence: true
  # validates_uniqueness_of :record_label, :case_sensitive => false

  def to_handle
    software.to_handle + ' ' + version.downcase.gsub(' ', '_')
  end

  def to_label
    software.to_label + ' ' + version
  end

end
