class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title #variable title of type string
    end
  end
end
