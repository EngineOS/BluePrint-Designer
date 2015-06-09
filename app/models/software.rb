class Software < ActiveRecord::Base

  attr_accessor :_destroy

  belongs_to :publisher
  belongs_to :framework
  belongs_to :language
  belongs_to :license
  belongs_to :deployment_type
  
  has_many :software_versions, dependent: :destroy

  has_many :blueprint_versions, through: :software_versions

  validates :full_title, presence: true
  validate :validate_uniqueness_of_handle

  def to_handle
    publisher.to_handle + '/' + title.downcase.gsub(' ', '_')
  end

  def title
    if short_title.present? && short_title.gsub(' ', '').present?
      short_title
    else
      full_title
    end
  end

  def default_engine_name
    title.downcase.gsub(' ', '_').gsub(/[^a-z_]/, "").first(16)
  end

  def to_label
    publisher.to_label + ' ' + full_title
  end

  def validate_uniqueness_of_handle
    if Software.all.where.not(id: id).map(&:to_handle).include?(to_handle)
      errors.add(:full_title, ["Full title", "must be unique for publisher #{publisher.to_label}"])
    end
  end

end
