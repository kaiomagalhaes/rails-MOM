class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.boolean :forSend
      t.belongs_to :client, index: true
      t.timestamps null: false
    end
  end
end
