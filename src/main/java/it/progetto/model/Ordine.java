package it.progetto.model;

import java.sql.Timestamp;

public class Ordine {
    private int id;
    private int idUtente;
    private double totale;
    private String stato;
    private Timestamp dataOrdine; // Mappato su data_ordine del DB

    public Ordine() {}

    // Getter e Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getIdUtente() { return idUtente; }
    public void setIdUtente(int idUtente) { this.idUtente = idUtente; }

    public double getTotale() { return totale; }
    public void setTotale(double totale) { this.totale = totale; }

    public String getStato() { return stato; }
    public void setStato(String stato) { this.stato = stato; }

    public Timestamp getDataOrdine() { return dataOrdine; }
    public void setDataOrdine(Timestamp dataOrdine) { this.dataOrdine = dataOrdine; }
}