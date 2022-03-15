App.chat = App.cable.subscriptions.create("ChatChannel",{
  connected: function(){
  //alert(" hey, this raju")
    console.log("Connected to the chat channel");
  },
  disconnected: function(){
    console.log("Disconnected to the chat channel");
  },
  received: function(data){
    var messages = $('#chatbox');
    messages.append(data['message']);
    messages.scrollTop(messages[0].scrollHeight);
  }
});
