class CreateRides < ActiveRecord::Migration
  # Write your migrations here
  def change
    create_table :rides do |t|
      t.references :user, index: true
      t.references :attraction, index: true
    end
  end
end
