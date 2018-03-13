class CreateMissionParticipants < ActiveRecord::Migration
  def change
    create_table :mission_participants do |t|
      t.integer :user_id
      t.integer :mission_id
      t.string :pass_or_fail

      t.timestamps

    end
  end
end
