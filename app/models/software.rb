class Software < ActiveRecord::Base

  attr_accessor :_destroy

  belongs_to :publisher
  
  has_many :software_versions, dependent: :destroy

  validates :record_name, presence: true
  validates_uniqueness_of :record_name, :case_sensitive => false

end
