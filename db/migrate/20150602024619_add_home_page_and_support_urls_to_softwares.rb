class AddHomePageAndSupportUrlsToSoftwares < ActiveRecord::Migration
  def change
    add_column :softwares, :home_page_url, :string
    add_column :softwares, :support_page_url, :string
    add_column :softwares, :about, :text
  end
end
