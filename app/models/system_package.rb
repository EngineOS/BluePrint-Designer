class SystemPackage < ActiveRecord::Base
  belongs_to :blueprint_version

  def as_json(options={})
    options[:except] ||= [:created_at, :updated_at, :id, :record_label, :record_comment, :blueprint_version_id]
    super
  end 

end
