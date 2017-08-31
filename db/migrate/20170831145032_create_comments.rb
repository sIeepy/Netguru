class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :user_id
      t.integer :movie_id
      t.timestamps
    end

      add_index :comments, :user_id
      add_index :comments, :movie_id
  end
end
