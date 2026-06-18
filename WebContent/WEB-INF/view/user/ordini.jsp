<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cronologia Ordini</title>
    
    <%-- COLLEGAMENTO AL FILE CSS ESTERNO --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/ordine.css">
</head>
<body>

    <div class="ordini-container">
        <h2 class="ordini-titolo">Cronologia dei Miei Ordini</h2>
        <p class="ordini-descrizione">Benvenuto nella tua area personale. Qui sotto trovi lo storico dei tuoi acquisti.</p>

        <%-- CONTROLLO SE LA LISTA ORDINI E' VUOTA --%>
        <c:choose>
            <c:when test="${empty listaOrdini}">
                <div class="nessun-ordine-box">
                    <p class="nessun-ordine-testo">Non hai ancora effettuato nessun ordine.</p>
                    <a href="${pageContext.request.contextPath}/" class="btn-link">Inizia a fare acquisti</a>
                </div>
            </c:when>
            
            <c:otherwise>
                <%-- SE CI SONO ORDINI, MOSTRAMO LA TABELLA --%>
                <table class="ordini-table">
                    <thead>
                        <tr>
                            <th>ID Ordine</th>
                            <th>Totale Speso</th>
                            <th>Stato Avanzamento</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="ordine" items="${listaOrdini}">
                            <tr>
                                <td><strong># ${ordine.id}</strong></td>
                                <td>€ ${ordine.totale}</td>
                                <td>
                                    <span class="badge-stato">${ordine.stato}</span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>

        <%-- PULSANTE TORNA ALLA HOME --%>
        <div class="margin-top-30">
            <a href="${pageContext.request.contextPath}/" class="btn-link">Torna alla Home</a>
        </div>
    </div>

</body>
</html>