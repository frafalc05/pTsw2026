<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="it.progetto.model.Ordine" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    List<Ordine> listaOrdini = (List<Ordine>) request.getAttribute("listaOrdini");
    String dataInizio = (String) request.getAttribute("dataInizio");
    String dataFine = (String) request.getAttribute("dataFine");
    String idCliente = (String) request.getAttribute("idCliente");

    if (dataInizio == null) dataInizio = "";
    if (dataFine == null) dataFine = "";
    if (idCliente == null) idCliente = "";

    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Amministratore - Fiorista Maria</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=101">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/admin.css?v=101">
</head>

<body>

<div class="admin-main">

    <div class="admin-title-row">
        <div>
            <h1>Pannello di controllo</h1>
            <p class="admin-subtitle">
                Benvenuta nel report gestionale degli ordini. Da qui puoi filtrare gli ordini ricevuti e aggiornare il loro stato.
            </p>
        </div>

        <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn-admin-azione btn-admin-light">
            <i class="bi bi-box-arrow-right"></i>
            Logout
        </a>
    </div>

    <div class="catalogo-shortcut-box">
        <div>
            <strong class="admin-box-title">Gestione catalogo</strong>
            <p>
                Visualizza, modifica, inserisci o disattiva i prodotti mostrati nel catalogo pubblico.
            </p>
        </div>

        <a href="${pageContext.request.contextPath}/admin/catalogo?action=list" class="btn-admin-azione">
            <i class="bi bi-flower1"></i>
            Gestisci catalogo
        </a>
    </div>

    <h2 class="admin-section-title">Filtra ordini complessivi</h2>

    <form action="${pageContext.request.contextPath}/admin/dashboard" method="GET" class="form-filtri-admin">
        <div class="row-filtri">
            <div class="group-filtro">
                <label for="dataInizio">Da data</label>
                <input type="date" id="dataInizio" name="dataInizio" value="<%= dataInizio %>" class="input-filtro-data">
            </div>

            <div class="group-filtro">
                <label for="dataFine">A data</label>
                <input type="date" id="dataFine" name="dataFine" value="<%= dataFine %>" class="input-filtro-data">
            </div>

            <div class="group-filtro">
                <label for="idCliente">ID cliente</label>
                <input type="number" id="idCliente" name="idCliente" placeholder="Es. 5" value="<%= idCliente %>" class="input-filtro-number">
            </div>

            <button type="submit" class="btn-applica-filtri">
                <i class="bi bi-search"></i>
                Filtra
            </button>
        </div>

        <div class="admin-reset-row">
            <a href="${pageContext.request.contextPath}/admin/dashboard">Resetta filtri</a>
        </div>
    </form>

    <h2 class="titolo-risultati">Elenco ordini ricevuti</h2>

    <table class="tabella-admin">
            <tr>
                <th>ID ordine</th>
                <th>ID cliente</th>
                <th>Data ordine</th>
                <th>Destinatario</th>
                <th>Totale</th>
                <th>Stato</th>
            </tr>

        
            <%
                if (listaOrdini != null && !listaOrdini.isEmpty()) {
                    for (Ordine o : listaOrdini) {
            %>
                        <tr>
                            <td><%= o.getId() %></td>
                            <td><%= o.getIdUtente() %></td>
                            <td><%= o.getDataOrdine() != null ? sdf.format(o.getDataOrdine()) : "N/D" %></td>
                            <td><%= o.getNomeDestinatario() != null ? o.getNomeDestinatario() : "N/D" %></td>
                            <td class="valore-totale-admin">€ <%= String.format("%.2f", o.getTotale()) %></td>
                            <td>
                                <form action="${pageContext.request.contextPath}/admin/dashboard" method="POST" class="form-stato-admin">
                                    <input type="hidden" name="idOrdine" value="<%= o.getId() %>">
                                    <input type="hidden" name="action" value="updateStato">

                                    <select name="nuovoStato" onchange="this.form.submit()" class="select-stato-admin">
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
                        <td colspan="6" class="msg-report-vuoto">
                            Nessun ordine trovato con i filtri selezionati.
                        </td>
                    </tr>
            <%
                }
            %>
    </table>

</div>

</body>
</html>   