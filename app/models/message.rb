class Message < ActiveRecord::Base
  self.table_name = "messages_schema.messages"

  belongs_to :conversation

  validates_presence_of :body, :recipient_ids, :sender_id
end
