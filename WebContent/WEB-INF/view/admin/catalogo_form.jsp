<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="it.progetto.model.Prodotto" %>
<%
    Prodotto p = (Prodotto) request.getAttribute("prodotto");
    
    String titoloPagina = (p == null) ? "Inserisci Nuovo Prodotto" : "Modifica Prodotto: " + p.getNome();
    int id = (p == null) ? 0 : p.getId();
    String nome = (p == null) ? "" : p.getNome();
    String descrizione = (p == null) ? "" : p.getDescrizione();
    double prezzo = (p == null) ? 0.0 : p.getPrezzo();
    int quantita = (p == null) ? 1 : p.getQuantita();
    String immagine = (p == null) ? "" : p.getImmagine();
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
    
    <form action="${pageContext.request.contextPath}/admin/catalogo" method="POST">
        
        <input type="hidden" name="id" value="<%= id %>">

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
            <label for="immagine">Nome File Immagine (es: rosa.jpg):</label>
            <input type="text" id="immagine" name="immagine" value="<%= immagine %>" placeholder="rosa.jpg">
            <small style="color: #999;">Assicurati che il file sia presente nella cartella /images/</small>
        </div>

        <button type="submit" class="btn-submit">Salva Prodotto</button>
    </form>

    <a href="${pageContext.request.contextPath}/admin/catalogo?action=list" class="link-back">Indietro alla lista</a>
</div>

</body>
</html>