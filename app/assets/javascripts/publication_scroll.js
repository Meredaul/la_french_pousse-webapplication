function scrollLastPublicationIntoView() {
  console.log('scrolling publication to last');

  var publications = document.querySelectorAll('.home-company-publications .publication');
  var lastPublication = publications[publications.length - 1];
  if (lastPublication !== undefined) {
    lastPublication.scrollIntoView();
  }
}

function pousseScrollLastPublicationIntoView(pouss_id){
  console.log('scrolling pousse publication to last');
  var poussePublications = document.querySelectorAll(`[data-company-id="${pouss_id}"] .publication`);
  var lastPoussePublication = poussePublications[poussePublications.length - 1];
  if (lastPoussePublication !== undefined) {
    lastPoussePublication.scrollIntoView();
  }
}
