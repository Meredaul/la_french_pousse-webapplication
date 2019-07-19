const founderChatBox = document.getElementById('founder-chat-box');
if(founderChatBox){
  console.log("c'est passé");
  founderChatBox.addEventListener('transitionstart', (event)=>{
    scrollLastMessageIntoView();
  });
}
// founderChatBox.addEventListener('mouseover', (event)=>{
//   scrollLastMessageIntoView()
// });

// founderChatBox.addEventListener('focus', (event)=>{
//   scrollLastMessageIntoView()
// });

const founderChatButtonActor = document.getElementById('founder-chat-button');



var formGroupCategoryName = document.querySelector('.modal-footer .category_name');
var inputFormGroupCategoryName = document.querySelector('.modal-footer .category_name input');
const boutonPropositionCategorie = document.getElementById('bouton-proposition-categorie');
if(boutonPropositionCategorie){
  boutonPropositionCategorie.addEventListener("click", (event)=>{
    boutonPropositionCategorie.classList.add('active');
    inputFormGroupCategoryName.classList.add('d-none');
    formGroupCategoryName.insertAdjacentHTML('beforeend', '<h6 id="proposition-sent">Votre proposition a été envoyée</h6>')
  })
}
