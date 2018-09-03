class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :duration, null: false
      t.string :owner, null: false

      t.timestamps
    end
  end
end
