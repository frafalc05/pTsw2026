# Fiorista Maria - E-commerce floreale

## Descrizione del progetto

Fiorista Maria è un'applicazione web e-commerce dedicata alla vendita online di prodotti floreali, bouquet, piante, profumatori, composizioni per eventi e idee regalo.

Il sito permette agli utenti di consultare il catalogo, aggiungere prodotti al carrello, registrarsi, effettuare il login, completare un ordine e visualizzare gli ordini effettuati.

Il progetto include anche un'area amministrativa riservata, dalla quale l'amministratore può gestire i prodotti del catalogo, modificare le informazioni dei prodotti, caricare immagini, eliminare logicamente prodotti e visualizzare gli ordini ricevuti.

L'applicazione è stata sviluppata seguendo il pattern MVC e utilizzando Servlet, JSP, DAO, JDBC e MySQL.

## Tecnologie utilizzate

* Java
* Jakarta Servlet
* JSP
* JSTL
* JDBC
* MySQL
* HTML5
* CSS3
* JavaScript
* AJAX
* Bootstrap Icons
* Apache Tomcat
* Eclipse IDE
* Git
* GitHub

## Architettura del progetto

Il progetto segue il pattern architetturale MVC.

La struttura è organizzata in:

* `control`: contiene Servlet e Filter;
* `dao`: contiene le classi per l'accesso al database;
* `model`: contiene le classi del modello;
* `WEB-INF/view`: contiene le pagine JSP;
* `styles`: contiene i file CSS;
* `scripts`: contiene i file JavaScript;
* `images`: contiene le immagini del sito.

Le pagine JSP sono collocate nella cartella `WEB-INF/view`, così non sono accessibili direttamente dal browser. L'accesso alle pagine avviene tramite Servlet.

## Struttura principale

```text
src/main/java
├── it.progetto.control
│   ├── AdminCatalogoServlet.java
│   ├── AdminDashboardServlet.java
│   ├── AdminFilter.java
│   ├── CarrelloServlet.java
│   ├── CatalogoServlet.java
│   ├── CheckoutServlet.java
│   ├── ChiSiamoServlet.java
│   ├── EventiServlet.java
│   ├── HomeServlet.java
│   ├── InformazioniServlet.java
│   ├── LoginServlet.java
│   ├── LogoutServlet.java
│   ├── OrdiniServlet.java
│   └── RegistrazioneServlet.java
│
├── it.progetto.dao
│   ├── CarrelloDAO.java
│   ├── ConnectionTest.java
│   ├── DataSourceProvider.java
│   ├── OrdineDAO.java
│   ├── ProdottoDAO.java
│   └── UtenteDAO.java
│
└── it.progetto.model
    ├── Ordine.java
    ├── Prodotto.java
    ├── ProdottoQuantita.java
    └── Utente.java
```

```text
WebContent
├── images
│   ├── bouquet
│   ├── chi-siamo
│   ├── coronalaurea
│   ├── eventi
│   ├── flowercube
│   ├── home
│   ├── piante
│   ├── profumatori
│   └── terrarium
│
├── scripts
│   ├── carrello.js
│   └── validation.js
│
├── styles
│   ├── admin.css
│   ├── base.css
│   ├── carrello.css
│   ├── catalogo.css
│   ├── chi-siamo.css
│   ├── eventi.css
│   ├── footer.css
│   ├── header.css
│   ├── home.css
│   ├── informazioni.css
│   ├── login.css
│   └── ordine.css
│
└── WEB-INF
    ├── lib
    └── view
        ├── admin
        │   ├── catalogo_form.jsp
        │   ├── catalogo_lista.jsp
        │   └── dashboard.jsp
        │
        ├── common
        │   ├── footer.jsp
        │   └── header.jsp
        │
        └── user
            ├── carrello.jsp
            ├── catalogo.jsp
            ├── checkout.jsp
            ├── chi-siamo.jsp
            ├── eventi.jsp
            ├── home.jsp
            ├── informazioni.jsp
            ├── login.jsp
            ├── ordini.jsp
            └── registrazione.jsp
```

## Funzionalità utente

L'utente può:

* visualizzare la home page;
* consultare il catalogo prodotti;
* visualizzare i prodotti divisi per categoria;
* aggiungere prodotti al carrello;
* modificare la quantità dei prodotti nel carrello;
* rimuovere prodotti dal carrello;
* svuotare il carrello;
* registrarsi;
* effettuare il login;
* effettuare il logout;
* completare un ordine;
* visualizzare gli ordini effettuati.

## Funzionalità amministratore

L'amministratore può:

* accedere all'area amministrativa tramite login;
* visualizzare la dashboard degli ordini;
* filtrare gli ordini per data e cliente;
* visualizzare il catalogo prodotti lato admin;
* inserire nuovi prodotti;
* modificare prodotti esistenti;
* caricare immagini per i prodotti;
* rendere un prodotto non visibile nel catalogo utenti;
* eliminare logicamente un prodotto dal catalogo pubblico.

L'accesso all'area amministrativa è protetto tramite filtro.

## Catalogo prodotti

Il catalogo viene caricato dinamicamente dal database tramite `CatalogoServlet` e `ProdottoDAO`.

I prodotti vengono mostrati lato utente solo se risultano attivi.

Le categorie principali del catalogo sono:

* Bouquet
* Corone di Laurea
* Eventi e Cerimonie
* Flower Cube
* Piante e Orchidee
* Profumatori
* Terrarium
* Idee Regalo

Il catalogo lato utente filtra i prodotti in base al campo `categoria`, così i prodotti inseriti dall'amministratore vengono mostrati automaticamente nella sezione corretta.

## Gestione immagini

Quando l'amministratore inserisce o modifica un prodotto, può caricare un'immagine tramite form.

