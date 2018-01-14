class CreateRides < ActiveRecord::Migration
  # Write your migrations here
  def change
    create_table :rides do |t|
     t.integer :user_id
     t.integer :attraction_id
   end
  end
end
