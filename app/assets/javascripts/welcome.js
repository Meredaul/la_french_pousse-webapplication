if (document.querySelector('.user_photo_cache')){
document.querySelector('.user_photo_cache').classList.add('d-none');
}

const displayPreviewProfil = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('photo-profil-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.querySelector('#citoyen-photo-box .form-group').classList.add('d-none');
    document.getElementById('photo-profil-preview').classList.remove('d-none');
  }
}
const inputProfil = document.getElementById('upload-citoyen-photo');
if (inputProfil) {
  console.log(inputProfil);
  // we add a listener to know when a new picture is uploaded
  inputProfil.addEventListener('change', () => {
    // we call the displayPreview function (who retrieve the image url and display it)
    displayPreviewProfil(inputProfil);
  })
}
