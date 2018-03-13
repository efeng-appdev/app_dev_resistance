class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.integer :total_passes
      t.integer :total_fails
      t.string :outcome
      t.integer :total_approve
      t.integer :total_disapprove
      t.boolean :mission_approved

      t.timestamps

    end
  end
end
