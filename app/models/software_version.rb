class SoftwareVersion < ActiveRecord::Base

  attr_accessor :_destroy

  belongs_to :software

  has_many :blueprint_versions, dependent: :destroy

  validates :version, presence: true
  validates :software_id, presence: true

  def to_handle
    software.to_handle + ' ' + version.downcase.gsub(' ', '_')
  end

  def to_label
    software.to_label + ' ' + version
  end

end
