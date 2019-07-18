function scrollLastMessageIntoView() {
  console.log('scrolling to last');

  var messagesFromCitoyens = document.querySelectorAll('#founder-chat-box .message');
  var lastMessage = messagesFromCitoyens[messagesFromCitoyens.length - 1];
  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }

  if (founderChatButtonActor){
    let readMessageButton = document.getElementById('read-message-button');
    readMessageButton.click();
  }
}

function founderScrollLastMessageIntoView(conversation_id){
  var messagesForFounder = document.querySelectorAll(`.conversations-citoyens [data-conversation="${ conversation_id }"] .message`);
  var lastMessage = messagesForFounder[messagesForFounder.length - 1];
  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
    console.log('founder scrolling to last');
  }
}
