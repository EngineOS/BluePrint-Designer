class AddCommentToLicense < ActiveRecord::Migration
  def change
    add_column :licenses, :comment,:text
  end
end
