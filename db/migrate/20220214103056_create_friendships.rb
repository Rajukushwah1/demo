
class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|

      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :confirmation

      t.timestamps
    end
  end
end
