class MessageSerializer < ActiveModel::Serializer
  attributes :id, :conversation_id, :sender_id,
             :recipient_ids, :viewed_ids,
             :body, :created_at
end
