class Port < ActiveRecord::Base
  belongs_to :blueprint_version
  enum protocol: [:TCP , :UDP, :'TCP and UDP']

  def as_json(options={})
    options[:except] ||= [:created_at, :updated_at, :id, :blueprint_version_id]
    super
  end 

end
