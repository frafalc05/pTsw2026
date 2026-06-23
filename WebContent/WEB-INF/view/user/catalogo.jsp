<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="it.progetto.model.Prodotto" %>

<%
    List<Prodotto> prodotti = (List<Prodotto>) request.getAttribute("prodotti");

    Map<String, List<Prodotto>> prodottiPerCategoria = new LinkedHashMap<>();

    if (prodotti != null) {
        for (Prodotto p : prodotti) {
            String categoria = (p.getCategoria() != null && !p.getCategoria().trim().isEmpty()) ? p.getCategoria().trim() : "Altro";

            if (!prodottiPerCategoria.containsKey(categoria)) {
                prodottiPerCategoria.put(categoria, new ArrayList<Prodotto>());
            }

            prodottiPerCategoria.get(categoria).add(p);
        }
    }
%>

<%!
    String creaIdCategoria(String categoria) {
        if (categoria == null || categoria.trim().isEmpty()) {
            return "altro";
        }

        String valore = categoria.toLowerCase().trim();

        valore = valore.replace("à", "a");
        valore = valore.replace("è", "e");
        valore = valore.replace("é", "e");
        valore = valore.replace("ì", "i");
        valore = valore.replace("ò", "o");
        valore = valore.replace("ù", "u");

        valore = valore.replaceAll("[^a-z0-9]", "");

        if (valore.isEmpty()) {
            return "altro";
        }

        return valore;
    }

    void renderProdotto(HttpServletRequest request, JspWriter out, Prodotto p) throws java.io.IOException {
        String imgPath = (p.getImmagine() != null) ? p.getImmagine().trim() : "";
        String srcTarget = request.getContextPath() + "/immagine-prodotto/" + imgPath;

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
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Catalogo - Fiorista Maria</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=1200">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css?v=1200">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/catalogo.css?v=1200">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css?v=1200">
</head>

<body class="site-theme">

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<main>

    <section class="catalogo-intro">
        <h1>Catalogo</h1>
        <p>Scopri bouquet, composizioni floreali, piante, profumatori e idee regalo pensate per ogni occasione speciale.</p>
    </section>

    <% if (!prodottiPerCategoria.isEmpty()) { %>
        <section class="categorie-tonde">
            <% for (Map.Entry<String, List<Prodotto>> entry : prodottiPerCategoria.entrySet()) {
                String categoria = entry.getKey();
                List<Prodotto> listaCategoria = entry.getValue();
                String idCategoria = creaIdCategoria(categoria);
                String immagineCategoria = "";

                if (listaCategoria != null && !listaCategoria.isEmpty() && listaCategoria.get(0).getImmagine() != null) {
                    immagineCategoria = listaCategoria.get(0).getImmagine();
                }
            %>
                <a class="categoria-tonda" href="#<%= idCategoria %>">
                    <img src="${pageContext.request.contextPath}/immagine-prodotto/<%= immagineCategoria %>" alt="<%= categoria %>">
                    <span><%= categoria %></span>
                </a>
            <% } %>
        </section>

        <% for (Map.Entry<String, List<Prodotto>> entry : prodottiPerCategoria.entrySet()) {
            String categoria = entry.getKey();
            List<Prodotto> listaCategoria = entry.getValue();
            String idCategoria = creaIdCategoria(categoria);
        %>
            <section id="<%= idCategoria %>" class="blocco-catalogo">
                <h2><%= categoria %></h2>

                <div class="griglia-prodotti">
                    <% for (Prodotto p : listaCategoria) {
                        renderProdotto(request, out, p);
                    } %>
                </div>

                <% if ("Bouquet".equalsIgnoreCase(categoria)) { %>
                    <a class="instagram-category-link" href="https://www.instagram.com/stories/highlights/17995067203847328/" target="_blank" rel="noopener noreferrer">
                        <i class="bi bi-instagram"></i>
                        <span>Visualizza di più nella nostra pagina Instagram</span>
                    </a>
                <% } else if ("Corone di Laurea".equalsIgnoreCase(categoria)) { %>
                    <a class="instagram-category-link" href="https://www.instagram.com/stories/highlights/17844852000118610/" target="_blank" rel="noopener noreferrer">
                        <i class="bi bi-instagram"></i>
                        <span>Visualizza di più nella nostra pagina Instagram</span>
                    </a>
                <% } else if ("Eventi e Cerimonie".equalsIgnoreCase(categoria)) { %>
                    <a class="instagram-category-link" href="https://www.instagram.com/stories/highlights/17871661169641258/" target="_blank" rel="noopener noreferrer">
                        <i class="bi bi-instagram"></i>
                        <span>Visualizza di più nella nostra pagina Instagram</span>
                    </a>
                <% } else if ("Flower Cube".equalsIgnoreCase(categoria)) { %>
                    <a class="instagram-category-link" href="https://www.instagram.com/stories/highlights/17861236106643197/" target="_blank" rel="noopener noreferrer">
                        <i class="bi bi-instagram"></i>
                        <span>Visualizza di più nella nostra pagina Instagram</span>
                    </a>
                <% } %>
            </section>
        <% } %>
    <% } else { %>
        <section class="catalogo-intro">
            <p>Al momento non sono presenti prodotti nel catalogo.</p>
        </section>
    <% } %>

</main>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

<script src="${pageContext.request.contextPath}/scripts/carrello.js?v=1200"></script>

</body>
</html>