<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="it.progetto.model.Prodotto" %>

<%
    Prodotto p = (Prodotto) request.getAttribute("prodotto");

    String titoloPagina = (p == null) ? "Inserisci nuovo prodotto" : "Modifica prodotto: " + p.getNome();
    String idValue = (p == null) ? "" : String.valueOf(p.getId());
    String nome = (p == null) ? "" : p.getNome();
    String descrizione = (p == null) ? "" : p.getDescrizione();
    double prezzo = (p == null) ? 0.0 : p.getPrezzo();
    int quantita = (p == null) ? 1 : p.getQuantita();
    String categoria = (p == null || p.getCategoria() == null) ? "" : p.getCategoria();
    boolean isAttivo = (p == null) ? true : p.isAttivo();

    boolean categoriaPredefinita =
        "Bouquet".equals(categoria) ||
        "Corone di Laurea".equals(categoria) ||
        "Eventi e Cerimonie".equals(categoria) ||
        "Flower Cube".equals(categoria) ||
        "Piante e Orchidee".equals(categoria) ||
        "Profumatori".equals(categoria) ||
        "Terrarium".equals(categoria) ||
        "Idee Regalo".equals(categoria);

    String nuovaCategoriaValue = (!categoria.isEmpty() && !categoriaPredefinita) ? categoria : "";
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title><%= titoloPagina %> - Fiorista Maria</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=130">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/admin.css?v=130">
</head>

<body class="site-theme">

<main class="admin-main">

    <div class="admin-title-row">
        <div>
            <h1><%= titoloPagina %></h1>
            <p class="admin-subtitle">
                Compila i dati del prodotto e salva le modifiche per aggiornare il catalogo.
            </p>
        </div>

        <a href="${pageContext.request.contextPath}/admin/catalogo?action=list" class="btn-admin-azione btn-admin-light">
            <i class="bi bi-arrow-left"></i>
            Torna alla lista
        </a>
    </div>

    <section class="admin-card">
        <form action="${pageContext.request.contextPath}/admin/catalogo" method="POST" enctype="multipart/form-data" class="admin-product-form">

            <input type="hidden" name="id" value="<%= idValue %>">
            <input type="hidden" name="modifica_esplicita" value="true">

            <div class="admin-form-grid">
                <div class="group-filtro">
                    <label for="nome">Nome prodotto</label>
                    <input type="text" id="nome" name="nome" value="<%= nome %>" required class="input-filtro-data">
                </div>

                <div class="group-filtro">
                    <label for="prezzo">Prezzo (€)</label>
                    <input type="number" id="prezzo" name="prezzo" step="0.01" min="0" value="<%= prezzo %>" required class="input-filtro-number">
                </div>

                <div class="group-filtro">
                    <label for="quantita">Quantità disponibile</label>
                    <input type="number" id="quantita" name="quantita" min="0" value="<%= quantita %>" required class="input-filtro-number">
                </div>

                <div class="group-filtro">
                    <label for="categoria">Categoria esistente</label>
                    <select id="categoria" name="categoria" class="input-filtro-data">
                        <option value="">Seleziona categoria</option>
                        <option value="Bouquet" <%= "Bouquet".equals(categoria) ? "selected" : "" %>>Bouquet</option>
                        <option value="Corone di Laurea" <%= "Corone di Laurea".equals(categoria) ? "selected" : "" %>>Corone di Laurea</option>
                        <option value="Eventi e Cerimonie" <%= "Eventi e Cerimonie".equals(categoria) ? "selected" : "" %>>Eventi e Cerimonie</option>
                        <option value="Flower Cube" <%= "Flower Cube".equals(categoria) ? "selected" : "" %>>Flower Cube</option>
                        <option value="Piante e Orchidee" <%= "Piante e Orchidee".equals(categoria) ? "selected" : "" %>>Piante e Orchidee</option>
                        <option value="Profumatori" <%= "Profumatori".equals(categoria) ? "selected" : "" %>>Profumatori</option>
                        <option value="Terrarium" <%= "Terrarium".equals(categoria) ? "selected" : "" %>>Terrarium</option>
                        <option value="Idee Regalo" <%= "Idee Regalo".equals(categoria) ? "selected" : "" %>>Idee Regalo</option>
                    </select>
                </div>

                <div class="group-filtro">
                    <label for="nuovaCategoria">Nuova categoria</label>
                    <input type="text" id="nuovaCategoria" name="nuovaCategoria" value="<%= nuovaCategoriaValue %>" placeholder="Scrivi qui se vuoi creare una nuova categoria" class="input-filtro-data">
                </div>

                <div class="group-filtro">
                    <label for="immagine">Immagine prodotto</label>
                    <input type="file" id="immagine" name="immagine" accept="image/*" class="input-file-admin">

                    <% if (p != null && p.getImmagine() != null && !p.getImmagine().isEmpty()) { %>
                        <p class="admin-help-text">
                            Immagine attuale: <strong><%= p.getImmagine() %></strong>. Lascia vuoto per non cambiarla.
                        </p>
                    <% } %>
                </div>
            </div>

            <div class="group-filtro admin-full">
                <label for="descrizione">Descrizione</label>
                <textarea id="descrizione" name="descrizione" rows="5" required class="textarea-admin"><%= descrizione %></textarea>
            </div>

            <label class="admin-check-row" for="attivo">
                <input type="checkbox" id="attivo" name="attivo" value="true" <%= isAttivo ? "checked" : "" %>>
                <span>Prodotto visibile nel catalogo utenti</span>
            </label>

            <div class="admin-form-actions">
                <button type="submit" class="btn-applica-filtri">
                    <i class="bi bi-check2-circle"></i>
                    Salva prodotto
                </button>

                <a href="${pageContext.request.contextPath}/admin/catalogo?action=list" class="btn-admin-azione btn-admin-light">
                    Annulla
                </a>
            </div>

        </form>
    </section>

</main>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const selectCategoria = document.getElementById("categoria");
    const nuovaCategoria = document.getElementById("nuovaCategoria");

    function aggiornaCategoria() {
        const valoreNuova = nuovaCategoria.value.trim();

        if (valoreNuova.length > 0) {
            selectCategoria.value = "";
            selectCategoria.disabled = true;
            selectCategoria.classList.add("input-disabled");
        } else {
            selectCategoria.disabled = false;
            selectCategoria.classList.remove("input-disabled");
        }
    }

    nuovaCategoria.addEventListener("input", aggiornaCategoria);
    aggiornaCategoria();
});
</script>

</body>
</html>