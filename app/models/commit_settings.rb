class CommitSettings < ActiveRecord::Base

  def self.instance
    first_or_create
  end

end
