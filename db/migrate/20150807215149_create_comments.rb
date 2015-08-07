class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :email, null: false
      t.text :text, null: false
      t.references :article, index: true, null: false

      t.timestamps null: false
    end
  end
end
