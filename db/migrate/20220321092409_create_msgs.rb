class CreateMsgs < ActiveRecord::Migration[5.2]
  def change
    create_table :msgs do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
