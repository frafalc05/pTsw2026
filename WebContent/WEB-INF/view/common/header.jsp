<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<header class="main-header">

    <div class="header-top">

        <a href="${pageContext.request.contextPath}/home" class="header-logo">
            <img src="${pageContext.request.contextPath}/images/home/banner-header.png" alt="Fiorista Maria - Addobbi Floreali">
        </a>

        <nav class="header-nav">
            <a href="${pageContext.request.contextPath}/home" class="active">Home</a>
            <a href="${pageContext.request.contextPath}/catalogo">Catalogo</a>
            <a href="#chi-siamo">Chi siamo</a>
            <a href="#eventi">Eventi</a>
            <a href="#contatti">Contatti</a>
        </nav>

        <div class="header-actions">
            <a href="${pageContext.request.contextPath}/CarrelloServlet" class="header-action">
                <i class="bi bi-bag-heart"></i>
                <span>Carrello <span id="quantita-carrello">(0)</span></span>
            </a>

            <%-- CONTROLLO LOGGATO / NON LOGGATO --%>
            <c:choose>
                <c:when test="${not empty sessionScope.utente}">
                    <a href="${pageContext.request.contextPath}/ordini" class="header-action">
                        <i class="bi bi-journal-text"></i>
                        <span>I miei ordini</span>
                    </a>
                    
                    <a href="${pageContext.request.contextPath}/logout" class="header-action">
                        <i class="bi bi-person-check-fill"></i>
                        <span>${sessionScope.utente.nome} (Esci)</span>
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="header-action">
                        <i class="bi bi-person"></i>
                        <span>Login</span>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>

    </div>

</header>