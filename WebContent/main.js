var modal = document.getElementById("Modal");

var modalBtn1 = document.getElementById("modalbtn1");

var modalBtn2 = document.getElementById("modalbtn2");

var closeBtn = document.getElementsByClassName("closeBtn")[0];

var submitButton = document.getElementById("submitButton");

var ModalForm =  document.getElementById("ModalForm");
 
modalBtn1.addEventListener('click', openModal);

modalBtn2.addEventListener('click', openModal);

closeBtn.addEventListener('click', closeModal);

window.addEventListener('click', outsideClick);

function openModal() {
	
		modal.style.display = 'block';
		
	
}


function closeModal() {
	modal.style.display = 'none';
	
}

function outsideClick(e) {
	if(e.target == modal) {
		modal.style.display = 'none';
	}
}