Il database non salva fisicamente l'immagine, ma salva il percorso relativo dell'immagine.

Esempio:

```text
bouquet/nomefile.jpeg
```

L'immagine viene salvata nella cartella `images` dell'applicazione, nella sottocartella corrispondente alla categoria del prodotto.

## Carrello

Il carrello permette di:

* aggiungere prodotti;
* modificare la quantità;
* rimuovere prodotti;
* svuotare il carrello;
* procedere al checkout.

Per gli utenti non autenticati, il carrello viene mantenuto nella sessione.

Per gli utenti autenticati, il carrello viene mantenuto sia nella sessione sia nel database, tramite la tabella `carrello`.

In questo modo, se l'utente effettua logout e poi login, il carrello può essere recuperato dal database.

La gestione del carrello avviene tramite:

* `CarrelloServlet`
* `CarrelloDAO`
* `ProdottoQuantita`
* `carrello.js`

L'aggiunta dei prodotti al carrello avviene tramite AJAX.

## Messaggi dinamici nel DOM

Il progetto evita l'utilizzo di `alert()` JavaScript.

I messaggi di conferma o errore vengono mostrati direttamente nella pagina, modificando dinamicamente il DOM.

Ad esempio, quando un prodotto viene aggiunto al carrello, il bottone cambia temporaneamente testo e viene mostrato un messaggio sotto la card del prodotto.

## Checkout e ordini

Durante il checkout, i prodotti presenti nel carrello vengono trasformati in un ordine.

Il sistema calcola il totale dell'ordine, salva i dati di spedizione e registra le righe d'ordine nel database.

Dopo la conferma dell'ordine:

* l'ordine viene salvato;
* le righe d'ordine vengono salvate;
* il carrello viene svuotato dalla sessione;
* il carrello persistente dell'utente viene svuotato dal database.

Le righe d'ordine salvano il prezzo del prodotto al momento dell'acquisto, così eventuali modifiche future al prezzo del prodotto non alterano gli ordini già effettuati.

## Area ordini

L'utente autenticato può visualizzare i propri ordini.

L'amministratore può visualizzare gli ordini ricevuti e filtrarli dalla dashboard.

## Sicurezza

L'accesso all'area amministrativa è protetto da `AdminFilter`.

Il filtro controlla che nella sessione sia presente un utente autenticato con ruolo `ADMIN`.

Se l'utente non è autenticato o non possiede il ruolo corretto, viene reindirizzato alla pagina di login.

Al logout la sessione viene invalidata.

## Cancellazione logica dei prodotti

I prodotti non vengono eliminati fisicamente dal database quando l'amministratore li rimuove dal catalogo.

La rimozione avviene tramite il campo `attivo`.

Quando un prodotto viene eliminato lato admin, viene impostato come non attivo e non viene più mostrato nel catalogo utenti.

Questa scelta permette di mantenere coerenti gli ordini storici e di non perdere informazioni relative a prodotti già acquistati.

## Validazione lato client

Il progetto include controlli lato client tramite JavaScript.

La validazione viene effettuata sui form principali e i messaggi di errore vengono mostrati nella pagina senza utilizzare finestre di alert.

## Stile grafico

Il sito utilizza uno stile elegante e coerente con l'identità di un negozio floreale.

La palette grafica è basata su:

* granata;
* rosa antico;
* bianco caldo;
* oro;
* verde naturale.

Il layout è responsive e si adatta a desktop, tablet e dispositivi mobili.

I fogli di stile sono separati dalle pagine JSP e si trovano nella cartella `styles`.

## Database

Il database MySQL è gestito separatamente dal codice sorgente.

Per eseguire correttamente il progetto è necessario importare il database fornito separatamente e configurare correttamente la connessione in `DataSourceProvider.java`.

Il database contiene le tabelle principali relative a:

* utenti;
* prodotti;
* categorie;
* carrello;
* ordini;
* righe d'ordine.

Il database salva i riferimenti alle immagini dei prodotti, ma non salva fisicamente i file immagine.

## Configurazione ed esecuzione

Per avviare il progetto:

1. Importare il progetto in Eclipse.
2. Configurare Apache Tomcat.
3. Importare il database MySQL fornito separatamente.
4. Verificare i dati di connessione in `DataSourceProvider.java`.
5. Avviare Tomcat.
6. Aprire l'applicazione dal browser tramite il context path configurato.

## Dipendenze

Il progetto utilizza librerie esterne presenti nella cartella `WEB-INF/lib` e nelle librerie del progetto.

Tra le librerie utilizzate:

* Jakarta Servlet API
* JSTL
* Commons Codec
* MySQL Connector

## Repository GitHub

Il progetto è versionato tramite Git e GitHub.

Il repository contiene:

* codice sorgente Java;
* pagine JSP;
* fogli di stile CSS;
* file JavaScript;
* immagini statiche;
* documentazione del progetto.

Il database viene gestito separatamente tramite dump o script SQL.

## Autori

Progetto realizzato da:

* Daniela Ruocco
* Francesca Falcone

## Stato del progetto

Il progetto implementa le principali funzionalità richieste per un e-commerce:

* catalogo dinamico;
* categorie prodotto;
* registrazione;
* login;
* logout;
* gestione sessione;
* carrello;
* carrello persistente per utenti autenticati;
* checkout;
* salvataggio ordini;
* visualizzazione ordini;
* area amministratore;
* gestione catalogo admin;
* upload immagini prodotto;
* dashboard ordini;
* controllo accessi tramite filtro;
* pattern MVC;
* pattern DAO;
* DataSource;
* AJAX;
* messaggi dinamici nel DOM;
* validazione JavaScript;
* organizzazione separata di JSP, CSS, JavaScript e immagini.

