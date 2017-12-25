class AddDetailsToPages < ActiveRecord::Migration[5.0]
  #add new fields to table page
  def change
    add_column :Pages, :published, :boolean
    add_column :Pages, :published_at, :datetime
  end
end
