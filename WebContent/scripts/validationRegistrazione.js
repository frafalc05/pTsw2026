document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector(".register-form");
	const nomeInput = document.getElementById("nome");
	const cognomeInput = document.getElementById("cognome");
    const emailInput = document.getElementById("email");
    const passwordInput = document.getElementById("password");
	const confermaPasswordInput = document.getElementById("confermaPassword");
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	nomeInput.addEventListener("change", validaNome);
	cognomeInput.addEventListener("change", validaCognome);
	emailInput.addEventListener("change", validaEmail);
	passwordInput.addEventListener("change", validaPassword);
	confermaPasswordInput.addEventListener("change", validaConfermaPassword);
    form.addEventListener("submit", function (event) {
        let valido = true;
		rimuoviErrore(nomeInput);
		rimuoviErrore(cognomeInput);
        rimuoviErrore(emailInput);
        rimuoviErrore(passwordInput);
		rimuoviErrore(confermaPasswordInput);
		if (!validaNome()) valido = false;
		if (!validaCognome()) valido = false;
		if (!validaEmail()) valido = false;
		if (!validaPassword()) valido = false;
		if (!validaConfermaPassword()) valido = false;
        if (!valido) {
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
		function validaNome() {
		    rimuoviErrore(nomeInput);

		    if (nomeInput.value.trim() === "") {
		        mostraErrore(nomeInput, "Nome obbligatorio");
		        return false;
		    }
		    return true;
		}
		function validaCognome() {
		    rimuoviErrore(cognomeInput);

		    if (cognomeInput.value.trim() === "") {
		        mostraErrore(cognomeInput, "Cognome obbligatorio");
		        return false;
		    }
		    return true;
		}
		function validaPassword() {
		    rimuoviErrore(passwordInput);

		    if (passwordInput.value.trim() === "") {
		        mostraErrore(passwordInput, "Password obbligatoria");
		        return false;
		    }
		    return true;
		}
		function validaConfermaPassword() {
		    rimuoviErrore(confermaPasswordInput);

		    if (confermaPasswordInput.value !== passwordInput.value) {
		        mostraErrore(confermaPasswordInput, "Le password non coincidono");
		        return false;
		    }
		    return true;
		}
});