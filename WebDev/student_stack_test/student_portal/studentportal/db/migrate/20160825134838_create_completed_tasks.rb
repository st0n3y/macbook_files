class CreateCompletedTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :completed_tasks do |t|
      t.references :student, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end