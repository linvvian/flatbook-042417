class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :github, default: nil
      t.references :cohort, foreign_key: true
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
