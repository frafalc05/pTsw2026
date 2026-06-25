<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it">
<head>
    <title>Login - Fiorista Maria</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=30">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css?v=30">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/login.css?v=30">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/validation.css">
    <script src="${pageContext.request.contextPath}/scripts/validation.js?v=30" defer></script>
    
</head>
<body class="site-theme login-page">

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<section class="login-section">
    <div class="login-box">
        <h1>Accedi</h1>
        <p>Inserisci le tue credenziali per continuare.</p>

        <% if (request.getAttribute("errore") != null) { %>
            <div class="errore-login">
                <%= request.getAttribute("errore") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="post" class="login-form" novalidate>
            <label for="email">Email</label>
            <input 
                type="email" 
                id="email" 
                name="email" 
                placeholder="Inserisci la tua email">

            <label for="password">Password</label>
            <input 
                type="password" 
                id="password" 
                name="password" 
                placeholder="Inserisci la password">

            <button type="submit" class="btn-login">Accedi</button>
        </form>

        <p class="login-link">
            Non hai un account?
            <a href="${pageContext.request.contextPath}/registrazione">Registrati</a>
        </p>
    </div>
</section>


</body>
</html>