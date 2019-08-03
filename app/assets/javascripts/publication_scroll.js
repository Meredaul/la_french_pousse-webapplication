function scrollLastPublicationIntoView() {
  console.log('scrolling publication to last');

  var publications = document.querySelectorAll('.home-company-publications');
  var lastPublication = publications[publications.length - 1];
  if (lastPublication !== undefined) {
    lastPublication.scrollIntoView();
  }
}

function pousseScrollLastPublicationIntoView(conversation_id){
  var poussePublications = document.querySelectorAll(`.pousse-publications`);
  var lastPoussePublication = poussePublications[poussePublications.length - 1];
  if (lastPoussePublication !== undefined) {
    lastPoussePublication.scrollIntoView();
    console.log('scrolling publication to last');
  }
}
