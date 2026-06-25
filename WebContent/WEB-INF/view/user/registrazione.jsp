<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrati - Fiorista Maria</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="styles/header.css">
    <link rel="stylesheet" href="styles/base.css">
	<link rel="stylesheet" href="styles/login.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/validation.css">
	<script src="${pageContext.request.contextPath}/scripts/validationRegistrazione.js?v=30" defer></script>
</head>
<body>

    
<jsp:include page="/WEB-INF/view/common/header.jsp" />

    <main class="register-section">
        <div class="register-box">
            <h1>Crea un Account</h1>
            <p>Inserisci i tuoi dati per registrarti.</p>


            <% if (request.getAttribute("errore") != null) { %>
                <div class="errore-login">
                    <%= request.getAttribute("errore") %>
                </div>
            <% } %>

            <form class="register-form" action="${pageContext.request.contextPath}/registrazione" method="post"novalidate>
                
                <label for="nome">Nome</label>
                <input type="text" id="nome" name="nome" placeholder="Inserisci il tuo nome">

                <label for="cognome">Cognome</label>
                <input type="text" id="cognome" name="cognome" placeholder="Inserisci il tuo cognome">

                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Inserisci la tua email" >

                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Crea una password">

                <label for="confermaPassword">Conferma Password</label>
                <input type="password" id="confermaPassword" name="confermaPassword" placeholder="Ripeti la password">

                <button type="submit" class="btn-login">Registrati</button>
            </form>

            <div class="login-link">
                Hai già un account? <a href="${pageContext.request.contextPath}/login">Accedi</a>
            </div>
        </div>
    </main>

</body>
</html>