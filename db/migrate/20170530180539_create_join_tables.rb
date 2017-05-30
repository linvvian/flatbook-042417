class CreateJoinTables < ActiveRecord::Migration[5.0]
  def change
    create_table :user_events do |t|
      t.references :user
      t.references :event
    end
    
    create_table :user_groups do |t|
      t.references :user
      t.references :group
    end

    create_table :user_projects do |t|
      t.references :user
      t.references :project
    end
  end
end
