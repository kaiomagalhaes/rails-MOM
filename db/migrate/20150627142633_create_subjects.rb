class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :text

      t.belongs_to :message, index: true
      t.timestamps null: false
    end
  end
end
