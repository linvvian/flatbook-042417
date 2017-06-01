class CreateThumbs < ActiveRecord::Migration[5.0]
  def change
    create_table :thumbs do |t|
      t.boolean :like
      t.references :comment, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
