class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.references :imageable, :polymorphic => true
      t.timestamps
    end
  end
end
