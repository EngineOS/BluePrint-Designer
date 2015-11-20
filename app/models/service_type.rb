class ServiceType < ActiveRecord::Base
  has_many :services, dependent: :destroy

  validates :path, :path, presence: true

  def to_handle
    name.downcase.gsub(' ', '_')
  end

  def to_label
    "#{name} (#{path})"
  end

  # def path_without_filename
  #   path.split('/')[0..-2].join('/')
  # end
  
  def filename
    path.split('/').last
  end
  
end