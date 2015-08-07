class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false, limit: 128
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
