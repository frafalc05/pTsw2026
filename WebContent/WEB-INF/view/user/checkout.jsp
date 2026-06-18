<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Completa il tuo Ordine - Fiorista Maria</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/carrello.css">
</head>
<body>

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<div class="carrello-box">
    <h2>Riepilogo e Conferma Ordine</h2>
    
    <p>Ciao <strong>${sessionScope.utente.nome}</strong>, stai per completare il tuo acquisto!</p>

    <form action="${pageContext.request.contextPath}/CheckoutServlet" method="POST">
        
        <div style="margin: 20px 0; padding: 15px; background: #fffaf7; border: 1px solid #743044;">
            <h3>Indirizzo di Spedizione</h3>
            <p>L'ordine verrà spedito all'indirizzo registrato sul tuo profilo.</p>
        </div>

        <div class="carrello-footer-azioni">
            <a href="${pageContext.request.contextPath}/CarrelloServlet" class="btn-torna">Torna al Carrello</a>
            <button type="submit" class="btn-checkout" style="background-color: #743044;">Conferma e Invia Ordine</button>
        </div>
        
    </form>
</div>

</body>
</html>