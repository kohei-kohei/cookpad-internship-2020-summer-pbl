class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name, null: false, default: ""
      t.integer :time, null: false, default: 0

      t.timestamps
    end
  end
end
