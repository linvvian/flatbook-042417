class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.text :content
      t.references :project, foreign_key: true, default: nil
      t.references :event, foreign_key: true, default: nil
      t.references :group, foreign_key: true, default: nil
      t.references :user, foreign_key: true, default: nil
      
      t.timestamps
    end
  end
end
