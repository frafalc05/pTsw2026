<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Informazioni - Fiorista Maria</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css?v=60">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css?v=60">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/informazioni.css?v=60">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css?v=60">
</head>

<body class="site-theme">

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<main class="informazioni-page">

    <section class="informazioni-hero">
        <span>Fiorista Maria</span>
        <h1>Informazioni utili</h1>
        <p>
            In questa sezione trovi tutte le informazioni principali su consegne,
            pagamenti, condizioni di vendita e trattamento dei dati.
        </p>
    </section>

    <section class="informazioni-nav">
        <a href="#consegne">
            <i class="bi bi-truck"></i>
            <span>Consegne</span>
        </a>

        <a href="#pagamenti">
            <i class="bi bi-credit-card-fill"></i>
            <span>Pagamenti</span>
        </a>

        <a href="#condizioni">
            <i class="bi bi-file-earmark-text-fill"></i>
            <span>Condizioni</span>
        </a>

        <a href="#privacy">
            <i class="bi bi-shield-lock-fill"></i>
            <span>Privacy</span>
        </a>

        <a href="#cookie">
            <i class="bi bi-cookie"></i>
            <span>Cookie</span>
        </a>
    </section>

    <section class="informazioni-container">

        <article id="consegne" class="informazioni-card">
            <div class="informazioni-icon">
                <i class="bi bi-truck"></i>
            </div>

            <div class="informazioni-text">
                <h2>Consegne</h2>

                <p>
                    Fiorista Maria offre un servizio di consegna pensato per far arrivare
                    ogni composizione floreale con la massima cura, preservando freschezza,
                    forma e qualità dei fiori scelti.
                </p>

                <p>
                    Le consegne vengono effettuate principalmente nelle zone limitrofe al negozio,
                    tra Pellezzano, Coperchia, Salerno e aree vicine. Per ordini destinati ad altre
                    località è possibile contattarci prima dell’acquisto, così da verificare
                    disponibilità, tempi e costi.
                </p>

                <p>
                    Per garantire un servizio puntuale, consigliamo di effettuare gli ordini con
                    un piccolo anticipo, soprattutto in occasione di ricorrenze, lauree, matrimoni,
                    festività o giornate particolarmente richieste.
                </p>
            </div>
        </article>

        <article id="pagamenti" class="informazioni-card">
            <div class="informazioni-icon">
                <i class="bi bi-credit-card-fill"></i>
            </div>

            <div class="informazioni-text">
                <h2>Modalità di pagamento</h2>

                <p>
                    Per rendere l’acquisto semplice e sicuro, Fiorista Maria permette di concordare
                    la modalità di pagamento più adatta in base al tipo di ordine e al servizio richiesto.
                </p>

                <p>
                    Per gli ordini standard è possibile completare l’acquisto seguendo le indicazioni
                    presenti sul sito. Per composizioni personalizzate, allestimenti per eventi,
                    bouquet su misura o richieste particolari, il pagamento può essere concordato
                    direttamente con il negozio.
                </p>

                <p>
                    In caso di preventivi per cerimonie o servizi floreali più complessi, potrebbe
                    essere richiesto un acconto per confermare la disponibilità della data e
                    l’organizzazione del lavoro.
                </p>
            </div>
        </article>

        <article id="condizioni" class="informazioni-card">
            <div class="informazioni-icon">
                <i class="bi bi-file-earmark-text-fill"></i>
            </div>

            <div class="informazioni-text">
                <h2>Condizioni di vendita</h2>

                <p>
                    Ogni prodotto floreale realizzato da Fiorista Maria è preparato con attenzione
                    artigianale. Le immagini presenti sul sito rappresentano lo stile, i colori e
                    la tipologia della composizione, ma ogni creazione può presentare piccole variazioni
                    in base alla disponibilità dei fiori freschi.
                </p>

                <p>
                    In caso di indisponibilità di un determinato fiore, il negozio potrà sostituirlo
                    con un’alternativa simile per valore, colore e resa estetica, mantenendo sempre
                    l’armonia della composizione scelta.
                </p>

                <p>
                    Gli ordini personalizzati, gli allestimenti per eventi e le composizioni realizzate
                    su richiesta vengono preparati secondo le indicazioni concordate con il cliente.
                    Eventuali modifiche devono essere comunicate con anticipo, così da poter organizzare
                    correttamente materiali e tempi di lavorazione.
                </p>
            </div>
        </article>

        <article id="privacy" class="informazioni-card">
            <div class="informazioni-icon">
                <i class="bi bi-shield-lock-fill"></i>
            </div>

            <div class="informazioni-text">
                <h2>Privacy policy</h2>

                <p>
                    Fiorista Maria tratta i dati personali forniti dagli utenti esclusivamente per
                    gestire richieste, ordini, consegne, comunicazioni e servizi collegati
                    all’attività del negozio.
                </p>

                <p>
                    I dati richiesti possono includere nome, cognome, email, numero di telefono,
                    indirizzo di consegna e informazioni necessarie alla corretta elaborazione
                    dell’ordine. Tali dati non vengono utilizzati per finalità diverse da quelle
                    legate al servizio richiesto.
                </p>

                <p>
                    Il cliente può contattare il negozio per richiedere informazioni sul trattamento
                    dei propri dati o per eventuali aggiornamenti, rettifiche o cancellazioni,
                    nei limiti previsti dalla normativa applicabile.
                </p>
            </div>
        </article>

        <article id="cookie" class="informazioni-card">
            <div class="informazioni-icon">
                <i class="bi bi-cookie"></i>
            </div>

            <div class="informazioni-text">
                <h2>Cookie policy</h2>

                <p>
                    Il sito di Fiorista Maria può utilizzare cookie tecnici necessari al corretto
                    funzionamento delle pagine, alla navigazione e alla gestione delle funzionalità
                    principali del sito.
                </p>

                <p>
                    I cookie tecnici permettono, ad esempio, di migliorare l’esperienza di navigazione,
                    ricordare alcune preferenze dell’utente e rendere più stabile l’utilizzo dei servizi.
                </p>

                <p>
                    Qualora in futuro vengano integrati strumenti di analisi, marketing o servizi esterni,
                    l’utente verrà informato in modo adeguato e potrà gestire le proprie preferenze
                    secondo le modalità previste.
                </p>
            </div>
        </article>

    </section>

</main>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

</body>
</html>