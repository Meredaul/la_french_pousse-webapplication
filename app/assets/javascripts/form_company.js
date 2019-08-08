if (document.querySelector('.company_photo_cache')){
document.querySelector('.company_photo_cache').classList.add('d-none');
}
// if (document.querySelector('.company_preuve_cache')){
//   document.querySelector('.company_preuve_cache').classList.add('d-none');
// }


// // NOUVELLE POUSSE
const displayPreviewCreation = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('photo-preview-creation').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.querySelector('#home-pouss-modal-body #company-photo-box .form-group').classList.add('d-none');
    document.getElementById('photo-preview-creation').classList.remove('d-none');
  }
}
const inputCreation = document.querySelector('#upload-company-photo-creation');
console.log(inputCreation);
if (inputCreation) {
  // we add a listener to know when a new picture is uploaded
  inputCreation.addEventListener('change', () => {
    // we call the displayPreview function (who retrieve the image url and display it)
    displayPreviewCreation(inputCreation);
  })
}
// GESTION POUSSE
const displayPreviewGestion = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('photo-preview-gestion').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.querySelector('.corps-gestion #company-photo-box .form-group').classList.add('d-none');
    document.getElementById('photo-preview-gestion').classList.remove('d-none');
  }
}
const inputGestion = document.querySelector('#upload-company-photo-gestion');
console.log(inputGestion);
if (inputGestion) {
  // we add a listener to know when a new picture is uploaded
  inputGestion.addEventListener('change', () => {
    // we call the displayPreview function (who retrieve the image url and display it)
    displayPreviewGestion(inputGestion);
  })
}



// CATEGORY SELECTION
var categoryChoices = document.querySelectorAll('.category-choice');

categoryChoices.forEach((categoryChoice)=>{
  categoryChoice.addEventListener("click", (event)=>{

    if (event.currentTarget.classList.contains('active')){
      event.currentTarget.classList.remove('active');
    }
    else{
      categoryChoices.forEach((categoryChoice)=>{
        categoryChoice.classList.remove('active');
      });
      event.currentTarget.classList.add('active');
    }
  });
});






