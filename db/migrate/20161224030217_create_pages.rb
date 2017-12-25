
class CreatePages < ActiveRecord::Migration[5.0]
  #create table Pages
  def up
    create_table :Pages do |t|
      t.string :title
      t.string :description
      t.string :slug
      t.string :menu_label
      t.string :h1
      t.text :content
      t.integer :priority
      t.datetime :published_at
      t.boolean :published

      t.timestamps
    end

    #Delete table Pages
def down
  drop_table :Pages
end

  end
end
