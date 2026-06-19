<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="it.progetto.model.Prodotto" %>
<%
    Prodotto p = (Prodotto) request.getAttribute("prodotto");
    
    String titoloPagina = (p == null) ? "Inserisci Nuovo Prodotto" : "Modifica Prodotto: " + p.getNome();
    // Se p è null, l'id deve essere una stringa vuota o non passata per l'inserimento, 
    // altrimenti teniamo il valore numerico in stringa.
    String idValue = (p == null) ? "" : String.valueOf(p.getId());
    String nome = (p == null) ? "" : p.getNome();
    String descrizione = (p == null) ? "" : p.getDescrizione();
    double prezzo = (p == null) ? 0.0 : p.getPrezzo();
    int quantita = (p == null) ? 1 : p.getQuantita();
%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title><%= titoloPagina %></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/admin.css">
</head>
<body>

<div class="form-container">
    <h1><%= titoloPagina %></h1>
    
    <form action="${pageContext.request.contextPath}/admin/catalogo" method="POST" enctype="multipart/form-data">
        
        <input type="hidden" name="id" value="<%= idValue %>">

        <div class="form-group">
            <label for="nome">Nome Prodotto/Fiore:</label>
            <input type="text" id="nome" name="nome" value="<%= nome %>" required>
        </div>

        <div class="form-group">
            <label for="descrizione">Descrizione:</label>
            <textarea id="descrizione" name="descrizione" rows="4" required><%= descrizione %></textarea>
        </div>

        <div class="form-group">
            <label for="prezzo">Prezzo (€):</label>
            <input type="number" id="prezzo" name="prezzo" step="0.01" value="<%= prezzo %>" required>
        </div>

        <div class="form-group">
            <label for="quantita">Quantità Disponibile:</label>
            <input type="number" id="quantita" name="quantita" value="<%= quantita %>" required>
        </div>

        <div class="form-group">
            <label for="immagine">Seleziona Immagine Prodotto:</label>
            <input type="file" id="immagine" name="immagine" accept="image/*">
            <% if (p != null && p.getImmagine() != null && !p.getImmagine().isEmpty()) { %>
                <p style="font-size: 13px; color: #555; margin-top: 5px;">
                    Immagine attuale: <strong><%= p.getImmagine() %></strong> (Lascia vuoto per non cambiarla)
                </p>
            <% } %>
        </div>

        <button type="submit" class="btn-submit">Salva Prodotto</button>
    </form>

    <a href="${pageContext.request.contextPath}/admin/catalogo?action=list" class="link-back">Indietro alla lista</a>
</div>

</body>
</html>