function focusPublicationInput() {
  console.log('focus publication input');

  var publicationInput = document.getElementById('publication_content');
  if (publicationInput ) {//!== undefined
    publicationInput.focus();
  }
}

// function pousseFocusPublicationInput(pouss_id){
//   console.log('focus pousse publication input');
//   var poussePublications = document.querySelectorAll(`[data-company-id="${pouss_id}"] .publication`);
//   var lastPoussePublication = poussePublications[poussePublications.length - 1];
//   if (lastPoussePublication !== undefined) {
//     lastPoussePublication.scrollIntoView();
//   }
// }
