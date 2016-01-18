class SystemPackage < ActiveRecord::Base
  belongs_to :blueprint_version

  validates :package, presence: true

  def to_label
    package
  end

end
