<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css">

<header class="main-header">

    <div class="header-top">

        <a href="${pageContext.request.contextPath}/home" class="header-logo">
            <div>
                <h1>Fiorista Maria</h1>
                <p>Addobbi floreali</p>
            </div>
        </a>

        <nav class="header-nav">
            <a href="${pageContext.request.contextPath}/home" class="active">Home</a>
            <a href="${pageContext.request.contextPath}/catalogo">Catalogo</a>
            <a href="#chi-siamo">Chi siamo</a>
            <a href="#eventi">Eventi</a>
            <a href="#contatti">Contatti</a>
        </nav>

        <div class="header-actions">
            <a href="#" class="header-action">
                <i class="bi bi-bag-heart"></i>
                <span>Carrello</span>
            </a>

            <a href="${pageContext.request.contextPath}/login" class="header-action">
                <i class="bi bi-person"></i>
                <span>Login</span>
            </a>
        </div>

    </div>

</header>