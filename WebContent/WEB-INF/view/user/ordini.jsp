<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cronologia Ordini</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/ordine.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css?v=80">
</head>
<body>

<jsp:include page="/WEB-INF/view/common/header.jsp" />
    <div class="ordini-container">
        <h2 class="ordini-titolo">Cronologia dei Miei Ordini</h2>
        <p class="ordini-descrizione">Benvenuto nella tua area personale. Qui sotto trovi lo storico dei tuoi acquisti.</p>

        <c:choose>
            <c:when test="${empty listaOrdini}">
                <div class="nessun-ordine-box">
                    <span class="nessun-ordine-icona">
                        <i class="bi bi-flower3"></i>
                    </span>
                    <h3 class="nessun-ordine-testo">Il tuo storico è ancora vuoto</h3>
                    <p class="nessun-ordine-sottotitolo">
                        Non hai ancora effettuato ordini su Fiorista Maria.<br>
                        Esplora il nostro catalogo per scoprire splendidi bouquet e composizioni uniche.
                    </p>
                    <a href="${pageContext.request.contextPath}/catalogo" class="btn-link">Inizia a fare acquisti</a>
                </div>
            </c:when>
            
            <c:otherwise>
                <div class="ordini-table-wrapper">
                    <table class="ordini-table">
                   
                            <tr>
                                <th>ID Ordine</th>
                                <th>Totale Speso</th>
                                <th>Stato Avanzamento</th>
                            </tr>
                       
                            <c:forEach var="ordine" items="${listaOrdini}">
                                <tr>
                                    <td><strong># ${ordine.id}</strong></td>
                                    <td>€ ${ordine.totale}</td>
                                    <td>
                                        <span class="badge-stato ${ordine.stato.toLowerCase()}">${ordine.stato}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>

        <div class="margin-top-30">
            <a href="${pageContext.request.contextPath}/" class="btn-link btn-outline">
                <i class="bi bi-arrow-left"></i> Torna alla Home
            </a>
        </div>
    </div>

</body>
</html>