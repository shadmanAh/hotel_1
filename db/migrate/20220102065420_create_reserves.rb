class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :check_in
      t.date :check_out
      t.integer :adults
      t.integer :children
      t.string :phone_num

      t.timestamps
    end
  end
end
