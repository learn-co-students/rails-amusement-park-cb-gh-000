class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :happiness
      t.integer :tickets
      t.integer :height
      t.integer :nausea

      t.timestamps
    end
  end
end
