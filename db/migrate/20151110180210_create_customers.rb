class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :fname
      t.string :lname
      t.string :tz
      t.string :gender
      t.string :address
      t.references :city
      t.string :zipcode
      t.string :email
      t.string :phone
      t.references :customers_type, default: 1
      t.text :notes

      t.timestamps null: false

      #add_index :customers, :customer_type_id
      #add_index :customers, :city_id
    end
  end
end
