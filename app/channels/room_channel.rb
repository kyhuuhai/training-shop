class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params[:room_id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! content: data["message"],
                    user_id: data["user_id"],
                    room_id: data["room_id"]
    ActionCable.server.broadcast "room_#{params[:room_id]}_channel",
                                 message: data["message"],
                                 user_id: data["user_id"],
                                 room_id: data["room_id"]
  end
end
