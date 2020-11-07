class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :point_value
      t.string :category
      t.boolean :audible
      t.string :energy_type

      t.timestamps
    end
  end
end
