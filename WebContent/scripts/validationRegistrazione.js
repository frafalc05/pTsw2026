document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector(".register-form");
	const nomeInput = document.getElementById("nome");
	const cognomeInput = document.getElementById("cognome");
    const emailInput = document.getElementById("email");
    const passwordInput = document.getElementById("password");
	const confermaPasswordInput = document.getElementById("confermaPassword");
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    emailInput.addEventListener("change", function () {
        validaEmail();
    });
    form.addEventListener("submit", function (event) {
        let formatoValido = true;
		rimuoviErrore(nomeInput);
		rimuoviErrore(cognomeInput);
        rimuoviErrore(emailInput);
        rimuoviErrore(passwordInput);
		rimuoviErrore(confermaPasswordInput);
        if (!validaEmail()) {
            formatoValido = false;
        }
        if (passwordInput.value.trim() === "") {
            mostraErrore(passwordInput, "La password non può essere vuota.");
            formatoValido = false;
        }
		if (nomeInput.value.trim() === "") {
		         mostraErrore(nome, "Nome obbligatorio");
		          formatoValido = false;
		 }
		if (cognomeInput.value.trim() === "") {
		        mostraErrore(cognome, "Cognome obbligatorio");
		        formatoValido = false;
		 }
		 if (confermaPasswordInput.value !== passwordInput.value) {
		             mostraErrore(confermaPasswordInput, "Le password non coincidono.");
		             formatoValido = false;
		         }
        if (!formatoValido) {
            event.preventDefault();
        }
    });
    function mostraErrore(inputElement, messaggio) {
		inputElement.classList.add("input-errore");
        const erroreSpan = document.createElement("span");
        erroreSpan.className = "errore-validazione";
        erroreSpan.textContent = messaggio;
		inputElement.insertAdjacentElement("afterend", erroreSpan); //il messaggio d'errore è inserito subito dopo l'input
    }
    function rimuoviErrore(inputElement) {
		inputElement.classList.remove("input-errore");
		const errore = inputElement.parentNode.querySelector(".errore-validazione");

		    if (errore) {
		        errore.remove();//elimina quel tag dal DOM
		    }
    }
	function validaEmail() {
	        rimuoviErrore(emailInput);

	        if (!emailRegex.test(emailInput.value.trim())) {
	            mostraErrore(emailInput, "Il formato dell'email non è valido (es. esempio@dominio.com).");
	            return false;
	        }

	        return true;
	    }
});