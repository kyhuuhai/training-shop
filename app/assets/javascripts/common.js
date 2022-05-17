$(document).ready(function() {
  $(document).on('keypress', '.write_msg', function(event) {
    if (event.keyCode === 13) {
      if (!event.target.value.trim().length) {
        return 0;
      }
      App.room.speak(event.target.value,
        $("#user_id").val(),
        $("#messages").attr("room_id")
      );
      sessionStorage.setItem('user_id', $("#user_id").val())
      event.target.value = '';
      var chatHistory = document.getElementById("messages");
      chatHistory.scrollTop = chatHistory.scrollHeight;
      return event.preventDefault();
    }
  });
});
