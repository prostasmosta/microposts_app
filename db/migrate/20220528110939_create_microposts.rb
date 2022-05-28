class CreateMicroposts < ActiveRecord::Migration[7.0]
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, null: false, index: true

      t.timestamps
    end
    add_foreign_key :microposts, :users
    add_index :microposts, [:user_id, :created_at]
  end
end
