document.addEventListener("DOMContentLoaded", function () {
    const bottoni = document.querySelectorAll(".btn-add-carrello");

    bottoni.forEach(function (bottone) {
        bottone.addEventListener("click", function () {
            const id = bottone.getAttribute("data-id");
            const inputQuantita = document.getElementById("qta-" + id);
            const quantita = inputQuantita ? inputQuantita.value : 1;
            const testoOriginale = bottone.textContent;

            mostraMessaggioProdotto(bottone, "", "");

            bottone.disabled = true;
            bottone.textContent = "Aggiungo...";

            fetch("CarrelloServlet", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: "action=add&id=" + encodeURIComponent(id) + "&quantita=" + encodeURIComponent(quantita)
            })
            .then(function (response) {
                return response.text();
            })
            .then(function (text) {
                let data;

                try {
                    data = JSON.parse(text);
                } catch (e) {
                    console.error("Risposta non JSON:", text);
                    mostraMessaggioProdotto(bottone, "Errore durante l'aggiunta al carrello.", "errore");
                    bottone.textContent = testoOriginale;
                    bottone.disabled = false;
                    return;
                }

                if (data.errore) {
                    mostraMessaggioProdotto(bottone, data.errore, "errore");
                    bottone.textContent = testoOriginale;
                    bottone.disabled = false;
                    return;
                }

                const badge = document.getElementById("carrello-count");

                if (badge) {
                    badge.textContent = data.totaleArticoli;
                    badge.style.display = "inline-block";
                }

                bottone.textContent = "Aggiunto";
                mostraMessaggioProdotto(bottone, "Prodotto aggiunto al carrello.", "successo");

                setTimeout(function () {
                    bottone.textContent = testoOriginale;
                    bottone.disabled = false;
                }, 1000);
            })
            .catch(function (error) {
                console.error("Errore fetch:", error);
                mostraMessaggioProdotto(bottone, "Errore tecnico durante l'aggiunta al carrello.", "errore");
                bottone.textContent = testoOriginale;
                bottone.disabled = false;
            });
        });
    });
});

function mostraMessaggioProdotto(bottone, testo, tipo) {
    const contenitore = bottone.closest(".prodotto-info");

    if (!contenitore) {
        return;
    }

    let messaggio = contenitore.querySelector(".messaggio-carrello");

    if (!messaggio) {
        messaggio = document.createElement("p");
        messaggio.classList.add("messaggio-carrello");
        contenitore.appendChild(messaggio);
    }

    messaggio.textContent = testo;
    messaggio.classList.remove("messaggio-successo", "messaggio-errore");

    if (tipo === "successo") {
        messaggio.classList.add("messaggio-successo");
    }

    if (tipo === "errore") {
        messaggio.classList.add("messaggio-errore");
    }

    if (testo !== "") {
        setTimeout(function () {
            messaggio.textContent = "";
            messaggio.classList.remove("messaggio-successo", "messaggio-errore");
        }, 2500);
    }
}