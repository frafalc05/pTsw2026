<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dati Spedizione e Pagamento - Fiorista Maria</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/carrello.css">
</head>
<body>

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<div class="carrello-box">
    <h2>Dati di Spedizione e Pagamento</h2>

    <form action="${pageContext.request.contextPath}/CheckoutServlet" method="POST" class="form-checkout">
        
        <div class="form-group">
            <label for="nome_destinatario">Nome Destinatario</label>
            <input type="text" id="nome_destinatario" name="nome_destinatario" class="input-checkout" required placeholder="Es. Francesca Rossi">
        </div>
        
        <div class="form-group">
            <label for="indirizzo">Indirizzo</label>
            <input type="text" id="indirizzo" name="indirizzo" class="input-checkout" required placeholder="Es. Via Roma 15">
        </div>
        
        <div class="form-row">
            <div class="form-group flex-1">
                <label for="citta">Città</label>
                <input type="text" id="citta" name="citta" class="input-checkout" required placeholder="Es. Milano">
            </div>
            
            <div class="form-group w-cap">
                <label for="cap">CAP</label>
                <input type="text" id="cap" name="cap" class="input-checkout" pattern="[0-9]{5}" required placeholder="20100">
            </div>
        </div>
        
        <div class="form-group">
            <label for="messaggio">Messaggio per il fiorista (opzionale)</label>
            <textarea id="messaggio" name="messaggio" class="input-checkout" rows="3" placeholder="Scrivi note per la consegna o biglietti d'auguri..."></textarea>
        </div>

        <hr class="separatore">

        <h3 style="color: #6b2d3c; margin-bottom: 15px;">Modalità di Pagamento</h3>
        
        <div class="form-group" style="display: flex; gap: 20px; flex-direction: row; align-items: center;">
            <label style="display: inline-flex; align-items: center; font-weight: normal; margin: 0; cursor: pointer;">
                <input type="radio" id="carta" name="metodo_pagamento" value="Carta di Credito" checked onclick="togglePagamento('carta')" style="margin-right: 8px; accent-color: #6b2d3c;">
                Carta di Credito / Debito
            </label>
            <label style="display: inline-flex; align-items: center; font-weight: normal; margin: 0; cursor: pointer;">
                <input type="radio" id="paypal" name="metodo_pagamento" value="PayPal" onclick="togglePagamento('paypal')" style="margin-right: 8px; accent-color: #6b2d3c;">
                PayPal
            </label>
        </div>
        
        <div id="campi-carta" style="background-color: #faf6f7; padding: 15px; border-radius: 4px; border: 1px solid #e2d9db; margin-bottom: 15px;">
            <div class="form-group">
                <label>Numero Carta</label>
                <input type="text" class="input-checkout" placeholder="1234 5678 1234 5678" maxlength="19">
            </div>
            <div class="form-row">
                <div class="form-group flex-1">
                    <label>Scadenza</label>
                    <input type="text" class="input-checkout" placeholder="MM/AA" maxlength="5">
                </div>
                <div class="form-group flex-1">
                    <label>CVV</label>
                    <input type="text" class="input-checkout" placeholder="123" maxlength="3">
                </div>
            </div>
        </div>

        <div id="campi-paypal" style="background-color: #faf6f7; padding: 15px; border-radius: 4px; border: 1px solid #e2d9db; margin-bottom: 15px; display: none;">
            <p style="margin: 0; color: #555; font-size: 0.95rem;">Verrai reindirizzato al server sicuro di PayPal alla conferma dell'ordine.</p>
        </div>

        <hr class="separatore">

        <div class="form-azioni-checkout">
            <a href="${pageContext.request.contextPath}/CarrelloServlet" class="btn-svuota link-ritorno">Torna al Carrello</a>
            <button type="submit" class="btn-checkout">Conferma e Invia Ordine</button>
        </div>
    </form>
</div>

<script>
function togglePagamento(metodo) {
    const boxCarta = document.getElementById('campi-carta');
    const boxPaypal = document.getElementById('campi-paypal');
    
    if (metodo === 'carta') {
        boxCarta.style.display = 'block';
        boxPaypal.style.display = 'none';
    } else {
        boxCarta.style.display = 'none';
        boxPaypal.style.display = 'block';
    }
}
</script>

</body>
</html>