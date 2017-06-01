class RemoveLikesFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :likes, :integer
  end
end
