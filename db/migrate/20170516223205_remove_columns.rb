class RemoveColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :producers, :user_name
    remove_column :attendees, :user_name
  end
end
