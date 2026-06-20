<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="it.progetto.model.Ordine" %>
<%@ page import="java.text.SimpleDateFormat" %> <%
    // Recuperiamo i dati passati dalla AdminDashboardServlet
    List<Ordine> listaOrdini = (List<Ordine>) request.getAttribute("listaOrdini");
    String dataInizio = (String) request.getAttribute("dataInizio");
    String dataFine = (String) request.getAttribute("dataFine");
    String idCliente = (String) request.getAttribute("idCliente");
    
    if (dataInizio == null) dataInizio = "";
    if (dataFine == null) dataFine = "";
    if (idCliente == null) idCliente = "";

    // MODIFICATO: Pattern impostato solo su Giorno-Mese-Anno (rimosso l'orario)
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Amministratore - Fiorista Maria</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/admin.css">
</head>
<body>

<div class="admin-container">
    <a href="${pageContext.request.contextPath}/LogoutServlet" class="logout-link">Logout</a>
    <h1>Pannello di Controllo - Maria</h1>
    <p>Benvenuta nel report gestionale degli ordini.</p>
    
    <a href="${pageContext.request.contextPath}/admin/catalogo?action=list" class="btn-nav">Gestisci Catalogo Prodotti</a>

    <div class="filter-box">
        <h3>Filtra Ordini Complessivi</h3>
        <form action="${pageContext.request.contextPath}/admin/dashboard" method="GET" class="filter-form">
            <div class="filter-group">
                <label for="dataInizio">Da Data (X):</label>
                <input type="date" id="dataInizio" name="dataInizio" value="<%= dataInizio %>">
            </div>
            <div class="filter-group">
                <label for="dataFine">A Data (Y):</label>
                <input type="date" id="dataFine" name="dataFine" value="<%= dataFine %>">
            </div>
            <div class="filter-group">
                <label for="idCliente">ID Cliente:</label>
                <input type="number" id="idCliente" name="idCliente" placeholder="Es. 5" value="<%= idCliente %>">
            </div>
            <button type="submit" class="btn-filter">Applica Filtri</button>
            <a href="${pageContext.request.contextPath}/admin/dashboard" style="padding: 10px; color: #7f8c8d; text-decoration: none;">Resetta</a>
        </form>
    </div>

    <h3>Elenco Ordini Ricevuti</h3>
    <table class="report-table">
        <thead>
            <tr>
                <th>ID Ordine</th>
                <th>ID Cliente</th>
                <th>Data Ordine</th> <th>Destinatario</th>
                <th>Totale (€)</th>
                <th>Stato</th>
            </tr>
        </thead>
        <tbody>
            <% 
                if (listaOrdini != null && !listaOrdini.isEmpty()) {
                    for (Ordine o : listaOrdini) {
            %>
                        <tr>
                            <td><%= o.getId() %></td>
                            <td><%= o.getIdUtente() %></td>
                            <td><%= o.getDataOrdine() != null ? sdf.format(o.getDataOrdine()) : "N/D" %></td>
                            <td><%= o.getNomeDestinatario() != null ? o.getNomeDestinatario() : "N/D" %></td>
                            <td><%= String.format("%.2f", o.getTotale()) %></td>
                            <td>
                                <form action="${pageContext.request.contextPath}/admin/dashboard" method="POST" style="margin:0;">
                                    <input type="hidden" name="idOrdine" value="<%= o.getId() %>">
                                    <input type="hidden" name="action" value="updateStato">
                                    
                                    <select name="nuovoStato" onchange="this.form.submit()" style="padding: 5px; font-weight: bold; border-radius: 4px; cursor: pointer;">
                                        <option value="In Lavorazione" <%= "In Lavorazione".equalsIgnoreCase(o.getStato()) ? "selected" : "" %>>In Lavorazione</option>
                                        <option value="Spedito" <%= "Spedito".equalsIgnoreCase(o.getStato()) ? "selected" : "" %>>Spedito</option>
                                        <option value="Consegnato" <%= "Consegnato".equalsIgnoreCase(o.getStato()) ? "selected" : "" %>>Consegnato</option>
                                        <option value="Annullato" <%= "Annullato".equalsIgnoreCase(o.getStato()) ? "selected" : "" %>>Annullato</option>
                                    </select>
                                </form>
                            </td>
                        </tr>
            <% 
                    }
                } else {
            %>
                    <tr>
                        <td colspan="6" style="text-align: center; color: #7f8c8d;">Nessun ordine trovato con i filtri selezionati.</td>
                    </tr>
            <% 
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>