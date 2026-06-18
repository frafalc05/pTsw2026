document.addEventListener("DOMContentLoaded", function() {
    
    // Seleziona tutti i pulsanti con la classe .btn-add-carrello
    document.querySelectorAll(".btn-add-carrello").forEach(bottone => {
        
        bottone.addEventListener("click", function() {
            // Recupera l'ID del prodotto dal pulsante e la quantità dall'input
            const idProdotto = this.getAttribute("data-id");
            const quantita = document.getElementById(`qta-${idProdotto}`).value;

            // Chiamata AJAX base alla Servlet usando l'URL standard
            fetch("CarrelloServlet", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: `action=add&id=${idProdotto}&quantita=${quantita}`
            })
            .then(res => res.json())
            .then(data => {
                // Aggiorna il numero nell'header modificando il testo del DOM
                document.getElementById("quantita-carrello").innerText = `(${data.totaleArticoli})`;
            });
            
        });
    });
});