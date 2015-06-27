class CreateMessageSenders < ActiveRecord::Migration
  def change
    create_table :message_senders do |t|
      t.boolean :sent

      t.timestamps null: false
    end
  end
end
