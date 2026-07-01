document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector(".form-checkout");

    const nomeDestinatario = document.getElementById("nome_destinatario");
    const indirizzo = document.getElementById("indirizzo");
    const citta = document.getElementById("citta");
    const cap = document.getElementById("cap");

    const numeroCarta = document.getElementById("numeroCarta");
    const scadenza = document.getElementById("scadenza");
    const cvv = document.getElementById("cvv");

    const capRegex = /^[0-9]{5}$/;
    const cartaRegex = /^[0-9]{16}$/;
    const cvvRegex = /^[0-9]{3}$/;
	nomeDestinatario.addEventListener("change", validaNome);
	indirizzo.addEventListener("change", validaIndirizzo);
	citta.addEventListener("change", validaCitta);
	cap.addEventListener("change", validaCAP);

	numeroCarta.addEventListener("change", validaCarta);
	cvv.addEventListener("change", validaCVV);

    form.addEventListener("submit", function (event) {
        let valido = true;

        rimuoviErrore(nomeDestinatario);
        rimuoviErrore(indirizzo);
        rimuoviErrore(citta);
        rimuoviErrore(cap);
        rimuoviErrore(numeroCarta);
        rimuoviErrore(scadenza);
        rimuoviErrore(cvv);

        if (!validaNome()) {
      
            valido = false;
        }

        if (!validaIndirizzo()) {
           
            valido = false;
        }

        if (!validaCitta()) {
            valido = false;
        }

        if (!validaCAP()) {
            valido = false;
        }
        if (!validaCarta()) {
            valido = false;
        }

        if (!validaCVV()) {
           
            valido = false;
        }

        if (!valido) {
            event.preventDefault();
        }
    });

    function mostraErrore(input, messaggio) {
        input.classList.add("input-errore");

        const errore = document.createElement("span");
        errore.className = "errore-validazione";
        errore.textContent = messaggio;

        input.insertAdjacentElement("afterend", errore);
    }

    function rimuoviErrore(input) {
        if (!input) return;

        input.classList.remove("input-errore");

        const errore = input.parentNode.querySelector(".errore-validazione");
        if (errore) {
            errore.remove();
        }
    }
	function validaNome() {
	    rimuoviErrore(nomeDestinatario);

	    if (nomeDestinatario.value.trim() === "") {
	        mostraErrore(nomeDestinatario, "Nome destinatario obbligatorio");
	        return false;
	    }
	    return true;
	}
	function validaIndirizzo() {
	    rimuoviErrore(indirizzo);

	    if (indirizzo.value.trim() === "") {
	        mostraErrore(indirizzo, "Indirizzo obbligatorio");
	        return false;
	    }
	    return true;
	}
	function validaCitta() {
	    rimuoviErrore(citta);
		if (citta.value.trim() === "") {
			        mostraErrore(citta, "Città obbligatoria");
			        return false;
		}
	    return true;
	}
	function validaCAP() {
	    rimuoviErrore(cap);

	    if (!capRegex.test(cap.value.trim())) {
	        mostraErrore(cap, "CAP non valido (5 numeri)");
	        return false;
	    }
	    return true;
	}
	function validaCarta() {
	    rimuoviErrore(numeroCarta);

	    const valore = numeroCarta.value.replace(/\s/g, "");

	    if (!cartaRegex.test(valore)) {
	        mostraErrore(numeroCarta, "Numero carta non valido");
	        return false;
	    }
	    return true;
	}
	function validaCVV() {
	    rimuoviErrore(cvv);

	    if (!cvvRegex.test(cvv.value.trim())) {
	        mostraErrore(cvv, "CVV non valido");
	        return false;
	    }
	    return true;
	}
});