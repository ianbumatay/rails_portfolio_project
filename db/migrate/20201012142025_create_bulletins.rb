class CreateBulletins < ActiveRecord::Migration[6.0]
  def change
    create_table :bulletins do |t|
      t.string :title 
      t.string :content 
      t.integer :rating
      t.integer :user_id 
      t.integer :board_id

      t.timestamps
    end
  end
end
