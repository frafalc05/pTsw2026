<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Catalogo - Fiorista Maria</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css?v=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/catalogo.css?v=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css?v=1">
</head>

<body class="site-theme">

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<main>

    <section class="catalogo-intro">
        <h1>Catalogo</h1>
        <p>
            Scopri bouquet, composizioni floreali, piante, profumatori e idee regalo pensate per ogni occasione speciale.
        </p>
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
                <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_tulipani.jpeg" alt="Bouquet di tulipani">
                <div class="prodotto-info">
                    <h3>Bouquet Tulipani</h3>
                    <p>Composizione fresca e colorata, perfetta per un regalo elegante.</p>
                    <p class="prezzo">€ 45,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="1">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/bouquet/bouquet2.jpeg" alt="Bouquet romantico">
                <div class="prodotto-info">
                    <h3>Bouquet Romantic Pink</h3>
                    <p>Composizione delicata sui toni rosa e crema.</p>
                    <p class="prezzo">€ 59,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="2">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/bouquet/bouquet_sposa.jpeg" alt="Bouquet sposa">
                <div class="prodotto-info">
                    <h3>Bouquet Sposa</h3>
                    <p>Elegante composizione per il giorno più importante.</p>
                    <p class="prezzo">Su richiesta</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="3">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section id="corone" class="blocco-catalogo">
        <h2>Corone di Laurea</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/coronalaurea/corona_laurea_rose.jpeg" alt="Corona laurea rose">
                <div class="prodotto-info">
                    <h3>Corona Laurea Rose</h3>
                    <p>Corona raffinata per celebrare un traguardo speciale.</p>
                    <p class="prezzo">€ 35,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="4">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/coronalaurea/corona_laurea2.jpeg" alt="Corona laurea classica">
                <div class="prodotto-info">
                    <h3>Corona Laurea Classica</h3>
                    <p>Corona elegante con dettagli curati e colore intenso.</p>
                    <p class="prezzo">€ 32,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="5">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section id="eventi" class="blocco-catalogo">
        <h2>Eventi e Cerimonie</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio.jpeg" alt="Allestimento matrimonio">
                <div class="prodotto-info">
                    <h3>Allestimento Matrimonio</h3>
                    <p>Composizioni floreali per cerimonie eleganti e romantiche.</p>
                    <p class="prezzo">Su richiesta</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="6">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio2.jpeg" alt="Decorazione evento">
                <div class="prodotto-info">
                    <h3>Decorazione Evento</h3>
                    <p>Dettagli floreali per tavoli, sale e occasioni speciali.</p>
                    <p class="prezzo">Su richiesta</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="7">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/eventi/evento1.jpeg" alt="Addobbo floreale">
                <div class="prodotto-info">
                    <h3>Addobbo Floreale</h3>
                    <p>Composizione per eventi, ricorrenze e cerimonie.</p>
                    <p class="prezzo">Su richiesta</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="8">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section id="flowercube" class="blocco-catalogo">
        <h2>Flower Cube</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube.jpeg" alt="Flower Cube">
                <div class="prodotto-info">
                    <h3>Flower Cube Elegance</h3>
                    <p>Box floreale elegante per regali raffinati.</p>
                    <p class="prezzo">€ 69,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="9">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube2.jpeg" alt="Flower Cube rosa">
                <div class="prodotto-info">
                    <h3>Flower Cube Rosa</h3>
                    <p>Composizione romantica in box sui toni rosa.</p>
                    <p class="prezzo">€ 69,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="10">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/flowercube/flower_cube3.jpeg" alt="Flower Cube delicato">
                <div class="prodotto-info">
                    <h3>Flower Cube Delicato</h3>
                    <p>Idea regalo fine, luminosa e curata nei dettagli.</p>
                    <p class="prezzo">€ 65,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="11">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section id="piante" class="blocco-catalogo">
        <h2>Piante e Orchidee</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/piante/orchidea_bianca.jpeg" alt="Orchidea bianca">
                <div class="prodotto-info">
                    <h3>Orchidea Bianca</h3>
                    <p>Raffinata, luminosa e perfetta per casa o ufficio.</p>
                    <p class="prezzo">€ 49,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="12">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/piante/piantagialla.jpeg" alt="Pianta gialla">
                <div class="prodotto-info">
                    <h3>Pianta Decorativa</h3>
                    <p>Una nota di colore naturale per ogni ambiente.</p>
                    <p class="prezzo">€ 29,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="13">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/piante/piante2.jpeg" alt="Pianta ornamentale">
                <div class="prodotto-info">
                    <h3>Pianta Ornamentale</h3>
                    <p>Perfetta per un regalo verde ed elegante.</p>
                    <p class="prezzo">€ 34,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="14">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section id="profumatori" class="blocco-catalogo">
        <h2>Profumatori</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/profumatori/profumatore_muha_blu.jpeg" alt="Profumatore blu">
                <div class="prodotto-info">
                    <h3>Profumatore Blu</h3>
                    <p>Fragranza delicata per ambienti eleganti.</p>
                    <p class="prezzo">€ 19,90</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="15">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/profumatori/profumatore_muha_giallo.jpeg" alt="Profumatore giallo">
                <div class="prodotto-info">
                    <h3>Profumatore Giallo</h3>
                    <p>Idea regalo profumata e raffinata.</p>
                    <p class="prezzo">€ 19,90</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="16">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/profumatori/profumatori_muha1.jpeg" alt="Profumatore floreale">
                <div class="prodotto-info">
                    <h3>Profumatore Floreale</h3>
                    <p>Un dettaglio elegante per profumare la casa.</p>
                    <p class="prezzo">€ 22,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="17">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

    <section id="terrarium" class="blocco-catalogo">
        <h2>Terrarium</h2>

        <div class="griglia-prodotti">
            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/terrarium/terrarium1.jpeg" alt="Terrarium piccolo">
                <div class="prodotto-info">
                    <h3>Terrarium Green</h3>
                    <p>Una piccola composizione verde decorativa.</p>
                    <p class="prezzo">€ 29,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="18">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/terrarium/terrarium2.jpeg" alt="Terrarium elegante">
                <div class="prodotto-info">
                    <h3>Terrarium Elegance</h3>
                    <p>Composizione verde raffinata in vetro.</p>
                    <p class="prezzo">€ 32,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="19">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>

            <article class="prodotto-box">
                <img src="${pageContext.request.contextPath}/images/terrarium/terrarium3.jpeg" alt="Terrarium decorativo">
                <div class="prodotto-info">
                    <h3>Terrarium Decorativo</h3>
                    <p>Una creazione verde originale e moderna.</p>
                    <p class="prezzo">€ 35,00</p>

                    <form class="form-carrello" action="${pageContext.request.contextPath}/carrello" method="post">
                        <input type="hidden" name="azione" value="aggiungi">
                        <input type="hidden" name="idProdotto" value="20">
                        <div class="carrello-controls">
                            <input class="qta-input" type="number" name="quantita" value="1" min="1">
                            <button class="btn-add-carrello" type="submit">Aggiungi</button>
                        </div>
                    </form>

                    <a class="btn" href="#">Dettagli</a>
                </div>
            </article>
        </div>
    </section>

</main>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

</body>
</html>