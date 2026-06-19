document.addEventListener("DOMContentLoaded", function () {
    const bottoni = document.querySelectorAll(".btn-add-carrello");

    bottoni.forEach(function (bottone) {
        bottone.addEventListener("click", function () {
            const id = bottone.getAttribute("data-id");
            const inputQuantita = document.getElementById("qta-" + id);
            const quantita = inputQuantita ? inputQuantita.value : 1;

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
                console.log("Risposta servlet:", text);

                let data;

                try {
                    data = JSON.parse(text);
                } catch (e) {
                    alert("Errore: la servlet non ha restituito JSON. Guarda Console Eclipse.");
                    return;
                }

                if (data.errore) {
                    alert("Errore servlet: " + data.errore);
                    return;
                }

                const badge = document.getElementById("carrello-count");

                if (badge) {
                    badge.textContent = data.totaleArticoli;
                    badge.style.display = "inline-block";
                }

                alert("Prodotto aggiunto al carrello!");
            })
            .catch(function (error) {
                console.error("Errore fetch:", error);
                alert("Errore tecnico durante l'aggiunta al carrello.");
            });
        });
    });
});