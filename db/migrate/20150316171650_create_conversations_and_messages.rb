class CreateConversationsAndMessages < ActiveRecord::Migration
  def up
    execute "CREATE SCHEMA messages_schema"

    create_table "messages_schema.conversations" do |t|
      t.integer :participant_ids, array: true, default: []

      t.string :topic, null: false

      t.timestamps null: false
    end

    create_table "messages_schema.messages" do |t|
      t.references :conversation

      t.integer :recipient_ids, array: true, default: []
      t.integer :viewed_ids,    array: true, default: []

      t.integer :sender_id

      t.string :body

      t.timestamps null: false
    end

    add_index "messages_schema.conversations", :participant_ids

    add_index "messages_schema.messages", :recipient_ids
    add_index "messages_schema.messages", :sender_id
  end

  def down
    drop_table "messages_schema.conversations"
    drop_table "messages_schema.messages"
    execute "DROP SCHEMA messages_schema"
  end
end
