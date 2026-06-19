<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Gestione Catalogo - Fiorista Maria</title>
    
    <%-- Collegamento ai fogli di stile esterni --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/ordine.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/admin.css">
</head>
<body>

    <%-- Include l'header globale per la navigazione --%>
    <jsp:include page="/WEB-INF/view/common/header.jsp" />

    <div class="ordini-container" style="max-width: 900px; margin-top: 40px;">
        <h2 class="ordini-titolo">Gestione Catalogo Prodotti</h2>
        <p class="ordini-descrizione">Pannello di controllo per l'inserimento, modifica e disattivazione dei prodotti in catalogo.</p>

        <div class="admin-actions">
            <a href="${pageContext.request.contextPath}/AdminDashboardServlet" class="btn-link" style="margin: 0;">Torna alla Dashboard</a>
            <a href="${pageContext.request.contextPath}/AdminCatalogoServlet?action=new" class="btn-add">➕ Aggiungi Nuovo Fiore</a>
        </div>

        <table class="ordini-table">
            <thead>
                <tr>
                    <th>Foto</th>
                    <th>ID</th>
                    <th>Nome Prodotto</th>
                    <th>Prezzo</th>
                    <th>Stock Qta</th>
                    <th>Azioni</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="prod" items="${prodotti}">
                    <%-- Se la quantità è zero o il prodotto è disattivato, admin.css colorerà la riga di rosso tenue --%>
                    <tr class="${prod.quantita <= 0 ? 'prodotto-disattivato' : ''}">
                        <td>
                            <img src="${pageContext.request.contextPath}/images/catalogo/${empty prod.immagine ? 'default.png' : prod.immagine}" class="img-preview" alt="${prod.nome}">
                        </td>
                        <td># ${prod.id}</td>
                        <td><strong>${prod.nome}</strong></td>
                        <td>€ <fmt:formatNumber value="${prod.prezzo}" pattern="0.00"/></td>
                        <td>${prod.quantita} pz</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/AdminCatalogoServlet?action=edit&id=${prod.id}" class="btn-edit">Modifica</a>
                            <a href="${pageContext.request.contextPath}/AdminCatalogoServlet?action=delete&id=${prod.id}" class="btn-del" onclick="return confirm('Sicuro di voler nascondere questo prodotto dal catalogo pubblico?');">Elimina</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>