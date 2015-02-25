class Software < ActiveRecord::Base

  attr_accessor :_destroy

  belongs_to :publisher
  
  has_many :software_versions, dependent: :destroy

  has_many :blueprint_versions, through: :software_versions

  validates :record_label, presence: true
  validates_uniqueness_of :record_label, :case_sensitive => false

end
