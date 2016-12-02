class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :description, :text # tableName, Variable, Variable type
    add_column :articles, :created_at, :datetime # or t.timestamps
    add_column :articles, :updated_at, :datetime
  end
end
