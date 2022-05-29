$(document).ready(function () {
  var roomId = $("#messages").attr("room_id");
  App.room = App.cable.subscriptions.create(
    { channel: "RoomChannel", room_id: roomId },
    {
      connected: function () {},
      disconnected: function () {},
      received: function (data) {
        const current_user = sessionStorage.getItem("user_id");
        if (current_user == data["user_id"]) {
          $("#messages").append(
            '<div class="sent_msg talk-bubble round">' +
              "<p>" +
                data["message"] +
              "</p>" +
            "</div>"
          );
        } else {
          $("#messages").append(
            '<div class="received_msg talk-bubble round">' +
              "<p>" +
                data["message"] +
              "</p>" +
            "</div>"
          );
        }
      },
      speak: function (message, user_id, room_id) {
        this.perform("speak", {
          message: message,
          user_id: user_id,
          room_id: room_id,
        });
      },
    }
  );
});
