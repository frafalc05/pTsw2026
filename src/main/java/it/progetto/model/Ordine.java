package it.progetto.model;

import java.sql.Timestamp; // Usiamo Timestamp così gestisce sia data che ora senza errori nel DAO

public class Ordine {
    // Campi originali
    private int id;
    private int idUtente;
    private Timestamp dataOrdine; // Modificato in Timestamp per allinearsi al database
    private double totale;
    private String stato;
    
    // Nuovi campi per la spedizione
    private String nomeDestinatario;
    private String indirizzo;
    private String citta;
    private String cap;
    private String messaggio;

    // 1. Costruttore Vuoto (Fondamentale per i JavaBean)
    public Ordine() {
    }

    // 2. GETTER E SETTER DEI CAMPI ORIGINALI (Quelli che mancavano!)
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    public Timestamp getDataOrdine() {
        return dataOrdine;
    }

    public void setDataOrdine(Timestamp dataOrdine) {
        this.dataOrdine = dataOrdine;
    }

    public double getTotale() {
        return totale;
    }

    public void setTotale(double totale) {
        this.totale = totale;
    }

    public String getStato() {
        return stato;
    }

    public void setStato(String stato) {
        this.stato = stato;
    }

    // 3. GETTER E SETTER DEI NUOVI CAMPI DI SPEDIZIONE
    
    public String getNomeDestinatario() {
        return nomeDestinatario;
    }

    public void setNomeDestinatario(String nomeDestinatario) {
        this.nomeDestinatario = nomeDestinatario;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public String getCitta() {
        return citta;
    }

    public void setCitta(String citta) {
        this.citta = citta;
    }

    public String getCap() {
        return cap;
    }

    public void setCap(String cap) {
        this.cap = cap;
    }

    public String getMessaggio() {
        return messaggio;
    }

    public void setMessaggio(String messaggio) {
        this.messaggio = messaggio;
    }
}