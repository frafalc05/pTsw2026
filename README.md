# Fiorista Maria - E-commerce floreale

## Descrizione del progetto

Fiorista Maria è un'applicazione web per la vendita online di prodotti floreali e articoli collegati al mondo dei fiori. Il sito permette agli utenti di consultare il catalogo, aggiungere prodotti al carrello, registrarsi, effettuare il login, completare un ordine e visualizzare gli ordini effettuati.

Il progetto include anche un'area riservata all'amministratore, dalla quale è possibile gestire il catalogo prodotti e monitorare gli ordini ricevuti.

L'applicazione è stata sviluppata seguendo il pattern architetturale MVC e utilizza Servlet, JSP, DAO, JDBC e MySQL per la gestione dinamica dei dati.

## Tecnologie utilizzate

* Java
* Jakarta Servlet
* JSP
* JDBC
* MySQL
* HTML5
* CSS3
* JavaScript
* AJAX
* Bootstrap Icons
* Apache Tomcat
* Eclipse IDE
* Git e GitHub

## Architettura del progetto

Il progetto segue il pattern MVC.

La struttura principale è suddivisa in:

* `control`: contiene le Servlet e i Filter;
* `dao`: contiene le classi per l'accesso ai dati;
* `model`: contiene le classi del modello;
* `WEB-INF/view`: contiene le pagine JSP non accessibili direttamente;
* `styles`: contiene i fogli di stile CSS;
* `scripts`: contiene i file JavaScript;
* `images`: contiene le immagini statiche del sito.

## Struttura delle cartelle

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
* effettuare login e logout;
* completare un ordine tramite checkout;
* visualizzare l'elenco degli ordini effettuati.

## Funzionalità amministratore

L'amministratore può:

* effettuare il login;
* accedere all'area amministrativa protetta;
* visualizzare la dashboard degli ordini;
* filtrare gli ordini per data e cliente;
* modificare lo stato degli ordini;
* visualizzare tutti i prodotti del catalogo;
* inserire nuovi prodotti;
* modificare prodotti esistenti;
* disattivare prodotti dal catalogo pubblico.

La cancellazione dei prodotti è gestita in modo logico tramite il campo `attivo`, così i prodotti non vengono rimossi fisicamente dal database e gli ordini già effettuati restano integri.

## Catalogo prodotti

Il catalogo viene caricato dinamicamente dal database tramite `CatalogoServlet` e `ProdottoDAO`.

I prodotti sono organizzati nelle seguenti categorie:

* Bouquet
* Corone di Laurea
* Eventi e Cerimonie
* Flower Cube
* Piante e Orchidee
* Profumatori
* Terrarium
* Idee Regalo

Ogni prodotto contiene nome, descrizione, prezzo, immagine, quantità disponibile e stato di visibilità.

## Carrello

Il carrello permette di aggiungere prodotti, modificare le quantità, rimuovere singoli articoli e svuotare l'intero contenuto.

Per gli utenti non autenticati il carrello viene mantenuto nella sessione.

Per gli utenti autenticati il carrello viene mantenuto nella sessione e sincronizzato anche con il database, in modo da poter essere recuperato dopo logout e nuovo login.

La gestione del carrello avviene tramite:

* `CarrelloServlet`
* `CarrelloDAO`
* `ProdottoQuantita`
* `carrello.js`

L'aggiunta dei prodotti al carrello avviene tramite AJAX.

## Ordini

Durante il checkout, i prodotti presenti nel carrello vengono trasformati in un ordine.

L'ordine viene salvato nel database e il contenuto del carrello viene svuotato.

Le righe d'ordine mantengono il nome del prodotto, la quantità e il prezzo di acquisto. In questo modo, se il prezzo di un prodotto viene modificato successivamente dall'amministratore, gli ordini già effettuati mantengono comunque il prezzo valido al momento dell'acquisto.

## Sicurezza e controllo degli accessi

L'accesso all'area amministrativa è protetto tramite `AdminFilter`.

Il filtro intercetta le richieste verso gli URL `/admin/*` e controlla che nella sessione sia presente un utente autenticato con ruolo `ADMIN`.

Se l'utente non è autenticato o non possiede il ruolo corretto, viene reindirizzato alla pagina di login.

Le JSP sono collocate all'interno di `WEB-INF/view`, quindi non sono accessibili direttamente dal browser. L'accesso alle pagine avviene tramite Servlet.

Al logout la sessione viene invalidata tramite `session.invalidate()`.

## Validazione lato client

Il progetto include validazione lato client tramite JavaScript.

I file JavaScript sono collocati nella cartella `scripts`.

La validazione viene utilizzata per controllare i dati inseriti nei form e per mostrare messaggi di errore nella pagina senza usare finestre di alert.

## Stile grafico e responsive design

Il sito utilizza uno stile elegante e coerente con l'identità di un negozio floreale.

La palette grafica è basata su:

* granata;
* rosa antico;
* bianco caldo;
* oro;
* verde naturale.

Il layout è responsive e si adatta a desktop, tablet e dispositivi mobili.

I fogli di stile sono separati dalle pagine JSP e organizzati nella cartella `styles`.

## Database

Il database MySQL del progetto è gestito separatamente dal codice sorgente.

Per eseguire correttamente il progetto è necessario importare il database fornito separatamente e verificare la configurazione della connessione in `DataSourceProvider.java`.

Il database contiene le tabelle necessarie per utenti, prodotti, categorie, carrello, ordini e righe d'ordine.

Il dump o gli script SQL del database devono essere importati prima dell'avvio dell'applicazione.

## Configurazione ed esecuzione

Per avviare il progetto:

1. Importare il progetto in Eclipse.
2. Configurare Apache Tomcat.
3. Importare il database MySQL fornito separatamente.
4. Verificare i parametri di connessione in `DataSourceProvider.java`.
5. Avviare il server Tomcat.
6. Accedere all'applicazione dal browser tramite il context path configurato.

## Dipendenze

Il progetto utilizza librerie esterne presenti nella cartella `WEB-INF/lib` e nelle librerie referenziate del progetto.

Tra le librerie utilizzate sono presenti:

* Jakarta Servlet API
* JSTL
* Commons Codec

## Repository GitHub

Il progetto è versionato tramite Git e GitHub.

Il repository contiene il codice sorgente dell'applicazione, le pagine JSP, i file CSS, i file JavaScript, le immagini statiche e il README del progetto.

Il database viene gestito separatamente tramite dump o script SQL.

## Autori

Progetto realizzato da:

* Daniela Ruocco
* Francesca Falcone

## Stato del progetto

Il progetto implementa le principali funzionalità richieste per un sito di commercio elettronico:

* catalogo dinamico;
* registrazione e login utente;
* gestione sessione;
* carrello;
* checkout;
* salvataggio ordini;
* visualizzazione ordini utente;
* area amministratore;
* gestione catalogo;
* gestione ordini;
* controllo accessi;
* uso del pattern MVC;
* uso del pattern DAO;
* uso di DataSource;
* uso di AJAX;
* validazione JavaScript;
* organizzazione separata di JSP, CSS, JavaScript e immagini.
