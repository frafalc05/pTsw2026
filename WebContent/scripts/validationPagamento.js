document.addEventListener("DOMContentLoaded", function () {
	console.log("VALIDATION JS CARICATO");
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

    form.addEventListener("submit", function (event) {
		console.log("SUBMIT INTERCETTATO");
        let valido = true;

        rimuoviErrore(nomeDestinatario);
        rimuoviErrore(indirizzo);
        rimuoviErrore(citta);
        rimuoviErrore(cap);
        rimuoviErrore(numeroCarta);
        rimuoviErrore(scadenza);
        rimuoviErrore(cvv);

        if (nomeDestinatario.value.trim() === "") {
            mostraErrore(nomeDestinatario, "Nome destinatario obbligatorio");
            valido = false;
        }

        if (indirizzo.value.trim() === "") {
            mostraErrore(indirizzo, "Indirizzo obbligatorio");
            valido = false;
        }

        if (citta.value.trim() === "") {
            mostraErrore(citta, "Città obbligatoria");
            valido = false;
        }

        if (!capRegex.test(cap.value.trim())) {
            mostraErrore(cap, "CAP non valido (5 numeri)");
            valido = false;
        }
		/*toglie gli spazi*/
        if (!cartaRegex.test(numeroCarta.value.replace(/\s/g, ""))) {
            mostraErrore(numeroCarta, "Numero carta non valido");
            valido = false;
        }

        if (!cvvRegex.test(cvv.value.trim())) {
            mostraErrore(cvv, "CVV non valido");
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
});