<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Chi siamo - Fiorista Maria</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=70">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css?v=70">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/chi-siamo.css?v=70">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css?v=70">
</head>

<body class="site-theme">

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<main class="chi-siamo-page">

    <section class="chi-hero">
        <div class="chi-hero-text">
            <span>Fiorista Maria</span>
            <h1>La bellezza dei fiori, raccontata con cura</h1>
            <p>
                Da Fiorista Maria ogni composizione nasce da passione, esperienza e attenzione ai dettagli.
                Realizziamo bouquet, piante, decorazioni e allestimenti floreali capaci di trasformare
                ogni occasione in un ricordo speciale.
            </p>

            <div class="chi-hero-buttons">
                <a href="${pageContext.request.contextPath}/catalogo" class="chi-btn-primary">Scopri il catalogo</a>
                <a href="https://wa.me/393485238469" target="_blank" rel="noopener noreferrer" class="chi-btn-secondary">
                    Contattaci su WhatsApp
                </a>
            </div>
        </div>

        <div class="chi-hero-image">
            <img src="${pageContext.request.contextPath}/images/chi-siamo/chisiamo8.png" alt="Fiorista Maria al lavoro">
        </div>
    </section>

    <section class="chi-intro">
        <div class="chi-intro-image">
            <img src="${pageContext.request.contextPath}/images/chi-siamo/chisiamo7.jpeg" alt="Bouquet Fiorista Maria">
        </div>

        <div class="chi-intro-text">
            <span>La nostra storia</span>
            <h2>Un negozio fatto di fiori, persone ed emozioni</h2>

            <p>
                Fiorista Maria è un punto di riferimento per chi cerca composizioni floreali eleganti,
                curate e pensate su misura. Ogni fiore viene scelto con attenzione, ogni colore viene
                abbinato con gusto e ogni dettaglio viene studiato per comunicare qualcosa.
            </p>

            <p>
                Il nostro lavoro non è soltanto vendere fiori: è ascoltare una richiesta, capire
                un’emozione e trasformarla in una composizione capace di parlare al cuore di chi la riceve.
            </p>
        </div>
    </section>

    <section class="chi-values">
        <article class="chi-value-card">
            <i class="bi bi-flower1"></i>
            <h3>Creatività</h3>
            <p>
                Ogni creazione viene pensata con uno stile delicato, armonioso e riconoscibile.
            </p>
        </article>

        <article class="chi-value-card">
            <i class="bi bi-heart-fill"></i>
            <h3>Cura</h3>
            <p>
                Prepariamo ogni composizione con attenzione, precisione e amore per i dettagli.
            </p>
        </article>

        <article class="chi-value-card">
            <i class="bi bi-stars"></i>
            <h3>Eleganza</h3>
            <p>
                Dai bouquet agli allestimenti, cerchiamo sempre equilibrio, raffinatezza e bellezza.
            </p>
        </article>

        <article class="chi-value-card">
            <i class="bi bi-chat-heart-fill"></i>
            <h3>Ascolto</h3>
            <p>
                Ogni cliente viene seguito con disponibilità, gentilezza e consigli personalizzati.
            </p>
        </article>
    </section>

    <section class="chi-story">
        <div class="chi-story-text">
            <span>Il nostro modo di lavorare</span>
            <h2>Dalla scelta del fiore alla consegna finale</h2>

            <p>
                Ogni ordine viene seguito con cura: dalla selezione dei fiori più adatti, alla composizione,
                fino alla preparazione finale. Che si tratti di un piccolo pensiero, di una corona di laurea,
                di un bouquet importante o di un allestimento per un evento, il nostro obiettivo è sempre
                lo stesso: creare qualcosa che lasci il segno.
            </p>

            <p>
                Ci piace unire tradizione e gusto moderno, mantenendo uno stile romantico, naturale ed elegante.
                Le nostre composizioni sono pensate per parlare di amore, gratitudine, festa, ricordo e bellezza.
            </p>
        </div>

        <div class="chi-story-grid">
            <img src="${pageContext.request.contextPath}/images/chi-siamo/chisiamo6.jpeg" alt="Esterno Fiorista Maria">
            <img src="${pageContext.request.contextPath}/images/chi-siamo/chisiamo5.jpeg" alt="Vasi floreali">
            <img src="${pageContext.request.contextPath}/images/chi-siamo/chisiamo4.jpeg" alt="Interno negozio Fiorista Maria">
            <img src="${pageContext.request.contextPath}/images/chi-siamo/chisiamo3.jpeg" alt="Terrarium Fiorista Maria">
        </div>
    </section>

    <section class="chi-gallery">
        <div class="chi-gallery-title">
            <span>Dentro il nostro mondo</span>
            <h2>Fiori, piante e dettagli che raccontano chi siamo</h2>
            <p>
                Ogni angolo del negozio parla della nostra passione: composizioni, piante, idee regalo
                e piccoli dettagli scelti per rendere speciale ogni momento.
            </p>
        </div>

        <div class="chi-gallery-grid">
            <img src="${pageContext.request.contextPath}/images/chi-siamo/chisiamo1.jpeg" alt="Idee regalo Fiorista Maria">
            <img src="${pageContext.request.contextPath}/images/chi-siamo/chisiamo2.jpeg" alt="Piante Fiorista Maria">
            <img src="${pageContext.request.contextPath}/images/chi-siamo/chisiamo4.jpeg" alt="Negozio Fiorista Maria">
        </div>
    </section>

    <section class="chi-cta">
        <span>Hai bisogno di un consiglio?</span>
        <h2>Ti aiutiamo a scegliere la composizione perfetta</h2>
        <p>
            Raccontaci l’occasione, i colori che preferisci o l’emozione che vuoi comunicare:
            penseremo noi a trasformarla in fiori.
        </p>

        <div class="chi-cta-buttons">
            <a href="${pageContext.request.contextPath}/catalogo">Vai al catalogo</a>
            <a href="https://www.instagram.com/fiorista_maria_coperchia?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==" target="_blank" rel="noopener noreferrer">
                <i class="bi bi-instagram"></i>
                Seguici su Instagram
            </a>
        </div>
    </section>

</main>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

</body>
</html>