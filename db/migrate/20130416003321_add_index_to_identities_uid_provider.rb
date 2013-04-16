class AddIndexToIdentitiesUidProvider < ActiveRecord::Migration
  def change
    add_index :identities, [:uid, :provider]
  end
end
