class RemoveDislikesFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :dislikes, :integer
  end
end
