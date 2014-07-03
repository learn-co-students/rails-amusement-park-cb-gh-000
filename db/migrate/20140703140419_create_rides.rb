class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.integer :customer_id
      t.integer :attraction_id
    end
  end
end
