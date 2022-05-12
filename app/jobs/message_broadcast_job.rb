class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast "room_channel",
      content: data["message"],
      user_id: data["user_id"],
      room_id: data["room_id"]
  end
end
