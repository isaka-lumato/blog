class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :comments_counter, default: 0, null: false

      t.timestamps
    end
  end
end
