var founderReadButtons = document.querySelectorAll('.founder-read-button');

founderReadButtons.forEach((founderReadButton)=>{
  founderReadButton.addEventListener('click', (event)=>{
    founderReadButton.classList.add('active');
  })
})
