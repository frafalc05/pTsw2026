document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector(".login-form");
    const emailInput = document.getElementById("email");
    const passwordInput = document.getElementById("password");

    // Espressione regolare per validare il formato dell'email (Requisito Prof)
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // 1. Validazione sull'evento "change" dell'email
    emailInput.addEventListener("change", function () {
        rimuoviErrore(emailInput);
        if (!emailRegex.test(emailInput.value.trim())) {
            mostraErrore(emailInput, "Il formato dell'email non è valido (es. esempio@dominio.com).");
        }
    });

    // 2. Validazione sull'evento "submit" del form
    form.addEventListener("submit", function (event) {
        let formatoValido = true;

        // Puliamo eventuali errori precedenti prima del controllo finale
        rimuoviErrore(emailInput);
        rimuoviErrore(passwordInput);

        // Controllo Email
        if (!emailRegex.test(emailInput.value.trim())) {
            mostraErrore(emailInput, "Inserisci un'email valida prima di accedere.");
            formatoValido = false;
        }

        // Controllo Password (es. non vuota o requisiti minimi)
        if (passwordInput.value.trim() === "") {
            mostraErrore(passwordInput, "La password non può essere vuota.");
            formatoValido = false;
        }

        // Se ci sono errori, blocchiamo l'invio del form alla Servlet
        if (!formatoValido) {
            event.preventDefault();
        }
    });

    // Funzione di supporto per iniettare i messaggi di errore nel DOM (No Alert!)
    function mostraErrore(inputElement, messaggio) {
        inputElement.style.borderColor = "#9b1c1c"; // Bordo rosso sull'input
        
        // Creiamo il tag per il messaggio di errore
        const erroreSpan = document.createElement("span");
        erroreSpan.className = "errore-validazione";
        erroreSpan.style.color = "#9b1c1c";
        erroreSpan.style.fontSize = "13px";
        erroreSpan.style.fontWeight = "bold";
        erroreSpan.style.marginTop = "-10px";
        erroreSpan.style.marginBottom = "10px";
        erroreSpan.style.display = "block";
        erroreSpan.textContent = messaging;

        // Lo inseriamo subito dopo l'input corrente
        inputElement.parentNode.insertBefore(erroreSpan, inputElement.nextSibling);
    }

    // Funzione di supporto per ripulire gli errori visivi
    function rimuoviErrore(inputElement) {
        inputElement.style.borderColor = "";
        const prossimoElemento = inputElement.nextSibling;
        if (prossimoElemento && prossimoElemento.className === "errore-validazione") {
            prossimoElemento.remove();
        }
    }
});