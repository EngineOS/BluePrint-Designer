class SoftwareVersion < ActiveRecord::Base

  attr_accessor :_destroy
  
  belongs_to :framework
  belongs_to :language
  belongs_to :license
  belongs_to :deployment_type

  belongs_to :software

  has_many :blueprint_versions, dependent: :destroy
  
  validates :record_name, presence: true
  validates_uniqueness_of :record_name, :case_sensitive => false

end
