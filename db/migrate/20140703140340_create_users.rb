class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :password_digest, null: false
      t.integer :nausea
      t.integer :happiness
      t.integer :tickets
      t.integer :height

      t.timestamps null: false
    end
  end

end
