<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="it.progetto.model.Prodotto" %>

<%
    List<Prodotto> catalogo = (List<Prodotto>) request.getAttribute("catalogo");
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Gestione Catalogo - Fiorista Maria</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=101">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/admin.css?v=101">
</head>

<body class="site-theme">


<main class="admin-main">

    <div class="admin-title-row">
        <div>
            <h1>Gestione catalogo</h1>
            <p class="admin-subtitle">
                Qui puoi visualizzare, modificare, inserire o disattivare i prodotti del negozio.
            </p>
        </div>

        <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn-admin-azione btn-admin-light">
            <i class="bi bi-box-arrow-right"></i>
            Logout
        </a>
    </div>

    <div class="catalogo-shortcut-box">
        <div>
            <strong class="admin-box-title">Azioni rapide</strong>
            <p>
                Torna al report degli ordini oppure aggiungi un nuovo prodotto al catalogo.
            </p>
        </div>

        <div class="admin-actions-row">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn-admin-azione btn-admin-light">
                <i class="bi bi-arrow-left"></i>
                Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/admin/catalogo?action=new" class="btn-admin-azione">
                <i class="bi bi-plus-circle"></i>
                Nuovo prodotto
            </a>
        </div>
    </div>

    <h2 class="titolo-risultati">Prodotti presenti nel catalogo</h2>

    <table class="tabella-admin">
        <thead>
            <tr>
                <th>ID</th>
                <th>Immagine</th>
                <th>Nome</th>
                <th>Descrizione</th>
                <th>Prezzo</th>
                <th>Quantità</th>
                <th>Azioni</th>
            </tr>
        </thead>

        <tbody>
            <%
                if (catalogo != null && !catalogo.isEmpty()) {
                    for (Prodotto p : catalogo) {
            %>
                        <tr>
                            <td><%= p.getId() %></td>
                            <td>
                                <% if (p.getImmagine() != null && !p.getImmagine().isEmpty()) { %>
                                    <img src="${pageContext.request.contextPath}/images/<%= p.getImmagine() %>" alt="<%= p.getNome() %>" class="admin-product-img">
                                <% } else { %>
                                    <span class="txt-not-specified">No img</span>
                                <% } %>
                            </td>
                            <td>
                                <strong class="admin-product-name"><%= p.getNome() %></strong>
                            </td>
                            <td><%= p.getDescrizione() != null ? p.getDescrizione() : "" %></td>
                            <td class="valore-totale-admin">€ <%= String.format("%.2f", p.getPrezzo()) %></td>
                            <td><%= p.getQuantita() %></td>
                            <td>
                                <div class="admin-table-actions">
                                    <a href="${pageContext.request.contextPath}/admin/catalogo?action=edit&id=<%= p.getId() %>" class="btn-table-admin btn-table-edit">
                                        Modifica
                                    </a>

                                    <a href="${pageContext.request.contextPath}/admin/catalogo?action=delete&id=<%= p.getId() %>"
                                       class="btn-table-admin btn-table-delete"
                                       onclick="return confirm('Sicuro di voler nascondere o eliminare questo prodotto dal catalogo pubblico?');">
                                        Elimina
                                    </a>
                                </div>
                            </td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="7" class="msg-report-vuoto">
                            Nessun prodotto presente nel catalogo.
                        </td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>

</main>

</body>
</html>