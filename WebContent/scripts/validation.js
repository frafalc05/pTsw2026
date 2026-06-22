document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector(".login-form");
    const emailInput = document.getElementById("email");
    const passwordInput = document.getElementById("password");
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    emailInput.addEventListener("change", function () {
        rimuoviErrore(emailInput);
        if (!emailRegex.test(emailInput.value.trim())) {
            mostraErrore(emailInput, "Il formato dell'email non è valido (es. esempio@dominio.com).");
        }
    });
    form.addEventListener("submit", function (event) {
        let formatoValido = true;
        rimuoviErrore(emailInput);
        rimuoviErrore(passwordInput);
        if (!emailRegex.test(emailInput.value.trim())) {
            mostraErrore(emailInput, "Inserisci un'email valida prima di accedere.");
            formatoValido = false;
        }
        if (passwordInput.value.trim() === "") {
            mostraErrore(passwordInput, "La password non può essere vuota.");
            formatoValido = false;
        }
        if (!formatoValido) {
            event.preventDefault();
        }
    });
    function mostraErrore(inputElement, messaggio) {
        inputElement.style.borderColor = "#9b1c1c"; 
        const erroreSpan = document.createElement("span");
        erroreSpan.className = "errore-validazione";
        erroreSpan.style.color = "#9b1c1c";
        erroreSpan.style.fontSize = "13px";
        erroreSpan.style.fontWeight = "bold";
        erroreSpan.style.marginTop = "-10px";
        erroreSpan.style.marginBottom = "10px";
        erroreSpan.style.display = "block";
        erroreSpan.textContent = messaging;
        inputElement.parentNode.insertBefore(erroreSpan, inputElement.nextSibling);
    }
    function rimuoviErrore(inputElement) {
        inputElement.style.borderColor = "";
        const prossimoElemento = inputElement.nextSibling;
        if (prossimoElemento && prossimoElemento.className === "errore-validazione") {
            prossimoElemento.remove();
        }
    }
});