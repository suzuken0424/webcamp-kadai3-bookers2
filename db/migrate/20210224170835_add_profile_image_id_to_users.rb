class AddProfileImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_image_id, :string#追記
  end
end
