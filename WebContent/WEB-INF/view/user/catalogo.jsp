<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="it.progetto.model.Prodotto" %>

<%
    List<Prodotto> prodotti = (List<Prodotto>) request.getAttribute("prodotti");
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Catalogo - Fiorista Maria</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=60">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css?v=60">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/catalogo.css?v=60">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css?v=60">
</head>

<body class="site-theme">

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<main>

    <section class="catalogo-intro">
        <h1>Catalogo</h1>
        <p>Scopri bouquet, composizioni floreali, piante, profumatori e idee regalo pensate per ogni occasione speciale.</p>
    </section>

    <%!
        boolean haProdotti(List<Prodotto> prodotti, String categoriaRichiesta) {
            if (prodotti == null || prodotti.isEmpty()) {
                return false;
            }

            for (Prodotto p : prodotti) {
                String categoria = (p.getCategoria() != null) ? p.getCategoria().trim() : "";

                if (categoria.equalsIgnoreCase(categoriaRichiesta)) {
                    return true;
                }
            }

            return false;
        }

        void renderCategoria(HttpServletRequest request, JspWriter out, List<Prodotto> prodotti, String categoriaRichiesta) throws java.io.IOException {
            if (prodotti == null || prodotti.isEmpty()) {
                return;
            }

            for (Prodotto p : prodotti) {
                String categoria = (p.getCategoria() != null) ? p.getCategoria().trim() : "";

                if (categoria.equalsIgnoreCase(categoriaRichiesta)) {
                    String imgPath = (p.getImmagine() != null) ? p.getImmagine().trim() : "";
                    String srcTarget = request.getContextPath() + "/images/" + imgPath;

                    out.print("<article class='prodotto-box'>");
                    out.print("<img src='" + srcTarget + "' alt='" + p.getNome() + "'>");
                    out.print("<div class='prodotto-info'>");
                    out.print("<h3>" + p.getNome() + "</h3>");
                    out.print("<p>" + p.getDescrizione() + "</p>");
                    out.print("<p class='prezzo'>€ " + String.format("%.2f", p.getPrezzo()) + "</p>");
                    out.print("<div class='carrello-controls'>");
                    out.print("<input type='number' id='qta-" + p.getId() + "' value='1' min='1' class='qta-input'>");
                    out.print("<button class='btn-add-carrello' data-id='" + p.getId() + "' type='button'>Aggiungi</button>");
                    out.print("</div>");
                    out.print("</div>");
                    out.print("</article>");
                }
            }
        }
    %>

    <section class="categorie-tonde">
        <% if (haProdotti(prodotti, "Bouquet")) { %>
            <a class="categoria-tonda" href="#bouquet">
                <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_tulipani.jpeg" alt="Bouquet">
                <span>Bouquet</span>
            </a>
        <% } %>

        <% if (haProdotti(prodotti, "Corone di Laurea")) { %>
            <a class="categoria-tonda" href="#corone">
                <img src="${pageContext.request.contextPath}/images/coronalaurea/corona_laurea_rose.jpeg" alt="Corone di Laurea">
                <span>Corone di Laurea</span>
            </a>
        <% } %>

        <% if (haProdotti(prodotti, "Eventi e Cerimonie")) { %>
            <a class="categoria-tonda" href="#eventi">
                <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio.jpeg" alt="Eventi e Cerimonie">
                <span>Eventi e Cerimonie</span>
            </a>
        <% } %>

        <% if (haProdotti(prodotti, "Flower Cube")) { %>
            <a class="categoria-tonda" href="#flowercube">
                <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube.jpeg" alt="Flower Cube">
                <span>Flower Cube</span>
            </a>
        <% } %>

        <% if (haProdotti(prodotti, "Piante e Orchidee")) { %>
            <a class="categoria-tonda" href="#piante">
                <img src="${pageContext.request.contextPath}/images/piante/orchidea_bianca.jpeg" alt="Piante e Orchidee">
                <span>Piante e Orchidee</span>
            </a>
        <% } %>

        <% if (haProdotti(prodotti, "Profumatori")) { %>
            <a class="categoria-tonda" href="#profumatori">
                <img src="${pageContext.request.contextPath}/images/profumatori/profumatore_muha_blu.jpeg" alt="Profumatori">
                <span>Profumatori</span>
            </a>
        <% } %>

        <% if (haProdotti(prodotti, "Terrarium")) { %>
            <a class="categoria-tonda" href="#terrarium">
                <img src="${pageContext.request.contextPath}/images/terrarium/terrarium1.jpeg" alt="Terrarium">
                <span>Terrarium</span>
            </a>
        <% } %>

        <% if (haProdotti(prodotti, "Idee Regalo")) { %>
            <a class="categoria-tonda" href="#regali">
                <img src="${pageContext.request.contextPath}/images/puluche/puluche.jpeg" alt="Idee Regalo">
                <span>Idee Regalo</span>
            </a>
        <% } %>
    </section>

    <% if (haProdotti(prodotti, "Bouquet")) { %>
        <section id="bouquet" class="blocco-catalogo">
            <h2>Bouquet</h2>

            <div class="griglia-prodotti">
                <% renderCategoria(request, out, prodotti, "Bouquet"); %>
            </div>

            <a class="instagram-category-link" href="https://www.instagram.com/stories/highlights/17995067203847328/" target="_blank" rel="noopener noreferrer">
                <i class="bi bi-instagram"></i>
                <span>Visualizza di più nella nostra pagina Instagram</span>
            </a>
        </section>
    <% } %>

    <% if (haProdotti(prodotti, "Corone di Laurea")) { %>
        <section id="corone" class="blocco-catalogo">
            <h2>Corone di Laurea</h2>

            <div class="griglia-prodotti">
                <% renderCategoria(request, out, prodotti, "Corone di Laurea"); %>
            </div>

            <a class="instagram-category-link" href="https://www.instagram.com/stories/highlights/17844852000118610/" target="_blank" rel="noopener noreferrer">
                <i class="bi bi-instagram"></i>
                <span>Visualizza di più nella nostra pagina Instagram</span>
            </a>
        </section>
    <% } %>

    <% if (haProdotti(prodotti, "Eventi e Cerimonie")) { %>
        <section id="eventi" class="blocco-catalogo">
            <h2>Eventi e Cerimonie</h2>

            <div class="griglia-prodotti">
                <% renderCategoria(request, out, prodotti, "Eventi e Cerimonie"); %>
            </div>

            <a class="instagram-category-link" href="https://www.instagram.com/stories/highlights/17871661169641258/" target="_blank" rel="noopener noreferrer">
                <i class="bi bi-instagram"></i>
                <span>Visualizza di più nella nostra pagina Instagram</span>
            </a>
        </section>
    <% } %>

    <% if (haProdotti(prodotti, "Flower Cube")) { %>
        <section id="flowercube" class="blocco-catalogo">
            <h2>Flower Cube</h2>

            <div class="griglia-prodotti">
                <% renderCategoria(request, out, prodotti, "Flower Cube"); %>
            </div>

            <a class="instagram-category-link" href="https://www.instagram.com/stories/highlights/17861236106643197/" target="_blank" rel="noopener noreferrer">
                <i class="bi bi-instagram"></i>
                <span>Visualizza di più nella nostra pagina Instagram</span>
            </a>
        </section>
    <% } %>

    <% if (haProdotti(prodotti, "Piante e Orchidee")) { %>
        <section id="piante" class="blocco-catalogo">
            <h2>Piante e Orchidee</h2>

            <div class="griglia-prodotti">
                <% renderCategoria(request, out, prodotti, "Piante e Orchidee"); %>
            </div>
        </section>
    <% } %>

    <% if (haProdotti(prodotti, "Profumatori")) { %>
        <section id="profumatori" class="blocco-catalogo">
            <h2>Profumatori</h2>

            <div class="griglia-prodotti">
                <% renderCategoria(request, out, prodotti, "Profumatori"); %>
            </div>
        </section>
    <% } %>

    <% if (haProdotti(prodotti, "Terrarium")) { %>
        <section id="terrarium" class="blocco-catalogo">
            <h2>Terrarium</h2>

            <div class="griglia-prodotti">
                <% renderCategoria(request, out, prodotti, "Terrarium"); %>
            </div>
        </section>
    <% } %>

    <% if (haProdotti(prodotti, "Idee Regalo")) { %>
        <section id="regali" class="blocco-catalogo">
            <h2>Idee Regalo e Peluche</h2>

            <div class="griglia-prodotti">
                <% renderCategoria(request, out, prodotti, "Idee Regalo"); %>
            </div>
        </section>
    <% } %>

</main>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

<script src="${pageContext.request.contextPath}/scripts/carrello.js?v=60"></script>

</body>
</html>