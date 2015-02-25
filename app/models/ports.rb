class Port < ActiveRecord::Base
  belongs_to :blueprint_version
  enum protocol: [:tcp , :udp]

  def as_json(options={})
    options[:except] ||= [:created_at, :updated_at, :id, :record_label, :record_comment, :blueprint_version_id]
    super
  end 

end
