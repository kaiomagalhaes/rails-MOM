class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.boolean :for_send
      t.boolean :sent
      t.boolean :message_invalid
      t.belongs_to :client, index: true
      t.timestamps null: false
    end
  end
end
