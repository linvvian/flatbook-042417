class CreateCohorts < ActiveRecord::Migration[5.0]
  def change
    create_table :cohorts do |t|
      t.string :start_date
      t.string :nickname
      t.string :module

      t.timestamps
    end
  end
end
