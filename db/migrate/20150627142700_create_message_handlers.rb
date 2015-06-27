class CreateMessageHandlers < ActiveRecord::Migration
  def change
    create_table :message_handlers do |t|

      t.timestamps null: false
    end
  end
end
