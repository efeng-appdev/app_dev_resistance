class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_name
      t.boolean :mission_captain
      t.integer :user_id

      t.timestamps

    end
  end
end
