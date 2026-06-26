document.addEventListener("DOMContentLoaded", function () {

    const bottoni = document.querySelectorAll(".btn-add-carrello");

    bottoni.forEach(function (bottone) {

        bottone.addEventListener("click", function () {
            const id = bottone.getAttribute("data-id");
            const inputQuantita = document.getElementById("qta-" + id);
            const quantita = inputQuantita ? inputQuantita.value : 1;
            const testoOriginale = bottone.textContent;

            bottone.disabled = true;
            bottone.textContent = "Aggiungo";

            const xhr = new XMLHttpRequest();

            xhr.open("POST", "CarrelloServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {

                    let data;

                    try {
                        data = JSON.parse(xhr.responseText);
                    } catch (e) {
                        console.error("Risposta non JSON:", xhr.responseText);
                        mostraMessaggioProdotto(bottone, "Errore durante l'aggiunta al carrello.", "errore");
                        bottone.textContent = testoOriginale;
                        bottone.disabled = false;
                        return;
                    }

                    if (xhr.status === 200) {
						const badge = document.getElementById("carrello-count");

						   if (badge) {
						       badge.textContent = data.totaleArticoli;
						       
						   }

                        bottone.textContent = "Aggiunto";
                        mostraMessaggioProdotto(bottone, "Prodotto aggiunto al carrello.", "successo");

                        setTimeout(function () {
                            bottone.textContent = testoOriginale;
                            bottone.disabled = false;
                        }, 1000);

                    } else {
                        console.error("Errore HTTP:", xhr.status);
                        mostraMessaggioProdotto(bottone, "Errore tecnico durante l'aggiunta al carrello.", "errore");
                        bottone.textContent = testoOriginale;
                        bottone.disabled = false;
                    }
                }
            };

			xhr.send("action=add&id=" + id + "&quantita=" + quantita);

        });
    });
});
function mostraMessaggioProdotto(bottone, testo, tipo) {

    const contenitore = bottone.closest(".prodotto-info");

    if (!contenitore) return;

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
        }, 1000);
    }
}
function ricalcola(input) {
    const row = input.closest('.prodotto-row');
    const prezzo = parseFloat(row.getAttribute('data-prezzo'));
    const qta = parseInt(input.value) || 1;
    const id = row.getAttribute('data-id');

    if (qta < 1) return;

    row.querySelector('.subtotale-valore').innerText = (prezzo * qta).toFixed(2);

    let totaleGenerale = 0;
    document.querySelectorAll('.prodotto-row').forEach(r => {
        const p = parseFloat(r.getAttribute('data-prezzo'));
        const q = parseInt(r.querySelector('.qta-input').value) || 1;
        totaleGenerale += (p * q);
    });

    document.getElementById('prezzo-totale-complessivo').innerText =
        totaleGenerale.toFixed(2);

		const xhr = new XMLHttpRequest();
		xhr.open("POST", "CarrelloServlet", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

		xhr.send("action=update&id=" + id +"&quantita=" + qta);
}