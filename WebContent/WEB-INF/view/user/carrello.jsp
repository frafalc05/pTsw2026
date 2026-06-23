<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Il tuo Carrello - Fiorista Maria</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=20">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css?v=20">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/carrello.css?v=20">
</head>

<body class="site-theme carrello-page">

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<div class="carrello-box">
    <h2>Tabella Riassuntiva Carrello</h2>

    <c:choose>
        <c:when test="${empty sessionScope.carrello}">
            <div class="vuoto">
                <p>Il tuo carrello è attualmente vuoto.</p>
                <a href="${pageContext.request.contextPath}/catalogo" class="btn-torna">Torna al Catalogo</a>
            </div>
        </c:when>
        <c:otherwise>
            <c:set var="totaleComplessivo" value="0" />

            <table>
                <thead>
                    <tr>
                        <th>Codice Prodotto</th>
                        <th>Nome Fiore / Bouquet</th>
                        <th>Prezzo Singolo</th>
                        <th>Quantità</th>
                        <th>Subtotale</th>
                        <th>Azioni</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${sessionScope.carrello}">
                        <c:set var="subtotale" value="${item.prodotto.prezzo * item.quantita}" />
                        <c:set var="totaleComplessivo" value="${totaleComplessivo + subtotale}" />

                        <tr class="prodotto-row" data-prezzo="${item.prodotto.prezzo}" data-id="${item.prodotto.id}">
                            <td><strong># ${item.prodotto.id}</strong></td>
                            <td>${item.prodotto.nome}</td>
                            <td>&euro; <fmt:formatNumber value="${item.prodotto.prezzo}" pattern="0.00"/></td>
                            <td>
                                <input type="number" value="${item.quantita}" min="1" 
                                       class="qta-input" oninput="ricalcola(this)">
                            </td>
                            <td><strong>&euro; <span class="subtotale-valore"><fmt:formatNumber value="${subtotale}" pattern="0.00"/></span></strong></td>
                            <td>
                                <form action="${pageContext.request.contextPath}/CarrelloServlet" method="POST" style="display: inline;">
                                    <input type="hidden" name="action" value="remove">
                                    <input type="hidden" name="id" value="${item.prodotto.id}">
                                    <button type="submit" class="btn-rimuovi">Rimuovi</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <tr class="riga-totale">
                        <td colspan="4" class="txt-destra">Prezzo Finale Totale:</td>
                        <td colspan="2" class="valore-totale">
                            &euro; <span id="prezzo-totale-complessivo"><fmt:formatNumber value="${totaleComplessivo}" pattern="0.00"/></span>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="carrello-footer-azioni">
                <form action="${pageContext.request.contextPath}/CarrelloServlet" method="POST">
                    <input type="hidden" name="action" value="clear">
                    <button type="submit" class="btn-svuota">Svuota Carrello</button>
                </form>

                <div class="gruppo-bottoni-dx">
                    <a href="${pageContext.request.contextPath}/catalogo" class="btn-torna">Continua lo Shopping</a>
                    
                    <c:choose>
                        <c:when test="${not empty sessionScope.utente}">
                            <a href="${pageContext.request.contextPath}/CheckoutServlet" class="btn-checkout">Procedi all'Ordine</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login" class="btn-checkout">Accedi per Ordinare</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<script>
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
    document.getElementById('prezzo-totale-complessivo').innerText = totaleGenerale.toFixed(2);

    fetch('${pageContext.request.contextPath}/CarrelloServlet?action=update&id=' + id + '&quantita=' + qta, {
        method: 'POST'
    });
}
</script>

</body>
</html>