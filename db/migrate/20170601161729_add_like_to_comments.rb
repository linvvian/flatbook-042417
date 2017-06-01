class AddLikeToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :likes, :integer, default: 0
    add_column :comments, :dislikes, :integer, default: 0
  end
end
