<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin - Fiorista Maria</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/carrello.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/dashboard.css">
</head>
<body>

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<main class="carrello-box admin-main">
    <h1>Pannello di Controllo Amministratore</h1>
    <p class="admin-subtitle">Benvenuta Maria! Da qui potrai gestire i tuoi fiori, vedere gli ordini e modificare il catalogo.</p>
    
    <div class="catalogo-shortcut-box">
        <strong>Gestione Catalogo:</strong> &nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/AdminCatalogoServlet?action=list" class="btn-torna btn-admin-azione">
            📋 Gestisci i Prodotti (Inserisci, Modifica, Cancella)
        </a>
    </div>

    <hr class="separatore">

    <h2 class="admin-section-title">Visualizza Report Ordini Complessivi</h2>
    
    <form action="${pageContext.request.contextPath}/AdminDashboardServlet" method="GET" class="form-checkout form-filtri-admin">
        <div class="row-filtri">
            <div class="form-group group-filtro">
                <label>Dalla data (x):</label>
                <input type="date" name="dataInizio" value="${dataInizio}" class="input-checkout input-filtro-data">
            </div>
            
            <div class="form-group group-filtro">
                <label>Alla data (y):</label>
                <input type="date" name="dataFine" value="${dataFine}" class="input-checkout input-filtro-data">
            </div>
            
            <div class="form-group group-filtro">
                <label>Filtra per ID Cliente:</label>
                <input type="number" name="idCliente" value="${idCliente}" class="input-checkout input-filtro-number" placeholder="Es. 2">
            </div>
            
            <div class="form-group margin-zero">
                <button type="submit" class="btn-checkout btn-applica-filtri">Applica Filtri</button>
            </div>
        </div>
    </form>

    <h3 class="titolo-risultati">Risultati della ricerca</h3>
    <c:choose>
        <c:when test="${empty listaOrdini}">
            <p class="msg-report-vuoto">Nessun ordine trovato per i filtri selezionati.</p>
        </c:when>
        <c:otherwise>
            <table class="tabella-admin">
                <thead>
                    <tr>
                        <th>ID Ordine</th>
                        <th>ID Cliente</th>
                        <th>Destinatario</th>
                        <th>Data Ordine</th>
                        <th>Totale</th>
                        <th>Stato</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ord" items="${listaOrdini}">
                        <tr>
                            <td><strong># ${ord.id}</strong></td>
                            <td>${ord.idUtente}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty ord.nomeDestinatario}">${ord.nomeDestinatario}</c:when>
                                    <c:otherwise><span class="txt-not-specified">Non specificato</span></c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <fmt:formatDate value="${ord.dataOrdine}" pattern="dd/MM/yyyy HH:mm"/>
                            </td>
                            <td class="valore-totale-admin">
                                &euro; <fmt:formatNumber value="${ord.totale}" pattern="0.00"/>
                            </td>
                            <td>
                                <span class="badge-stato-ordine">
                                    ${ord.stato}
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</main>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

</body>
</html>