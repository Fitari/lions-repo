class CreateCustomersTypes < ActiveRecord::Migration
  def change
    create_table :customers_types do |t|
      t.string :name
      t.integer :deposit
      t.integer :usage_fee
      t.integer :duration

      t.timestamps null: false
    end
  end
end
