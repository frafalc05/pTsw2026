<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="it.progetto.model.Prodotto" %>
<%
    // Recuperiamo la lista di tutti i prodotti passata dalla AdminCatalogoServlet
    List<Prodotto> catalogo = (List<Prodotto>) request.getAttribute("catalogo");
%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Gestione Catalogo - Amministrazione</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/admin.css">
    <style>
        .btn-action { padding: 5px 10px; text-decoration: none; border-radius: 4px; font-size: 14px; margin-right: 5px; }
        .btn-edit { background: #3498db; color: white; }
        .btn-delete { background: #e74c3c; color: white; }
        .btn-back { background: #7f8c8d; color: white; text-decoration: none; padding: 10px 15px; border-radius: 4px; display: inline-block; margin-bottom: 20px; }
    </style>
</head>
<body>

<div class="admin-container">
    <a href="${pageContext.request.contextPath}/LogoutServlet" class="logout-link">Logout</a>
    <h1>Gestione Catalogo Prodotti</h1>
    <p>Qui puoi visualizzare, modificare, inserire o disattivare gli elementi del tuo negozio.</p>

    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn-back">Torna alla Dashboard Ordini</a>
    <a href="${pageContext.request.contextPath}/admin/catalogo?action=new" class="btn-nav" style="margin-left: 10px;">+ Inserisci Nuovo Prodotto</a>

    <table class="report-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Immagine</th>
                <th>Nome Fiore/Pianta</th>
                <th>Descrizione</th>
                <th>Prezzo (€)</th>
                <th>Quantità Disp.</th>
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
                                <% if(p.getImmagine() != null && !p.getImmagine().isEmpty()) { %>
                                    <img src="${pageContext.request.contextPath}/images/<%= p.getImmagine() %>" alt="<%= p.getNome() %>" style="width: 50px; height: auto; border-radius: 4px;">
                                <% } else { %>
                                    <span style="color:#aaa;">No img</span>
                                <% } %>
                            </td>
                            <td><strong><%= p.getNome() %></strong></td>
                            <td><%= p.getDescrizione() != null ? p.getDescrizione() : "" %></td>
                            <td><%= String.format("%.2f", p.getPrezzo()) %></td>
                            <td><%= p.getQuantita() %></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/catalogo?action=edit&id=<%= p.getId() %>" class="btn-action btn-edit">Modifica</a>
                                
                                <a href="${pageContext.request.contextPath}/admin/catalogo?action=delete&id=<%= p.getId() %>" 
                                   class="btn-action btn-delete" 
                                   onclick="return confirm('Sicuro di voler nascondere/eliminare questo prodotto dal catalogo pubblico?');">Elimina</a>
                            </td>
                        </tr>
            <% 
                    }
                } else {
            %>
                    <tr>
                        <td colspan="7" style="text-align: center; color: #7f8c8d;">Nessun prodotto presente nel catalogo.</td>
                    </tr>
            <% 
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>