<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Fiorista Maria</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/primocss.css">
</head>
<body>

<header>
    <h1>Fiorista Maria</h1>

    <nav>
        <a href="${pageContext.request.contextPath}/home">Home</a>
        <a href="${pageContext.request.contextPath}/catalogo">Catalogo</a>
        <a href="${pageContext.request.contextPath}/carrello">Carrello</a>
        <a href="${pageContext.request.contextPath}/login">Login</a>
    </nav>
</header>

<main>
    <section class="hero">
        <h2>Fiori, bouquet e composizioni per ogni occasione</h2>
        <p>
            Acquista online fiori freschi, piante ornamentali e composizioni personalizzate
            con consegna a domicilio.
        </p>
        <a class="btn" href="${pageContext.request.contextPath}/catalogo">Vai al catalogo</a>
    </section>
</main>

<footer>
    <p>&copy; 2026 Fiorista Maria</p>
</footer>

</body>
</html>