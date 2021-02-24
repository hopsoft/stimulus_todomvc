class AddUsersToTodo < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :user, :Integer
  end
end
