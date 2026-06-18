<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Fiorista Maria - Addobbi Floreali</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css">
</head>

<body>

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<main class="home-page">

    <!-- HERO -->
    <section class="home-hero">

        <div class="hero-floral-banner"></div>

        <div class="hero-content">
            <h1>Fiorista Maria</h1>
            <h2>Addobbi floreali</h2>

            <p>
                Eleganza, passione e creatività in ogni composizione.
                Bouquet, piante e allestimenti floreali per ogni occasione speciale.
                Regala emozioni, celebra la bellezza della natura.
            </p>

            <div class="hero-buttons">
                <a href="${pageContext.request.contextPath}/catalogo" class="btn-primary-home">
                    Scopri il catalogo
                </a>

                <a href="https://wa.me/393485238469" target="_blank" class="btn-secondary-home">
                    Ordina su WhatsApp
                </a>
            </div>
        </div>

    </section>

    <!-- CATEGORIE TONDE -->
    <section class="home-categories">

        <a class="home-category" href="${pageContext.request.contextPath}/catalogo#bouquet">
            <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_tulipani.jpeg" alt="Bouquet">
            <span>Bouquet</span>
        </a>

        <a class="home-category" href="${pageContext.request.contextPath}/catalogo#corone">
            <img src="${pageContext.request.contextPath}/images/coronalaurea/corona_laurea_rose.jpeg" alt="Corone di Laurea">
            <span>Corone di Laurea</span>
        </a>

        <a class="home-category" href="${pageContext.request.contextPath}/catalogo#eventi">
            <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio.jpeg" alt="Eventi">
            <span>Eventi e Cerimonie</span>
        </a>

        <a class="home-category" href="${pageContext.request.contextPath}/catalogo#flowercube">
            <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube.jpeg" alt="Flower Cube">
            <span>Flower Cube</span>
        </a>

        <a class="home-category" href="${pageContext.request.contextPath}/catalogo#piante">
            <img src="${pageContext.request.contextPath}/images/piante/orchidea_bianca.jpeg" alt="Piante">
            <span>Piante e Orchidee</span>
        </a>

        <a class="home-category" href="${pageContext.request.contextPath}/catalogo#profumatori">
            <img src="${pageContext.request.contextPath}/images/profumatori/profumatore_muha_blu.jpeg" alt="Profumatori">
            <span>Profumatori</span>
        </a>

        <a class="home-category" href="${pageContext.request.contextPath}/catalogo#terrarium">
            <img src="${pageContext.request.contextPath}/images/terrarium/terrarium1.jpeg" alt="Terrarium">
            <span>Terrarium</span>
        </a>

    </section>

    <!-- CHI SIAMO -->
    <section id="chi-siamo" class="home-about">

        <div class="about-text">
            <span class="section-kicker">La nostra storia</span>
            <h2>Fiori, emozioni e dettagli che restano nel tempo</h2>

            <p>
                Fiorista Maria nasce dall’amore per i fiori e dalla cura per ogni piccolo dettaglio.
                Realizziamo bouquet, composizioni floreali, piante ornamentali, addobbi per cerimonie,
                eventi e idee regalo personalizzate.
            </p>

            <p>
                Ogni creazione viene pensata per raccontare un’emozione: un gesto d’amore,
                un augurio speciale, un ricordo importante o un momento da celebrare.
            </p>

            <a href="${pageContext.request.contextPath}/catalogo" class="about-link">
                Guarda le nostre creazioni
            </a>
        </div>

        <div class="about-image-card">
            <img src="${pageContext.request.contextPath}/images/home/home1.jpeg" alt="Fiorista Maria negozio">
        </div>

    </section>

    <!-- CONTENUTO PRODOTTI + RECENSIONI -->
    <section class="home-showcase">

        <div class="home-products">

            <!-- SELEZIONATI -->
            <section class="product-section">
                <div class="section-title-row">
                    <h2>Selezionati per te</h2>
                    <a href="${pageContext.request.contextPath}/catalogo">Vedi tutto</a>
                </div>

                <div class="product-grid-home">

                    <article class="home-product-card">
                        <img src="${pageContext.request.contextPath}/images/bouquet/bouquet2.jpeg" alt="Bouquet romantico">
                        <div class="home-product-info">
                            <h3>Bouquet Romantic Pink</h3>
                            <p>Composizione delicata sui toni rosa e crema.</p>
                            <span>€ 59,00</span>
                        </div>
                    </article>

                    <article class="home-product-card">
                        <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube2.jpeg" alt="Flower Cube">
                        <div class="home-product-info">
                            <h3>Flower Cube Rosa</h3>
                            <p>Elegante box floreale per regali speciali.</p>
                            <span>€ 69,00</span>
                        </div>
                    </article>

                    <article class="home-product-card">
                        <img src="${pageContext.request.contextPath}/images/piante/orchidea_bianca.jpeg" alt="Orchidea">
                        <div class="home-product-info">
                            <h3>Orchidea Bianca</h3>
                            <p>Raffinata, luminosa e perfetta per la casa.</p>
                            <span>€ 49,00</span>
                        </div>
                    </article>

                    <article class="home-product-card">
                        <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio2.jpeg" alt="Evento floreale">
                        <div class="home-product-info">
                            <h3>Allestimento Evento</h3>
                            <p>Dettagli floreali per cerimonie indimenticabili.</p>
                            <span>Su richiesta</span>
                        </div>
                    </article>

                </div>
            </section>

            <!-- PIÙ POPOLARI -->
            <section class="product-section">
                <div class="section-title-row">
                    <h2>I più popolari</h2>
                    <a href="${pageContext.request.contextPath}/catalogo">Vai al catalogo</a>
                </div>

                <div class="product-grid-home">

                    <article class="home-product-card">
                        <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_sposa.jpeg" alt="Bouquet sposa">
                        <div class="home-product-info">
                            <h3>Bouquet Sposa</h3>
                            <p>Elegante composizione per il giorno più importante.</p>
                            <span>Su richiesta</span>
                        </div>
                    </article>

                    <article class="home-product-card">
                        <img src="${pageContext.request.contextPath}/images/coronalaurea/corona_laurea2.jpeg" alt="Corona laurea">
                        <div class="home-product-info">
                            <h3>Corona di Laurea</h3>
                            <p>Il simbolo perfetto per celebrare un traguardo.</p>
                            <span>€ 35,00</span>
                        </div>
                    </article>

                    <article class="home-product-card">
                        <img src="${pageContext.request.contextPath}/images/profumatori/profumatore_muha_giallo.jpeg" alt="Profumatore">
                        <div class="home-product-info">
                            <h3>Profumatore Floreale</h3>
                            <p>Una fragranza elegante per ambienti raffinati.</p>
                            <span>€ 19,90</span>
                        </div>
                    </article>

                    <article class="home-product-card">
                        <img src="${pageContext.request.contextPath}/images/terrarium/terrarium2.jpeg" alt="Terrarium">
                        <div class="home-product-info">
                            <h3>Terrarium Green</h3>
                            <p>Una piccola composizione verde decorativa.</p>
                            <span>€ 29,00</span>
                        </div>
                    </article>

                </div>
            </section>

        </div>

        <!-- RECENSIONI -->
        <aside class="reviews-sidebar">

            <h2>Dicono di noi</h2>

            <article class="review-card">
                <div class="review-header">
                    <strong>Orlando D.</strong>
                    <span>★★★★★</span>
                </div>
                <p>
                   per qualsiasi evento ti puoi fidare della professionalità e dell'arte dei fiori della fiorista Maria,di Coperchia di Pellezzano...sono bravi e straordinari...non è facile trovare tanta arte come da MARIA💐💗
                </p>
            </article>

            <article class="review-card">
                <div class="review-header">
                    <strong>Giovanna D.</strong>
                    <span>★★★★★</span>
                </div>
                <p>
                    Eccellente in tutto. Qualità, gentilezza, professionalità e, soprattutto, arte nel confezionare qualsiasi cosa. Consigliatissimo
                </p>
            </article>

            <article class="review-card">
                <div class="review-header">
                    <strong>Rebecca P.</strong>
                    <span>★★★★★</span>
                </div>
                <p>
                    Enrico ed Anna due persone squisite che hanno capito sin dall’inizio il nostro desiderio di rendere speciale il nostro SI! Abbiamo scelto loro come fornitori per l'aspetto floreale del matrimonio, la composizione per l’auto , le nostre case e la chiesa erano meravigliose! Fiori agli occhielli, braccialetti per le testimone e fiocco auto erano curati nei minimi dettagli e agevoli da applicare. Ci siamo sentiti subito capiti con la loro simpatia, professionalità, puntualitá, precisione ed educazione ci hanno seguiti passo passo consigliandoci su cosa era più giusto fare e cosa no per rendere il nostro giorno ancora piu bello!Grazie mille ad entrambi ❤️
                </p>
            </article>

            <a href="https://www.facebook.com/fioripellezzano/reviews" target="_blank" class="reviews-button">
                Leggi tutte le recensioni
            </a>

        </aside>

    </section>

    <!-- BARRA SERVIZI -->
    <section class="service-strip">

        <div>
            <i class="bi bi-flower1"></i>
            <span>Fiori freschi<br>ogni giorno</span>
        </div>

        <div>
            <i class="bi bi-truck"></i>
            <span>Consegna a domicilio<br>in zona</span>
        </div>

        <div>
            <i class="bi bi-credit-card"></i>
            <span>Pagamenti sicuri<br>e protetti</span>
        </div>

        <div>
            <i class="bi bi-chat-heart"></i>
            <span>Assistenza sempre<br>disponibile</span>
        </div>

    </section>

</main>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

</body>
</html>