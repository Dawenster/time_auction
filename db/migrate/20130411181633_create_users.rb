class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :time_donated, :default => 0
      t.string :password_digest
      t.boolean :admin, :default => false

      t.timestamps
    end
  end
end
