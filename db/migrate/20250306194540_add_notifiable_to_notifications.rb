class AddNotifiableToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_reference :notifications, :notifiable, polymorphic: true, null: false
    add_column :notifications, :read, :boolean
  end
end
