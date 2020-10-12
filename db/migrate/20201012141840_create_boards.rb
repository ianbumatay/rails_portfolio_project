class CreateBoards < ActiveRecord::Migration[6.0] 

  def change
    create_table :boards do |t|
      t.string :month
      t.string :title 

      t.timestamps
    end
  end
end
