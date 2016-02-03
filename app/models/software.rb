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
  validates :short_title, presence: true
  validates :language_id, presence: true
  validates :license, presence: true
  validates :framework, presence: true
  validates :deployment_type, presence: true
  validates :publisher, presence: true

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

  def self.search(search)
    where("short_title LIKE ?", "%#{search}%")
    where("full_title LIKE ?", "%#{search}%")
  end

end
