class Conversation < ActiveRecord::Base
  self.table_name = "messages_schema.conversations"

  has_many :messages

  validates_presence_of :participant_ids, :topic
end
