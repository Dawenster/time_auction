class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :auction
      t.references :user
      t.timestamps
    end
  end
end
