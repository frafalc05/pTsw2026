<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="it.progetto.model.ProdottoQuantita" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Il tuo Carrello - Fiorista Maria</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/comune.css">
</head>
<body>

    <header>
        <div class="logo">Fiorista Maria</div>
        <nav>
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/catalogo">Catalogo</a>
            <a href="${pageContext.request.contextPath}/carrello">Carrello</a>
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </nav>
    </header>

    <main style="padding: 50px; text-align: center;">
        <h1>Il tuo Carrello</h1>

        <%
            ArrayList<ProdottoQuantita> carrello = (ArrayList<ProdottoQuantita>) session.getAttribute("carrello");
            if (carrello == null || carrello.isEmpty()) {
        %>
            <p>Il tuo carrello è attualmente vuoto.</p>
            <a href="${pageContext.request.contextPath}/catalogo" class="btn">Torna al Catalogo</a>
        <%
            } else {
                // Se ci sono prodotti, li cicliamo in una tabella (la popoleremo meglio dopo)
        %>
            <table style="margin: 0 auto; width: 60%; border-collapse: collapse;">
                <tr style="background-color: #7b2d42; color: white;">
                    <th style="padding: 10px;">Prodotto</th>
                    <th>Quantità</th>
                    <th>Prezzo</th>
                </tr>
                <% for(ProdottoQuantita item : carrello) { %>
                <tr style="border-bottom: 1px solid #ddd;">
                    <td style="padding: 10px;"><%= item.getProdotto().getNome() %></td>
                    <td><%= item.getQuantita() %></td>
                    <td><%= item.getProdotto().getPrezzo() %> €</td>
                </tr>
                <% } %>
            </table>
        <%
            }
        %>
    </main>

    <footer>
        <p>&copy; 2026 - Fiorista Maria. Tutti i diritti riservati.</p>
    </footer>

</body>
</html>