class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.boolean :forSend

      t.timestamps null: false
    end
  end
end
