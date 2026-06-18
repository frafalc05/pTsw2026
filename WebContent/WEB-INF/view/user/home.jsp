<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Fiorista Maria</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style1.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
</head>
<body>

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<section class="hero">
    <h1>Fiori freschi per ogni emozione</h1>
    <p>Bouquet, piante e composizioni floreali personalizzate con consegna a domicilio.</p>
    <a class="btn" href="${pageContext.request.contextPath}/catalogo">Scopri il catalogo</a>
</section>

<section class="sezione">
    <h2>Prodotti in evidenza</h2>

    <div class="prodotti">
        <div class="card">
            <img src="${pageContext.request.contextPath}/images/image.jpg" alt="Bouquet romantico">
            <h3>Bouquet romantico</h3>
            <p>Perfetto per anniversari e occasioni speciali.</p>
            <p class="prezzo">€ 29,90</p>
            <a class="btn" href="${pageContext.request.contextPath}/catalogo">Acquista</a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/image.jpg" alt="Rose rosse">
            <h3>Rose rosse</h3>
            <p>Un classico elegante per dire ti amo.</p>
            <p class="prezzo">€ 39,90</p>
            <a class="btn" href="${pageContext.request.contextPath}/catalogo">Acquista</a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/image.jpg" alt="Pianta ornamentale">
            <h3>Pianta ornamentale</h3>
            <p>Ideale per casa, ufficio o regalo.</p>
            <p class="prezzo">€ 24,90</p>
            <a class="btn" href="${pageContext.request.contextPath}/catalogo">Acquista</a>
        </div>
    </div>
</section>

<section class="sezione info">
    <h2>Perché scegliere Fiorista Maria?</h2>
    <p>
        Offriamo fiori freschi, composizioni personalizzate e consegna a domicilio
        per compleanni, anniversari, lauree, matrimoni e occasioni speciali.
    </p>
</section>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

</body>
</html>