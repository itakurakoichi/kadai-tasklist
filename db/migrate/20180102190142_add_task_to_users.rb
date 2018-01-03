class AddTaskToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :task, foreign_key: true
  end
end
