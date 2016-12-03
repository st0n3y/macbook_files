class DropCompleted_TasksTable < ActiveRecord::Migration[5.0]
  
  def up
    drop_table :completed_tasks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end