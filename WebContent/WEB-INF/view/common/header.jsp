<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="it.progetto.model.Utente" %>

<%
    String uri = request.getRequestURI().toLowerCase();
    String context = request.getContextPath();

    boolean homeAttiva = uri.endsWith("/home") || uri.endsWith(context.toLowerCase() + "/");
    boolean catalogoAttivo = uri.endsWith("/catalogo") || uri.contains("/catalogo");
    boolean eventiAttivo = uri.endsWith("/eventi") || uri.contains("/eventi");
    boolean chiSiamoAttivo = uri.endsWith("/chi-siamo") || uri.contains("/chi-siamo");
    boolean carrelloAttivo = uri.endsWith("/carrello") || uri.contains("/carrello") || uri.contains("/carrelloservlet");
    boolean loginAttivo = uri.endsWith("/login") || uri.contains("/login");
    boolean ordiniAttivo = uri.contains("/ordini");

    boolean paginaSenzaFooter = loginAttivo || carrelloAttivo;
    String contattiHref = paginaSenzaFooter ? context + "/home#contatti" : "#contatti";

    Utente utenteLoggato = (Utente) session.getAttribute("utente");
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
            <a href="<%= contattiHref %>">Contatti</a>
        </nav>

        <div class="header-actions">
            <a href="${pageContext.request.contextPath}/CarrelloServlet" class="header-action <%= carrelloAttivo ? "active" : "" %>">
                <i class="bi bi-bag-heart"></i>
                <span>Carrello</span>
            </a>

            <% if (utenteLoggato != null) { %>
                <a href="${pageContext.request.contextPath}/ordini" class="header-action <%= ordiniAttivo ? "active" : "" %>">
                    <i class="bi bi-clock-history"></i>
                    <span>I miei Ordini</span>
                </a>
                
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="header-action">
                    <i class="bi bi-box-arrow-right"></i>
                    <span>Logout (<%= utenteLoggato.getNome() %>)</span>
                </a>
            <% } else { %>
                <a href="${pageContext.request.contextPath}/login" class="header-action <%= loginAttivo ? "active" : "" %>">
                    <i class="bi bi-person"></i>
                    <span>Login</span>
                </a>
            <% } %>
        </div>

    </div>
</header>