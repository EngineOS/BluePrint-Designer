class Worker < ActiveRecord::Base
  belongs_to :blueprint_version

  def as_json(options={})
    options[:except] ||= [:created_at, :updated_at, :id, :blueprint_version_id]
    super
  end

  def to_label
    name
  end

end
