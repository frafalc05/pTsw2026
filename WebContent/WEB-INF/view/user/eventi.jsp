<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Eventi e Cerimonie - Fiorista Maria</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=80">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css?v=80">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/eventi.css?v=80">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css?v=80">
</head>

<body >

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<div class="eventi-page">

    <section class="eventi-hero">
        <div class="eventi-hero-overlay"></div>

        <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio.jpeg"
             alt="Allestimenti floreali per eventi"
             class="eventi-hero-img">

        <div class="eventi-hero-content">
            <span>Fiorista Maria</span>
            <h1>Eventi e cerimonie floreali</h1>
            <p>
                Allestimenti eleganti, bouquet scenografici e dettagli floreali pensati per trasformare
                matrimoni, comunioni, battesimi, feste private e occasioni speciali in momenti da ricordare.
            </p>

            <div class="eventi-hero-buttons">
                <a href="https://wa.me/393485238469" target="_blank" >
                    Richiedi un preventivo
                </a>

                <a href="https://www.instagram.com/stories/highlights/17871661169641258/" target="_blank" rel="noopener noreferrer">
                    <i class="bi bi-instagram"></i>
                    Guarda su Instagram
                </a>
            </div>
        </div>
    </section>

    <section class="eventi-intro">
        <div class="eventi-intro-text">
            <span>Il tuo evento, il nostro stile</span>
            <h2>Ogni dettaglio floreale racconta un’emozione</h2>

            <p>
                Un evento importante merita un allestimento curato in ogni particolare. Da Fiorista Maria
                progettiamo decorazioni floreali capaci di valorizzare luoghi, colori, atmosfere e desideri
                personali, creando composizioni armoniose e raffinate.
            </p>

            <p>
                Ogni progetto nasce dall’ascolto: partiamo dall’occasione, dallo stile desiderato, dalla
                palette colori e dagli spazi da decorare, per realizzare una proposta coerente, elegante
                e davvero personalizzata.
            </p>
        </div>

        <div class="eventi-intro-image">
            <img src="${pageContext.request.contextPath}/images/eventi/eventi5.jpg" alt="Allestimento matrimonio Fiorista Maria">
        </div>
    </section>

    <section class="eventi-servizi">
        <article class="evento-servizio-card">
            <i class="bi bi-flower1"></i>
            <h3>Matrimoni</h3>
            <p>
                Addobbi per chiesa, bouquet sposa, centrotavola, archi floreali, ingressi e dettagli coordinati.
            </p>
        </article>

        <article class="evento-servizio-card">
            <i class="bi bi-stars"></i>
            <h3>Cerimonie</h3>
            <p>
                Decorazioni floreali per comunioni, battesimi, cresime, anniversari e momenti familiari importanti.
            </p>
        </article>

        <article class="evento-servizio-card">
            <i class="bi bi-balloon-heart"></i>
            <h3>Feste private</h3>
            <p>
                Composizioni eleganti per compleanni, lauree, promesse, inaugurazioni e ricorrenze speciali.
            </p>
        </article>

        <article class="evento-servizio-card">
            <i class="bi bi-brush-fill"></i>
            <h3>Allestimenti su misura</h3>
            <p>
                Progetti personalizzati in base allo stile dell’evento, alla location e ai colori scelti.
            </p>
        </article>
    </section>

    <section class="eventi-progetto">
        <div class="eventi-progetto-image">
            <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio2.jpeg" alt="Decorazioni floreali per evento">
        </div>

        <div class="eventi-progetto-text">
            <span>Come lavoriamo</span>
            <h2>Dall’idea iniziale alla composizione finale</h2>

            <p>
                Ogni allestimento viene seguito con cura: scegliamo i fiori, studiamo gli abbinamenti,
                prepariamo le composizioni e organizziamo i dettagli in modo che tutto risulti armonioso
                e coerente con l’atmosfera dell’evento.
            </p>

            <p>
                Il nostro obiettivo è creare decorazioni che non siano solo belle da vedere, ma capaci
                di dare identità al momento. Ogni fiore, ogni colore e ogni volume viene pensato per
                accompagnare l’emozione della giornata.
            </p>

            <a href="https://wa.me/393485238469" target="_blank">
                Parla con noi del tuo evento
            </a>
        </div>
    </section>

    <section class="eventi-gallery-section">
        <div class="eventi-gallery-title">
            <span>Le nostre creazioni</span>
            <h2>Allestimenti floreali per momenti indimenticabili</h2>
            <p>
                Una selezione di composizioni e scenografie floreali realizzate per cerimonie,
                matrimoni ed eventi speciali.
            </p>
        </div>

        <div class="eventi-gallery">
            <img src="${pageContext.request.contextPath}/images/eventi/eventi4.jpg" alt="Bouquet floreale evento">
            <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio3.jpeg" alt="Ingresso chiesa decorato">
            <img src="${pageContext.request.contextPath}/images/eventi/evento1.jpeg" alt="Addobbo floreale cerimonia">
            <img src="${pageContext.request.contextPath}/images/eventi/evento2.jpeg" alt="Decorazione altare">
            <img src="${pageContext.request.contextPath}/images/eventi/evento3.jpeg" alt="Allestimento floreale esterno">
            <img src="${pageContext.request.contextPath}/images/eventi/eventi6.jpg" alt="Location evento floreale">
        </div>
    </section>

    <section class="eventi-highlight">
        <div class="eventi-highlight-text">
            <span>Eleganza naturale</span>
            <h2>Fiori freschi, composizioni raffinate e dettagli coordinati</h2>

            <p>
                Amiamo creare allestimenti che restano impressi: romantici, luminosi, delicati o scenografici,
                sempre costruiti intorno alla personalità dell’evento.
            </p>
        </div>

        <div class="eventi-highlight-grid">
            <img src="${pageContext.request.contextPath}/images/eventi/evento_matrimonio.jpeg" alt="Allestimento chiesa">
            <img src="${pageContext.request.contextPath}/images/eventi/eventi5.jpg" alt="Composizione cerimonia">
        </div>
    </section>

    <section class="eventi-cta">
        <span>Organizziamo insieme il tuo evento</span>
        <h2>Raccontaci la tua idea, noi la trasformiamo in fiori</h2>

        <p>
            Che tu stia organizzando un matrimonio, una cerimonia o una festa speciale,
            possiamo aiutarti a scegliere lo stile floreale più adatto.
        </p>

        <div class="eventi-cta-buttons">
            <a href="https://wa.me/393485238469" target="_blank" >
                <i class="bi bi-whatsapp"></i>
                Scrivici su WhatsApp
            </a>

            <a href="${pageContext.request.contextPath}/catalogo#eventiecerimonie">
                Vai agli eventi nel catalogo
            </a>
        </div>
    </section>

</div>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

</body>
</html>