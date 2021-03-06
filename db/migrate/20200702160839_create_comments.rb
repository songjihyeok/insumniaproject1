class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id
      t.reference :post
      
      t.timestamps
    end
    add_index :comments, :user_id
  end
end
