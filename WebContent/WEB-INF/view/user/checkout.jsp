<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Dati Spedizione e Pagamento - Fiorista Maria</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=10">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css?v=10">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css?v=10">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/carrello.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/validation.css">
	<script src="${pageContext.request.contextPath}/scripts/validationPagamento.js?v=30" defer></script>
</head>

<body>

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<main>
    <div class="carrello-box">
        <h2>Dati di Spedizione e Pagamento</h2>

        <form action="${pageContext.request.contextPath}/CheckoutServlet" method="POST" class="form-checkout">

            <div class="form-group">
                <label for="nome_destinatario">Nome Destinatario</label>
                <input type="text"
                       id="nome_destinatario"
                       name="nome_destinatario"
                       class="input-checkout"
                       placeholder="Es. Francesca Rossi">
            </div>

            <div class="form-group">
                <label for="indirizzo">Indirizzo</label>
                <input type="text"
                       id="indirizzo"
                       name="indirizzo"
                       class="input-checkout"
                       placeholder="Es. Via Roma 15">
            </div>

            <div class="form-row">
                <div class="form-group flex-1">
                    <label for="citta">Città</label>
                    <input type="text"
                           id="citta"
                           name="citta"
                           class="input-checkout"
                           placeholder="Es. Milano">
                </div>

                <div class="form-group w-cap">
                    <label for="cap">CAP</label>
                    <input type="text"
                           id="cap"
                           name="cap"
                           class="input-checkout"
                           placeholder="20100">
                </div>
            </div>

            <div class="form-group">
                <label for="messaggio">Messaggio per il fiorista (opzionale)</label>
                <textarea id="messaggio"
                          name="messaggio"
                          class="input-checkout"
                          rows="3"
                          placeholder="Scrivi note per la consegna o biglietti d'auguri..."></textarea>
            </div>

            <hr class="separatore">

            <h3 class="checkout-title">Modalità di Pagamento</h3>

            <div class="payment-methods">

                <label class="payment-option">
                    <input type="radio"
                           id="carta"
                           name="metodo_pagamento"
                           value="Carta di Credito"
                           checked>
                    Carta di Credito / Debito
                </label>

            </div>

            <div id="campi-carta" class="payment-box">
                <div class="form-group">
                    <label>Numero Carta</label>
                    <input type="text"
                           class="input-checkout"
                           placeholder="1234 5678 1234 5678"  id="numeroCarta">
                </div>

                <div class="form-row">
                    <div class="form-group flex-1">
                        <label>Scadenza</label>
                        <input type="text"
                               class="input-checkout"
                               placeholder="MM/AA" id="scadenza">
                    </div>

                    <div class="form-group flex-1">
                        <label>CVV</label>
                        <input type="text"
                               class="input-checkout"
                               placeholder="123" id="cvv">
                    </div>
                </div>
            </div>

            <hr class="separatore">

            <div class="form-azioni-checkout">
                <a href="${pageContext.request.contextPath}/CarrelloServlet"
                   class="btn-svuota link-ritorno">
                    Torna al Carrello
                </a>

                <button type="submit" class="btn-checkout">
                    Conferma e Invia Ordine
                </button>
            </div>

        </form>
    </div>
</main>
</body>
</html>