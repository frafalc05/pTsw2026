<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String uri = request.getRequestURI().toLowerCase();
    String context = request.getContextPath();

    boolean homeAttiva = uri.endsWith("/home") || uri.endsWith(context.toLowerCase() + "/");
    boolean catalogoAttivo = uri.endsWith("/catalogo") || uri.contains("/catalogo");
    boolean eventiAttivo = uri.endsWith("/eventi") || uri.contains("/eventi");
    boolean chiSiamoAttivo = uri.endsWith("/chi-siamo") || uri.contains("/chi-siamo");
    boolean carrelloAttivo = uri.endsWith("/carrello") || uri.contains("/carrello");
    boolean loginAttivo = uri.endsWith("/login") || uri.contains("/login");

    boolean paginaSenzaFooter = loginAttivo || carrelloAttivo;
    String contattiHref = paginaSenzaFooter ? context + "/home#contatti" : "#contatti";
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

            <%-- CONTROLLO LOGGATO / NON LOGGATO / ADMIN --%>
            <c:choose>
                <c:when test="${not empty sessionScope.utente}">
                    
                    <%-- Se l'utente in sessione ha il ruolo di 'admin', mostra il pannello di controllo --%>
                    <c:choose>
                        <c:when test="${sessionScope.utente.ruolo == 'admin'}">
                            <a href="${pageContext.request.contextPath}/AdminDashboardServlet" class="header-action">
                                <i class="bi bi-speedometer2"></i>
                                <span>Dashboard Admin</span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <%-- Se è un cliente normale, mostra il link standard ai suoi ordini --%>
                            <a href="${pageContext.request.contextPath}/ordini" class="header-action">
                                <i class="bi bi-journal-text"></i>
                                <span>I miei ordini</span>
                            </a>
                        </c:otherwise>
                    </c:choose>
                    
                    <%-- Pulsante Esci comune a tutte le tipologie di account loggati --%>
                    <a href="${pageContext.request.contextPath}/LogoutServlet" class="header-action">
                        <i class="bi bi-person-check-fill"></i>
                        <span>${sessionScope.utente.nome} (Esci)</span>
                    </a>
                </c:when>
                <c:otherwise>
                    <%-- Se non è presente alcun utente in sessione, mostra il pulsante di Login --%>
                    <a href="${pageContext.request.contextPath}/login" class="header-action">
                        <i class="bi bi-person"></i>
                        <span>Login</span>
                    </a>
                </c:otherwise>
            </c:choose>
            <a href="${pageContext.request.contextPath}/login" class="header-action <%= loginAttivo ? "active" : "" %>">
                <i class="bi bi-person"></i>
                <span>Login</span>
            </a>

        </div>

    </div>
</header>