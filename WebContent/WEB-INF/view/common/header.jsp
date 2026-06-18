<%@ page import="it.progetto.model.Utente" %>
<%
    // Recuperiamo l'utente e il ruolo dalla sessione
    Utente utenteLoggato = (Utente) session.getAttribute("utente");
    String ruolo = (String) session.getAttribute("ruolo");
%>

<header>
    <div class="logo">Fiorista Maria</div>
    <nav>
        <a href="${pageContext.request.contextPath}/home">Home</a>
        <a href="${pageContext.request.contextPath}/catalogo">Catalogo</a>
        <a href="${pageContext.request.contextPath}/carrello">Carrello</a>

        <% if (utenteLoggato == null) { %>
            <a href="${pageContext.request.contextPath}/login">Login</a>
            <a href="${pageContext.request.contextPath}/registrazione">Registrati</a>
        <% } else if ("ADMIN".equalsIgnoreCase(ruolo)) { %>
            <a href="${pageContext.request.contextPath}/admin/dashboard" style="color: #ffeb3b;">Dashboard Admin</a>
            <a href="${pageContext.request.contextPath}/logout">Logout (<%= utenteLoggato.getNome() %>)</a>
        <% } else { %>
            <a href="${pageContext.request.contextPath}/ordini">I Miei Ordini</a>
            <a href="${pageContext.request.contextPath}/logout">Logout (<%= utenteLoggato.getNome() %>)</a>
        <% } %>
    </nav>
</header>