class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :weekly_goal
      t.integer :longest_run

      t.timestamps
    end
  end
end
