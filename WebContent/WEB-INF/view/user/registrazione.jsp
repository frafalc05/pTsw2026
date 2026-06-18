<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrati - Fiorista Maria</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css">
    <link rel="stylesheet" href="styles/style1.css">
	<link rel="stylesheet" href="styles/login.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css">
</head>
<body>

    <header>
        <div class="logo">Fiorista Maria</div>
        <nav>
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/catalogo">Catalogo</a>
            <a href="${pageContext.request.contextPath}/carrello">Carrello</a>
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </nav>
    </header>

    <main class="register-section">
        <div class="register-box">
            <h1>Crea un Account</h1>
            <p>Inserisci i tuoi dati per registrarti.</p>


            <% if (request.getAttribute("errore") != null) { %>
                <div class="errore-login">
                    <%= request.getAttribute("errore") %>
                </div>
            <% } %>

            <form class="register-form" action="${pageContext.request.contextPath}/registrazione" method="post">
                
                <label for="nome">Nome</label>
                <input type="text" id="nome" name="nome" placeholder="Inserisci il tuo nome" required>

                <label for="cognome">Cognome</label>
                <input type="text" id="cognome" name="cognome" placeholder="Inserisci il tuo cognome" required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Inserisci la tua email" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Crea una password" required>

                <label for="confermaPassword">Conferma Password</label>
                <input type="password" id="confermaPassword" name="confermaPassword" placeholder="Ripeti la password" required>

                <button type="submit" class="btn-login">Registrati</button>
            </form>

            <div class="login-link">
                Hai già un account? <a href="${pageContext.request.contextPath}/login">Accedi</a>
            </div>
        </div>
    </main>

    <jsp:include page="/WEB-INF/view/common/footer.jsp" />

</body>
</html>