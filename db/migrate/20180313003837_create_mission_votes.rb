class CreateMissionVotes < ActiveRecord::Migration
  def change
    create_table :mission_votes do |t|
      t.string :vote
      t.integer :user_id
      t.integer :mission_id

      t.timestamps

    end
  end
end
