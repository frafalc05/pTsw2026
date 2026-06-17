<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Catalogo - Fiorista Maria</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style1.css">
</head>

<body>

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<section class="catalogo-hero">
    <h1>Il nostro catalogo</h1>
    <p>Composizioni floreali, bouquet, piante, terrarium e creazioni per eventi speciali.</p>
</section>

<section class="sezione">
    <h2>Categorie</h2>

    <div class="categorie-catalogo">
        <a href="#bouquet">Bouquet d'Autore</a>
        <a href="#corone">Corone di Laurea</a>
        <a href="#eventi">Eventi e Cerimonie</a>
        <a href="#flowercube">Flower Cube</a>
        <a href="#piante">Piante e Orchidee</a>
        <a href="#profumatori">Profumatori Floreali</a>
        <a href="#terrarium">Terrarium</a>
    </div>
</section>

<section class="sezione" id="bouquet">
    <h2>Bouquet d'Autore</h2>
    <div class="prodotti">
        <div class="card">
            <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_sposa.jpg" alt="Bouquet sposa">
            <h3>Bouquet Sposa Elegance</h3>
            <p>Bouquet raffinato con rose bianche e gypsophila.</p>
            <p class="prezzo">€89,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_tulipani.jpg" alt="Bouquet tulipani">
            <h3>Bouquet Tulipani Bianchi</h3>
            <p>Composizione elegante e luminosa con tulipani freschi.</p>
            <p class="prezzo">€39,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/bouquet/bouquet2.jpeg" alt="Bouquet misto">
            <h3>Bouquet Primavera</h3>
            <p>Fiori misti colorati per compleanni e occasioni speciali.</p>
            <p class="prezzo">€44,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>
    </div>
</section>

<section class="sezione" id="corone">
    <h2>Corone di Laurea</h2>
    <div class="prodotti">
        <div class="card">
            <img src="${pageContext.request.contextPath}/images/coronalarea/corona_laurea_rossa.jpg" alt="Corona laurea">
            <h3>Corona di Laurea Classica</h3>
            <p>Corona con alloro fresco e rose rosse.</p>
            <p class="prezzo">€29,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/coronalarea/corona_laurea2.jpg" alt="Corona laurea personalizzata">
            <h3>Corona di Laurea Personalizzata</h3>
            <p>Corona con dettagli floreali personalizzabili.</p>
            <p class="prezzo">€34,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>
    </div>
</section>

<section class="sezione" id="eventi">
    <h2>Eventi e Cerimonie</h2>
    <div class="prodotti">
        <div class="card">
            <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio.jpeg" alt="Allestimento matrimonio">
            <h3>Allestimento Matrimonio</h3>
            <p>Decorazioni floreali per location, tavoli e cerimonia.</p>
            <p class="prezzo">Da €250,00</p>
            <a class="btn" href="#">Dettagli</a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/eventi/evento1.jpeg" alt="Centrotavola evento">
            <h3>Centrotavola Floreale</h3>
            <p>Composizione elegante per eventi e ricevimenti.</p>
            <p class="prezzo">Da €45,00</p>
            <a class="btn" href="#">Dettagli</a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/eventi/evento2.jpeg" alt="Composizione cerimonia">
            <h3>Composizione da Cerimonia</h3>
            <p>Fiori delicati per chiese, sale e ingressi.</p>
            <p class="prezzo">Da €70,00</p>
            <a class="btn" href="#">Dettagli</a>
        </div>
    </div>
</section>

<section class="sezione" id="flowercube">
    <h2>Flower Cube</h2>
    <div class="prodotti">
        <div class="card">
            <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube.jpeg" alt="Flower cube">
            <h3>Flower Cube Rosso</h3>
            <p>Rosa stabilizzata in cubo elegante.</p>
            <p class="prezzo">€49,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube2.jpg" alt="Rosa in campana">
            <h3>Rosa Eterna in Campana</h3>
            <p>Rosa stabilizzata sotto vetro, perfetta come regalo.</p>
            <p class="prezzo">€59,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube3.jpg" alt="Cuore rose">
            <h3>Cuore di Rose</h3>
            <p>Composizione romantica con rose stabilizzate.</p>
            <p class="prezzo">€69,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>
    </div>
</section>

<section class="sezione" id="piante">
    <h2>Piante e Orchidee</h2>
    <div class="prodotti">
        <div class="card">
            <img src="${pageContext.request.contextPath}/images/piante/orchidea_bianca.jpg" alt="Orchidea bianca">
            <h3>Orchidea Bianca</h3>
            <p>Pianta elegante da interno, ideale anche come regalo.</p>
            <p class="prezzo">€34,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/piante/piantagialla.jpeg" alt="Pianta ornamentale">
            <h3>Pianta Ornamentale</h3>
            <p>Pianta decorativa per casa, ufficio o attività commerciali.</p>
            <p class="prezzo">€24,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>
    </div>
</section>

<section class="sezione" id="profumatori">
    <h2>Profumatori Floreali</h2>
    <div class="prodotti">
        <div class="card">
            <img src="${pageContext.request.contextPath}/images/profumatori/profumatore_muschio.jpg" alt="Profumatore floreale">
            <h3>Profumatore Muschio e Fiori</h3>
            <p>Profumatore decorativo con dettagli floreali.</p>
            <p class="prezzo">€19,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>
    </div>
</section>

<section class="sezione" id="terrarium">
    <h2>Terrarium</h2>
    <div class="prodotti">
        <div class="card">
            <img src="${pageContext.request.contextPath}/images/terrarium/terrarium1.jpeg" alt="Terrarium">
            <h3>Terrarium Elegance</h3>
            <p>Composizione in vetro con piante e muschio decorativo.</p>
            <p class="prezzo">€39,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/terrarium/terrarium2.jpeg" alt="Terrarium natura">
            <h3>Terrarium Natura</h3>
            <p>Piccolo ecosistema decorativo in contenitore di vetro.</p>
            <p class="prezzo">€44,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/terrarium/terrarium3.jpeg" alt="Marimo">
            <h3>Marimo in Vetro</h3>
            <p>Decorazione acquatica con marimo e pietre naturali.</p>
            <p class="prezzo">€24,90</p>
            <a class="btn" href="#">Dettagli</a>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

</body>
</html>