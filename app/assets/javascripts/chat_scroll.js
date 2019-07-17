function scrollLastMessageIntoView() {
  // var messages = document.querySelectorAll('.message');
  // var lastMessage = messages[messages.length - 1];
  // if (lastMessage !== undefined) {
  //   lastMessage.scrollIntoView();
  // }

  var messagesForFounder = document.querySelectorAll('.conversations-citoyens .message');
  var lastMessage = messagesForFounder[messagesForFounder.length - 1];
  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }

  var messagesForCitoyens = document.querySelectorAll('.message');
  var lastMessage = messagesForCitoyens[messagesForCitoyens.length - 1];
  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }
}
