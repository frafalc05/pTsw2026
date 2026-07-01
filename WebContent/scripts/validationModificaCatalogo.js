document.addEventListener("DOMContentLoaded", function () {

    const form = document.querySelector(".admin-product-form");

    const nomeInput = document.getElementById("nome");
    const prezzoInput = document.getElementById("prezzo");
    const quantitaInput = document.getElementById("quantita");
    const categoriaSelect = document.getElementById("categoria");
    const nuovaCategoriaInput = document.getElementById("nuovaCategoria");
    const descrizioneInput = document.getElementById("descrizione");
    const immagineInput = document.getElementById("immagine");
	nomeInput.addEventListener("change", validaNome);
	prezzoInput.addEventListener("change", validaPrezzo);
	quantitaInput.addEventListener("change", validaQuantita);
	    categoriaSelect.addEventListener("change", validaCategoria);
	    nuovaCategoriaInput.addEventListener("input", validaCategoria);
	    descrizioneInput.addEventListener("change", validaDescrizione);

    form.addEventListener("submit", function (event) {

		let valido = true;

		       if (!validaNome()) valido = false;
		       if (!validaPrezzo()) valido = false;
		       if (!validaQuantita()) valido = false;
		       if (!validaCategoria()) valido = false;
		       if (!validaDescrizione()) valido = false;

        
       
        if (!valido) {
            event.preventDefault();
        }
    });

    
    nuovaCategoriaInput.addEventListener("input", function () {

        if (nuovaCategoriaInput.value.trim().length > 0) {
            categoriaSelect.value = "";
            categoriaSelect.disabled = true;
            categoriaSelect.classList.add("input-disabled");
        } else {
            categoriaSelect.disabled = false;
            categoriaSelect.classList.remove("input-disabled");
        }
    });

  
    function mostraErrore(inputElement, messaggio) {
        inputElement.classList.add("input-errore");

        const erroreSpan = document.createElement("span");
        erroreSpan.className = "errore-validazione";
        erroreSpan.textContent = messaggio;

        inputElement.insertAdjacentElement("afterend", erroreSpan);
    }

    function rimuoviErrore(inputElement) {
        inputElement.classList.remove("input-errore");

        const errore = inputElement.parentNode.querySelector(".errore-validazione");

        if (errore) {
            errore.remove();
        }
    }
	function validaNome() {
	       rimuoviErrore(nomeInput);

	       if (nomeInput.value.trim() === "") {
	           mostraErrore(nomeInput, "Il nome è obbligatorio");
	           return false;
	       }
	       return true;
	   }

	   function validaPrezzo() {
	       rimuoviErrore(prezzoInput);

	       if (prezzoInput.value.trim() === "" || parseFloat(prezzoInput.value) < 0) {
	           mostraErrore(prezzoInput, "Inserisci un prezzo valido");
	           return false;
	       }
	       return true;
	   }

	   function validaQuantita() {
	       rimuoviErrore(quantitaInput);

	       if (quantitaInput.value.trim() === "" || parseInt(quantitaInput.value) < 0) {
	           mostraErrore(quantitaInput, "Inserisci una quantità valida");
	           return false;
	       }
	       return true;
	   }

	   function validaCategoria() {
	       rimuoviErrore(categoriaSelect);

	       if (
	           categoriaSelect.value.trim() === "" &&
	           nuovaCategoriaInput.value.trim() === ""
	       ) {
	           mostraErrore(categoriaSelect, "Seleziona o inserisci una categoria");
	           return false;
	       }
	       return true;
	   }

	   function validaDescrizione() {
	       rimuoviErrore(descrizioneInput);

	       if (descrizioneInput.value.trim() === "") {
	           mostraErrore(descrizioneInput, "La descrizione è obbligatoria");
	           return false;
	       }
	       return true;
	   }
});