class CreateResturants < ActiveRecord::Migration[5.2]
  def change
    create_table :resturants do |t|
      t.string :name
      t.string :address
      t.integer :phone_number
      t.string :category
      t.string :reviews

      t.timestamps
    end
  end
end
