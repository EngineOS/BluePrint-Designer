class SystemPackage < ActiveRecord::Base
  belongs_to :blueprint_version

  validates :package, presence: true

  def as_json(options={})
    options[:except] ||= [:created_at, :updated_at, :id, :blueprint_version_id]
    super
  end 

  def to_label
    package
  end


end
