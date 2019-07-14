console.log('hello');
document.querySelector('.company_photo_cache').classList.add('d-none');
document.querySelector('.company_preuve_cache').classList.add('d-none');


const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('photo-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.querySelector('#company-photo-box .form-group').classList.add('d-none');
    document.getElementById('photo-preview').classList.remove('d-none');
  }
}
const input = document.getElementById('upload-company-photo');
if (input) {
  console.log('yes');
  console.log(input);
  // we add a listener to know when a new picture is uploaded
  input.addEventListener('change', () => {
    // we call the displayPreview function (who retrieve the image url and display it)
    console.log('hello2');
    displayPreview(input);
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






