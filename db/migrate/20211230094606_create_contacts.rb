class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :phone
      t.string :email
      t.string :websit
      t.string :map_area

      t.timestamps
    end
  end
end
