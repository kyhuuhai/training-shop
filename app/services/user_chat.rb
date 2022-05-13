class UserChat
  def self.creat_room_chat(room_name, user_id)
    Room.create!(name: room_name, user_id: user_id)
  end
end
