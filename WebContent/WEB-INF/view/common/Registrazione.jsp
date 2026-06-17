<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <title>Registrazione - Fiorista Maria</title>

    <link rel="stylesheet" 
          href="${pageContext.request.contextPath}/styles/style1.css">
</head>


<body>

<jsp:include page="/WEB-INF/view/common/header.jsp" />


<section class="register-section">

    <div class="register-box">

        <h1>Crea Account</h1>

        <p>
            Registrati per acquistare i nostri prodotti floreali
            e seguire i tuoi ordini.
        </p>


        <% if(request.getAttribute("errore") != null){ %>

            <div class="errore-login">
                <%= request.getAttribute("errore") %>
            </div>

        <% } %>


        <form 
        action="${pageContext.request.contextPath}/registrazione"
        method="post"
        class="register-form"
        id="formRegistrazione">


            <label>Nome</label>

            <input 
            type="text"
            name="nome"
            id="nome"
            placeholder="Il tuo nome"
            required>


            <label>Cognome</label>

            <input
            type="text"
            name="cognome"
            id="cognome"
            placeholder="Il tuo cognome"
            required>



            <label>Email</label>

            <input
            type="email"
            name="email"
            id="email"
            placeholder="email@example.com"
            required>



            <label>Password</label>

            <input
            type="password"
            name="password"
            id="password"
            placeholder="Crea una password"
            required>



            <label>Conferma password</label>

            <input
            type="password"
            name="confermaPassword"
            id="confermaPassword"
            placeholder="Ripeti password"
            required>



            <button type="submit" class="btn-login">
                Registrati
            </button>


        </form>



        <p class="login-link">

            Hai già un account?

            <a href="${pageContext.request.contextPath}/login">
                Accedi
            </a>

        </p>


    </div>

</section>



<jsp:include page="/WEB-INF/view/common/footer.jsp" />


<script src="${pageContext.request.contextPath}/scripts/registrazione.js"></script>

</body>

</html>
