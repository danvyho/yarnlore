class AddContentToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications, :content, :text
  end
end
