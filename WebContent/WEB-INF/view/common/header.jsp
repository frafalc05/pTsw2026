<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String uri = request.getRequestURI();

    boolean homeAttiva = uri.endsWith("/home") || uri.endsWith("/");
    boolean catalogoAttivo = uri.endsWith("/catalogo");
    boolean eventiAttivo = uri.endsWith("/eventi");
    boolean chiSiamoAttivo = uri.endsWith("/chi-siamo");
    boolean carrelloAttivo = uri.endsWith("/carrello");
    boolean loginAttivo = uri.endsWith("/login");
%>

<header class="main-header">
    <div class="header-top">

        <a href="${pageContext.request.contextPath}/home" class="header-logo">
            <img src="${pageContext.request.contextPath}/images/home/banner-header.png"
                 alt="Fiorista Maria - Addobbi Floreali">
        </a>

        <nav class="header-nav">
            <a href="${pageContext.request.contextPath}/home" class="<%= homeAttiva ? "active" : "" %>">Home</a>
            <a href="${pageContext.request.contextPath}/catalogo" class="<%= catalogoAttivo ? "active" : "" %>">Catalogo</a>
            <a href="${pageContext.request.contextPath}/chi-siamo" class="<%= chiSiamoAttivo ? "active" : "" %>">Chi siamo</a>
            <a href="${pageContext.request.contextPath}/eventi" class="<%= eventiAttivo ? "active" : "" %>">Eventi</a>
            <a href="#contatti" class="contatti-link">Contatti</a>
        </nav>

        <div class="header-actions">
            <a href="${pageContext.request.contextPath}/carrello" class="header-action <%= carrelloAttivo ? "active" : "" %>">
                <i class="bi bi-bag-heart"></i>
                <span>Carrello</span>
            </a>

            <a href="${pageContext.request.contextPath}/login" class="header-action <%= loginAttivo ? "active" : "" %>">
                <i class="bi bi-person"></i>
                <span>Login</span>
            </a>
        </div>

    </div>
</header>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const contattiLink = document.querySelector(".contatti-link");
        const navLinks = document.querySelectorAll(".header-nav a");

        if (contattiLink) {
            contattiLink.addEventListener("click", function () {
                navLinks.forEach(function (link) {
                    link.classList.remove("active");
                });
                contattiLink.classList.add("active");
            });
        }
    });
</script>