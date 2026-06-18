<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Catalogo - Fiorista Maria</title>
<<<<<<< HEAD
=======
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/carrello.css">
    <link rel="stylesheet" href="styles/style1.css">
>>>>>>> branch 'main' of https://github.com/frafalc05/pTsw2026.git
	<link rel="stylesheet" href="styles/catalogo.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
</head>

<body>

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<main>

    <section class="catalogo-intro">
        <h1>Il nostro catalogo</h1>
        <p>Scegli la categoria e trova la composizione floreale perfetta per ogni occasione.</p>
    </section>

    <section class="categorie-tonde">
        <a href="#bouquet" class="categoria-tonda">
            <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_tulipani.jpeg" alt="Bouquet">
            <span>Bouquet</span>
        </a>

        <a href="#corone" class="categoria-tonda">
            <img src="${pageContext.request.contextPath}/images/coronalaurea/corona_laurea2.jpeg" alt="Corone di laurea">
            <span>Laurea</span>
        </a>

        <a href="#eventi" class="categoria-tonda">
            <img src="${pageContext.request.contextPath}/images/eventi/evento1.jpeg" alt="Eventi">
            <span>Eventi</span>
        </a>

        <a href="#flowercube" class="categoria-tonda">
            <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube.jpeg" alt="Flower Cube">
            <span>Flower Cube</span>
        </a>

        <a href="#piante" class="categoria-tonda">
            <img src="${pageContext.request.contextPath}/images/piante/orchidea_bianca.jpeg" alt="Piante">
            <span>Piante</span>
        </a>

        <a href="#profumatori" class="categoria-tonda">
            <img src="${pageContext.request.contextPath}/images/profumatori/profumatore_muha_blu.jpeg" alt="Profumatori">
            <span>Profumatori</span>
        </a>

        <a href="#terrarium" class="categoria-tonda">
            <img src="${pageContext.request.contextPath}/images/terrarium/terrarium1.jpeg" alt="Terrarium">
            <span>Terrarium</span>
        </a>
    </section>

    <section class="blocco-catalogo" id="bouquet">
        <h2>Bouquet d'Autore</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_sposa.jpeg" alt="Bouquet sposa">
                <div class="prodotto-info">
                    <h3>Bouquet Sposa Elegance</h3>
                    <p>Bouquet raffinato con rose bianche e gypsophila.</p>
                    <p class="prezzo">€89,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-1" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="1">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_tulipani.jpeg" alt="Bouquet tulipani">
                <div class="prodotto-info">
                    <h3>Bouquet Tulipani Bianchi</h3>
                    <p>Composizione elegante e luminosa con tulipani freschi.</p>
                    <p class="prezzo">€39,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-2" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="2">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/bouquet/bouquet2.jpeg" alt="Bouquet misto">
                <div class="prodotto-info">
                    <h3>Bouquet Primavera</h3>
                    <p>Fiori misti colorati per compleanni e occasioni speciali.</p>
                    <p class="prezzo">€44,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-3" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="3">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section class="blocco-catalogo" id="corone">
        <h2>Corone di Laurea</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/coronalaurea/corona_laurea_rose.jpeg" alt="Corona laurea con rose">
                <div class="prodotto-info">
                    <h3>Corona di Laurea Classica</h3>
                    <p>Corona con alloro fresco e rose rosse.</p>
                    <p class="prezzo">€29,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-4" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="4">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/coronalaurea/corona_laurea2.jpeg" alt="Corona laurea personalizzata">
                <div class="prodotto-info">
                    <h3>Corona di Laurea Personalizzata</h3>
                    <p>Corona con dettagli floreali personalizzabili.</p>
                    <p class="prezzo">€34,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-5" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="5">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section class="blocco-catalogo" id="eventi">
        <h2>Eventi e Cerimonie</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio.jpeg" alt="Allestimento matrimonio">
                <div class="prodotto-info">
                    <h3>Allestimento Matrimonio</h3>
                    <p>Decorazioni floreali per location, tavoli e cerimonia.</p>
                    <p class="prezzo">Da €250,00</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-6" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="6">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio2.jpeg" alt="Allestimento matrimonio elegante">
                <div class="prodotto-info">
                    <h3>Allestimento Tavoli</h3>
                    <p>Decorazioni floreali eleganti per ricevimenti e banchetti.</p>
                    <p class="prezzo">Da €180,00</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-7" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="7">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/eventi/evento1.jpeg" alt="Centrotavola evento">
                <div class="prodotto-info">
                    <h3>Centrotavola Floreale</h3>
                    <p>Composizione elegante per events e ricevimenti.</p>
                    <p class="prezzo">Da €45,00</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-8" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="8">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section class="blocco-catalogo" id="flowercube">
        <h2>Flower Cube</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube.jpeg" alt="Flower cube">
                <div class="prodotto-info">
                    <h3>Flower Cube Rosso</h3>
                    <p>Rosa stabilizzata in cubo elegante.</p>
                    <p class="prezzo">€49,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-9" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="9">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube2.jpeg" alt="Rosa in campana">
                <div class="prodotto-info">
                    <h3>Rosa Eterna in Campana</h3>
                    <p>Rosa stabilizzata sotto vetro, perfetta come regalo.</p>
                    <p class="prezzo">€59,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-10" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="10">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube3.jpeg" alt="Cuore rose">
                <div class="prodotto-info">
                    <h3>Cuore di Rose</h3>
                    <p>Composizione romantica con rose stabilizzate.</p>
                    <p class="prezzo">€69,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-11" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="11">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section class="blocco-catalogo" id="piante">
        <h2>Piante e Orchidee</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/piante/orchidea_bianca.jpeg" alt="Orchidea bianca">
                <div class="prodotto-info">
                    <h3>Orchidea Bianca</h3>
                    <p>Pianta elegante da interno, ideale anche come regalo.</p>
                    <p class="prezzo">€34,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-12" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="12">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/piante/piantagialla.jpeg" alt="Pianta ornamentale">
                <div class="prodotto-info">
                    <h3>Pianta Ornamentale</h3>
                    <p>Pianta decorativa per casa, ufficio o attività commerciali.</p>
                    <p class="prezzo">€24,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-13" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="13">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/piante/piante2.jpeg" alt="Pianta decorativa">
                <div class="prodotto-info">
                    <h3>Pianta Verde Decorativa</h3>
                    <p>Soluzione naturale per arredare con eleganza.</p>
                    <p class="prezzo">€27,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-14" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="14">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section class="blocco-catalogo" id="profumatori">
        <h2>Profumatori Floreali</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/profumatori/profumatore_muha_blu.jpeg" alt="Profumatore blu">
                <div class="prodotto-info">
                    <h3>Profumatore Muha Blu</h3>
                    <p>Profumatore decorativo con dettagli floreali.</p>
                    <p class="prezzo">€19,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-15" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="15">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/profumatori/profumatore_muha_giallo.jpeg" alt="Profumatore giallo">
                <div class="prodotto-info">
                    <h3>Profumatore Muha Giallo</h3>
                    <p>Fragranza elegante con confezione decorativa.</p>
                    <p class="prezzo">€19,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-16" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="16">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/profumatori/profumatori_muha1.jpeg" alt="Profumatori floreali">
                <div class="prodotto-info">
                    <h3>Profumatore Floreale</h3>
                    <p>Idea regalo raffinata per casa e ambienti eleganti.</p>
                    <p class="prezzo">€21,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-17" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="17">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section class="blocco-catalogo" id="terrarium">
        <h2>Terrarium</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/terrarium/terrarium1.jpeg" alt="Terrarium">
                <div class="prodotto-info">
                    <h3>Terrarium Elegance</h3>
                    <p>Composizione in vetro con piante e muschio decorativo.</p>
                    <p class="prezzo">€39,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-18" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="18">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/terrarium/terrarium2.jpeg" alt="Terrarium natura">
                <div class="prodotto-info">
                    <h3>Terrarium Natura</h3>
                    <p>Piccolo ecosistema decorativo in contenitore di vetro.</p>
                    <p class="prezzo">€44,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-19" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="19">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/terrarium/terrarium3.jpeg" alt="Marimo">
                <div class="prodotto-info">
                    <h3>Marimo in Vetro</h3>
                    <p>Decorazione acquatica con marimo e pietre naturali.</p>
                    <p class="prezzo">€24,90</p>
                    <div class="carrello-controls">
                        <input type="number" id="qta-20" value="1" min="1" class="qta-input">
                        <button class="btn-add-carrello" data-id="20">Aggiungi</button>
                    </div>
                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

</main>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

<script src="${pageContext.request.contextPath}/scripts/carrello.js"></script>

</body>
</html>