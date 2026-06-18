<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrati - Fiorista Maria</title>
    </head>
<body>

    <div class="registration-container">
        <h2>Crea un Account</h2>
        
        <%-- Mostra l'errore se le password non coincidono (gestito dalla tua Servlet alla riga 33) --%>
        <% if (request.getAttribute("errore") != null) { %>
            <p style="color: red;"><%= request.getAttribute("errore") %></p>
        <% } %>

        <form action="${pageContext.request.contextPath}/registrazione" method="post">
            <label for="nome">Nome:</label><br>
            <input type="text" id="nome" name="nome" required><br><br>

            <label for="cognome">Cognome:</label><br>
            <input type="text" id="cognome" name="cognome" required><br><br>

            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>

            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required><br><br>

            <label for="confermaPassword">Conferma Password:</label><br>
            <input type="password" id="confermaPassword" name="confermaPassword" required><br><br>

            <button type="submit">Registrati</button>
        </form>
    </div>

</body>
</html>