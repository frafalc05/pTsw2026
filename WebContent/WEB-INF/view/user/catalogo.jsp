<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Catalogo - Fiorista Maria</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=10">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css?v=10">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/catalogo.css?v=10">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css?v=10">
</head>

<body class="site-theme">

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<main>

    <section class="catalogo-intro">
        <h1>Catalogo</h1>
        <p>Scopri bouquet, composizioni floreali, piante, profumatori e idee regalo pensate per ogni occasione speciale.</p>
    </section>

    <section class="categorie-tonde">
        <a class="categoria-tonda" href="#bouquet">
            <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_tulipani.jpeg" alt="Bouquet">
            <span>Bouquet</span>
        </a>

        <a class="categoria-tonda" href="#corone">
            <img src="${pageContext.request.contextPath}/images/coronalaurea/corona_laurea_rose.jpeg" alt="Corone di Laurea">
            <span>Corone di Laurea</span>
        </a>

        <a class="categoria-tonda" href="#eventi">
            <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio.jpeg" alt="Eventi e Cerimonie">
            <span>Eventi e Cerimonie</span>
        </a>

        <a class="categoria-tonda" href="#flowercube">
            <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube.jpeg" alt="Flower Cube">
            <span>Flower Cube</span>
        </a>

        <a class="categoria-tonda" href="#piante">
            <img src="${pageContext.request.contextPath}/images/piante/orchidea_bianca.jpeg" alt="Piante e Orchidee">
            <span>Piante e Orchidee</span>
        </a>

        <a class="categoria-tonda" href="#profumatori">
            <img src="${pageContext.request.contextPath}/images/profumatori/profumatore_muha_blu.jpeg" alt="Profumatori">
            <span>Profumatori</span>
        </a>

        <a class="categoria-tonda" href="#terrarium">
            <img src="${pageContext.request.contextPath}/images/terrarium/terrarium1.jpeg" alt="Terrarium">
            <span>Terrarium</span>
        </a>
    </section>

    <section id="bouquet" class="blocco-catalogo">
        <h2>Bouquet</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_sposa.jpeg" alt="Bouquet Sposa Elegance">
                <div class="prodotto-info">
                    <h3>Bouquet Sposa Elegance</h3>
                    <p>Bouquet raffinato con rose bianche e gypsophila.</p>
                    <p class="prezzo">€ 89,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-1" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="1" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_tulipani.jpeg" alt="Bouquet Tulipani Bianchi">
                <div class="prodotto-info">
                    <h3>Bouquet Tulipani Bianchi</h3>
                    <p>Composizione elegante e luminosa con tulipani freschi.</p>
                    <p class="prezzo">€ 39,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-2" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="2" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/bouquet/bouquet2.jpeg" alt="Bouquet Primavera">
                <div class="prodotto-info">
                    <h3>Bouquet Primavera</h3>
                    <p>Fiori misti colorati per compleanni e occasioni speciali.</p>
                    <p class="prezzo">€ 44,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-3" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="3" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section id="corone" class="blocco-catalogo">
        <h2>Corone di Laurea</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/coronalaurea/corona_laurea_rose.jpeg" alt="Corona di Laurea Classica">
                <div class="prodotto-info">
                    <h3>Corona di Laurea Classica</h3>
                    <p>Corona con alloro fresco e rose rosse.</p>
                    <p class="prezzo">€ 29,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-4" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="4" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/coronalaurea/corona_laurea2.jpeg" alt="Corona di Laurea Personalizzata">
                <div class="prodotto-info">
                    <h3>Corona di Laurea Personalizzata</h3>
                    <p>Corona con dettagli floreali personalizzabili.</p>
                    <p class="prezzo">€ 34,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-5" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="5" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section id="eventi" class="blocco-catalogo">
        <h2>Eventi e Cerimonie</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio.jpeg" alt="Allestimento Matrimonio">
                <div class="prodotto-info">
                    <h3>Allestimento Matrimonio</h3>
                    <p>Decorazioni floreali per location, tavoli e cerimonia.</p>
                    <p class="prezzo">Da € 250,00</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-6" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="6" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio2.jpeg" alt="Allestimento Tavoli">
                <div class="prodotto-info">
                    <h3>Allestimento Tavoli</h3>
                    <p>Decorazioni floreali eleganti per ricevimenti e banchetti.</p>
                    <p class="prezzo">Da € 180,00</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-7" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="7" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/eventi/evento1.jpeg" alt="Centrotavola Floreale">
                <div class="prodotto-info">
                    <h3>Centrotavola Floreale</h3>
                    <p>Composizione elegante per eventi e ricevimenti.</p>
                    <p class="prezzo">Da € 45,00</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-8" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="8" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section id="flowercube" class="blocco-catalogo">
        <h2>Flower Cube</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube.jpeg" alt="Flower Cube Rosso">
                <div class="prodotto-info">
                    <h3>Flower Cube Rosso</h3>
                    <p>Rosa stabilizzata in cubo elegante.</p>
                    <p class="prezzo">€ 49,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-9" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="9" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube2.jpeg" alt="Rosa Eterna in Campana">
                <div class="prodotto-info">
                    <h3>Rosa Eterna in Campana</h3>
                    <p>Rosa stabilizzata sotto vetro, perfetta come regalo.</p>
                    <p class="prezzo">€ 59,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-10" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="10" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube3.jpeg" alt="Cuore di Rose">
                <div class="prodotto-info">
                    <h3>Cuore di Rose</h3>
                    <p>Composizione romantica con rose stabilizzate.</p>
                    <p class="prezzo">€ 69,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-11" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="11" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section id="piante" class="blocco-catalogo">
        <h2>Piante e Orchidee</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/piante/orchidea_bianca.jpeg" alt="Orchidea Bianca">
                <div class="prodotto-info">
                    <h3>Orchidea Bianca</h3>
                    <p>Raffinata, luminosa e perfetta per casa o ufficio.</p>
                    <p class="prezzo">€ 34,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-12" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="12" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/piante/piantagialla.jpeg" alt="Pianta Ornamentale">
                <div class="prodotto-info">
                    <h3>Pianta Ornamentale</h3>
                    <p>Pianta decorativa per casa, ufficio o attività commerciali.</p>
                    <p class="prezzo">€ 24,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-13" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="13" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/piante/piante2.jpeg" alt="Pianta Verde Decorativa">
                <div class="prodotto-info">
                    <h3>Pianta Verde Decorativa</h3>
                    <p>Soluzione naturale per arredare con eleganza.</p>
                    <p class="prezzo">€ 27,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-14" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="14" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section id="profumatori" class="blocco-catalogo">
        <h2>Profumatori</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/profumatori/profumatore_muha_blu.jpeg" alt="Profumatore Muha Blu">
                <div class="prodotto-info">
                    <h3>Profumatore Muha Blu</h3>
                    <p>Profumatore decorativo con dettagli floreali.</p>
                    <p class="prezzo">€ 19,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-15" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="15" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/profumatori/profumatore_muha_giallo.jpeg" alt="Profumatore Muha Giallo">
                <div class="prodotto-info">
                    <h3>Profumatore Muha Giallo</h3>
                    <p>Fragranza elegante con confezione decorativa.</p>
                    <p class="prezzo">€ 19,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-16" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="16" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/profumatori/profumatori_muha1.jpeg" alt="Profumatore Floreale">
                <div class="prodotto-info">
                    <h3>Profumatore Floreale</h3>
                    <p>Idea regalo raffinata per casa e ambienti eleganti.</p>
                    <p class="prezzo">€ 21,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-17" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="17" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section id="terrarium" class="blocco-catalogo">
        <h2>Terrarium</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/terrarium/terrarium1.jpeg" alt="Terrarium Elegance">
                <div class="prodotto-info">
                    <h3>Terrarium Elegance</h3>
                    <p>Composizione in vetro con piante e muschio decorativo.</p>
                    <p class="prezzo">€ 39,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-18" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="18" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/terrarium/terrarium2.jpeg" alt="Terrarium Natura">
                <div class="prodotto-info">
                    <h3>Terrarium Natura</h3>
                    <p>Piccolo ecosistema decorativo in contenitore di vetro.</p>
                    <p class="prezzo">€ 44,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-19" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="19" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/terrarium/terrarium3.jpeg" alt="Marimo in Vetro">
                <div class="prodotto-info">
                    <h3>Marimo in Vetro</h3>
                    <p>Decorazione acquatica con marimo e pietre naturali.</p>
                    <p class="prezzo">€ 24,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-20" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="20" type="button">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

</main>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

<script src="${pageContext.request.contextPath}/scripts/carrello.js?v=10"></script>

</body>
</html>