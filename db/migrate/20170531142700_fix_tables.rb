class FixTables < ActiveRecord::Migration[5.0]
  def change
    rename_table :user_events, :events_users
    rename_table :user_groups, :groups_users
  end
end
