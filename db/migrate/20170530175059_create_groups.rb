class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.integer :creator_id

      t.timestamps
    end
  end
end
