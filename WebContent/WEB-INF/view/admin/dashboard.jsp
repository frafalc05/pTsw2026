<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin - Fiorista Maria</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style1.css">
</head>
<body>

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<main style="padding: 40px; text-align: center;">
    <h1>Pannello di Controllo Amministratore</h1>
    <p>Benvenuta Maria! Da qui potrai gestire i tuoi fiori, vedere gli ordini e modificare il catalogo.</p>
</main>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

</body>
</html>