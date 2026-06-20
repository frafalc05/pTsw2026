<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="it.progetto.model.Prodotto" %>
<%
    // Recupera la lista dinamica inviata dalla Servlet del catalogo pubblico
    List<Prodotto> prodotti = (List<Prodotto>) request.getAttribute("prodotti");
%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Catalogo - Fiorista Maria</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=10">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css?v=10">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/catalogo.css?v=10">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css?v=10">
</head>

<body class="site-theme">

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<main>

    <section class="catalogo-intro">
        <h1>Catalogo</h1>
        <p>Scopri bouquet, composizioni floreali, piante, profumatori e idee regalo pensate per ogni occasioni speciale.</p>
    </section>

    <%-- FUNZIONE DI RENDERING FILTRATO E ACQUISIZIONE DATI REALE --%>
    <%! 
        // Controlla se la categoria contiene almeno un prodotto attivo nel DB
        boolean haProdotti(List<Prodotto> prodotti, String keyword) {
            if (prodotti == null || prodotti.isEmpty()) return false;
            String kw = keyword.toLowerCase().trim();
            
            for (Prodotto p : prodotti) {
                String nome = (p.getNome() != null) ? p.getNome().toLowerCase().trim() : "";
                String desc = (p.getDescrizione() != null) ? p.getDescrizione().toLowerCase().trim() : "";
                
                boolean appartiene = false;
                if (kw.equals("regali") || kw.equals("peluche")) {
                    appartiene = nome.contains("peluche") || desc.contains("peluche") || nome.contains("regalo");
                } else if (kw.equals("bouquet")) {
                    appartiene = nome.contains("bouquet");
                } else if (kw.equals("corone")) {
                    appartiene = nome.contains("corona") || nome.contains("laurea");
                } else if (kw.equals("eventi")) {
                    appartiene = nome.contains("allestimento") || nome.contains("centrotavola") || nome.contains("evento");
                } else if (kw.equals("flowercube")) {
                    appartiene = nome.contains("cube") || nome.contains("eterna");
                } else if (kw.equals("piante")) {
                    appartiene = (nome.contains("pianta") || nome.contains("orchidea")) && !nome.contains("marimo");
                } else if (kw.equals("profumatori")) {
                    appartiene = nome.contains("profumatore");
                } else if (kw.equals("terrarium")) {
                    appartiene = nome.contains("terrarium") || nome.contains("marimo") || desc.contains("terrarium");
                }
                
                if (appartiene) return true;
            }
            return false;
        }

        // Renderizza gli articoli della categoria specifica
        void renderCategoria(HttpServletRequest request, JspWriter out, List<Prodotto> prodotti, String keyword) throws java.io.IOException {
            if (prodotti == null || prodotti.isEmpty()) return;
            String kw = keyword.toLowerCase().trim();
            
            for (Prodotto p : prodotti) {
                String nome = (p.getNome() != null) ? p.getNome().toLowerCase().trim() : "";
                String desc = (p.getDescrizione() != null) ? p.getDescrizione().toLowerCase().trim() : "";
                boolean appartiene = false;
                
                if (kw.equals("regali") || kw.equals("peluche")) {
                    appartiene = nome.contains("peluche") || desc.contains("peluche") || nome.contains("regalo");
                } else if (kw.equals("bouquet")) {
                    appartiene = nome.contains("bouquet");
                } else if (kw.equals("corone")) {
                    appartiene = nome.contains("corona") || nome.contains("laurea");
                } else if (kw.equals("eventi")) {
                    appartiene = nome.contains("allestimento") || nome.contains("centrotavola") || nome.contains("evento");
                } else if (kw.equals("flowercube")) {
                    appartiene = nome.contains("cube") || nome.contains("eterna");
                } else if (kw.equals("piante")) {
                    appartiene = (nome.contains("pianta") || nome.contains("orchidea")) && !nome.contains("marimo");
                } else if (kw.equals("profumatori")) {
                    appartiene = nome.contains("profumatore");
                } else if (kw.equals("terrarium")) {
                    appartiene = nome.contains("terrarium") || nome.contains("marimo") || desc.contains("terrarium");
                }

                if (appartiene) {
                    String imgPath = p.getImmagine();
                    String srcTarget = request.getContextPath() + "/images/" + imgPath;
                    
                    out.print("<article class='prodotto-box'>");
                    out.print("  <img src='" + srcTarget + "' alt='" + p.getNome() + "'>");
                    out.print("  <div class='prodotto-info'>");
                    out.print("    <h3>" + p.getNome() + "</h3>");
                    out.print("    <p>" + p.getDescrizione() + "</p>");
                    out.print("    <p class='prezzo'>€ " + String.format("%.2f", p.getPrezzo()) + "</p>");
                    out.print("    <div class='carrello-controls'>");
                    out.print("        <input type='number' id='qta-" + p.getId() + "' value='1' min='1' class='qta-input'>");
                    out.print("        <button class='btn-add-carrello' data-id='" + p.getId() + "' type='button'>Aggiungi</button>");
                    out.print("    </div>");
                    out.print("    <a class='btn' href='#'>Dettagli</a>");
                    out.print("  </div>");
                    out.print("<" + "/article>");
                }
            }
        }
    %>

    <section class="categorie-tonde">
        <% if(haProdotti(prodotti, "bouquet")) { %>
        <a class="categoria-tonda" href="#bouquet">
            <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_tulipani.jpeg" alt="Bouquet">
            <span>Bouquet</span>
        </a>
        <% } %>

        <% if(haProdotti(prodotti, "corone")) { %>
        <a class="categoria-tonda" href="#corone">
            <img src="${pageContext.request.contextPath}/images/coronalaurea/corona_laurea_rose.jpeg" alt="Corone di Laurea">
            <span>Corone di Laurea</span>
        </a>
        <% } %>

        <% if(haProdotti(prodotti, "eventi")) { %>
        <a class="categoria-tonda" href="#eventi">
            <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio.jpeg" alt="Eventi e Cerimonie">
            <span>Eventi e Cerimonie</span>
        </a>
        <% } %>

        <% if(haProdotti(prodotti, "flowercube")) { %>
        <a class="categoria-tonda" href="#flowercube">
            <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube.jpeg" alt="Flower Cube">
            <span>Flower Cube</span>
        </a>
        <% } %>

        <% if(haProdotti(prodotti, "piante")) { %>
        <a class="categoria-tonda" href="#piante">
            <img src="${pageContext.request.contextPath}/images/piante/orchidea_bianca.jpeg" alt="Piante e Orchidee">
            <span>Piante e Orchidee</span>
        </a>
        <% } %>

        <% if(haProdotti(prodotti, "profumatori")) { %>
        <a class="categoria-tonda" href="#profumatori">
            <img src="${pageContext.request.contextPath}/images/profumatori/profumatore_muha_blu.jpeg" alt="Profumatori">
            <span>Profumatori</span>
        </a>
        <% } %>

        <% if(haProdotti(prodotti, "terrarium")) { %>
        <a class="categoria-tonda" href="#terrarium">
            <img src="${pageContext.request.contextPath}/images/terrarium/terrarium1.jpeg" alt="Terrarium">
            <span>Terrarium</span>
        </a>
        <% } %>

        <% if(haProdotti(prodotti, "regali")) { %>
        <a class="categoria-tonda" href="#regali">
            <img src="${pageContext.request.contextPath}/images/puluche.jpeg" alt="Idee Regalo">
            <span>Idee Regalo</span>
        </a>
        <% } %>
    </section>

    <% if(haProdotti(prodotti, "bouquet")) { %>
    <section id="bouquet" class="blocco-catalogo">
        <h2>Bouquet</h2>
        <div class="griglia-prodotti">
            <% renderCategoria(request, out, prodotti, "bouquet"); %>
        </div>
    </section>
    <% } %>

    <% if(haProdotti(prodotti, "corone")) { %>
    <section id="corone" class="blocco-catalogo">
        <h2>Corone di Laurea</h2>
        <div class="griglia-prodotti">
            <% renderCategoria(request, out, prodotti, "corone"); %>
        </div>
    </section>
    <% } %>

    <% if(haProdotti(prodotti, "eventi")) { %>
    <section id="eventi" class="blocco-catalogo">
        <h2>Eventi e Cerimonie</h2>
        <div class="griglia-prodotti">
            <% renderCategoria(request, out, prodotti, "eventi"); %>
        </div>
    </section>
    <% } %>

    <% if(haProdotti(prodotti, "flowercube")) { %>
    <section id="flowercube" class="blocco-catalogo">
        <h2>Flower Cube</h2>
        <div class="griglia-prodotti">
            <% renderCategoria(request, out, prodotti, "flowercube"); %>
        </div>
    </section>
    <% } %>

    <% if(haProdotti(prodotti, "piante")) { %>
    <section id="piante" class="blocco-catalogo">
        <h2>Piante e Orchidee</h2>
        <div class="griglia-prodotti">
            <% renderCategoria(request, out, prodotti, "piante"); %>
        </div>
    </section>
    <% } %>

    <% if(haProdotti(prodotti, "profumatori")) { %>
    <section id="profumatori" class="blocco-catalogo">
        <h2>Profumatori</h2>
        <div class="griglia-prodotti">
            <% renderCategoria(request, out, prodotti, "profumatori"); %>
        </div>
    </section>
    <% } %>

    <% if(haProdotti(prodotti, "terrarium")) { %>
    <section id="terrarium" class="blocco-catalogo">
        <h2>Terrarium</h2>
        <div class="griglia-prodotti">
            <% renderCategoria(request, out, prodotti, "terrarium"); %>
        </div>
    </section>
    <% } %>

    <% if(haProdotti(prodotti, "regali")) { %>
    <section id="regali" class="blocco-catalogo">
        <h2>Idee Regalo e Peluche</h2>
        <div class="griglia-prodotti">
            <% renderCategoria(request, out, prodotti, "regali"); %>
        </div>
    </section>
    <% } %>

</main>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

<script src="${pageContext.request.contextPath}/scripts/carrello.js?v=10"></script>

</body>
</html>