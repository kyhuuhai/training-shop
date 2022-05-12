$(document).ready(function() {
  var roomId = $('#messages').attr('room_id');
  App.room = App.cable.subscriptions.create({channel: "RoomChannel", room_id: roomId}, {
    connected: function() {
      console.log("oke roi do"+roomId)
    },
    disconnected: function() {},
    received: function(data) {
      console.log("da nhan duoc roi")
      $('#messages').append(data['message']);
      
      
    },
    speak: function(message, user_id, room_id) {
      console.log(message)
      this.perform('speak', {
        message: message,
        user_id: user_id,
        room_id: room_id
      });
    }
  });
});
