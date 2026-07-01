<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="it.progetto.model.Prodotto" %>
<%
    List<Prodotto> prodottiPreferiti = (List<Prodotto>) request.getAttribute("prodottiPreferiti");
%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>La mia Lista dei Desideri - Fiorista Maria</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=1200">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css?v=1200">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/catalogo.css?v=1200">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css?v=1200">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/wishlist.css?v=1200">
    
    
</head>
<body class="site-theme">

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<main class="wishlist-container">
    <h1>La mia Lista dei Desideri</h1>
    <p>Qui trovi gli articoli che hai salvato. Puoi aggiungerli al carrello in qualsiasi momento.</p>

    <% if (prodottiPreferiti == null || prodottiPreferiti.isEmpty()) { %>
        <div class="wishlist-vuota">
            <i class="bi bi-heartbreak"></i>
            <h2>La tua lista dei desideri è vuota</h2>
            <p>Sfoglia il nostro catalogo e clicca sul cuore per salvare i tuoi prodotti preferiti.</p>
            <a href="${pageContext.request.contextPath}/catalogo">Torna al Catalogo</a>
        </div>
    <% } else { %>
        <div class="griglia-prodotti">
            <% 
                for (Prodotto p : prodottiPreferiti) { 
                    String imgPath = (p.getImmagine() != null) ? p.getImmagine().trim() : "";
                    String srcTarget = request.getContextPath() + "/immagine-prodotto/" + imgPath;
            %>
                <article class="prodotto-box" id="item-wishlist-<%= p.getId() %>">
                    
                    <button class="btn-wishlist active" data-id="<%= p.getId() %>" title="Rimuovi dai preferiti" type="button">
                        <i class="bi bi-heart-fill"></i> 
                    </button>
                    
                    <img src="<%= srcTarget %>" alt="<%= p.getNome() %>">
                    
                    <div class="prodotto-info">
                        <h3><%= p.getNome() %></h3>
                        <p><%= p.getDescrizione() %></p>
                        <p class="prezzo">€ <%= String.format("%.2f", p.getPrezzo()) %></p>
                        
                        <div class="carrello-controls">
                            <input type="number" id="qta-<%= p.getId() %>" value="1" min="1" class="qta-input">
                            <button class="btn-add-carrello" data-id="<%= p.getId() %>" type="button">Aggiungi</button>
                        </div>
                    </div>
                </article>
            <% } %>
        </div>
    <% } %>
</main>


<script src="${pageContext.request.contextPath}/scripts/carrello.js?v=1200"></script>
<script src="${pageContext.request.contextPath}/scripts/wishlist.js?v=1200"></script>

</body>
</html>