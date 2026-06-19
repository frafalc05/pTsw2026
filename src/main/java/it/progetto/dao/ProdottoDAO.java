package it.progetto.dao;

import java.sql.*;
import java.util.ArrayList;
import it.progetto.model.Prodotto;

public class ProdottoDAO {

    // Il tuo metodo attuale per prendere tutti i prodotti attivi (lato cliente)
    public ArrayList<Prodotto> trovaTutti() throws SQLException {
        ArrayList<Prodotto> lista = new ArrayList<>();
        Connection con = DataSourceProvider.getDataSource().getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM prodotto WHERE attivo=true");
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            Prodotto p = new Prodotto();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescrizione(rs.getString("descrizione"));
            p.setPrezzo(rs.getDouble("prezzo"));
            p.setImmagine(rs.getString("immagine"));
            p.setQuantita(rs.getInt("quantita"));
            lista.add(p);
        }

        con.close();
        return lista;
    }

    // Metodo per estrarre un singolo prodotto tramite ID (per visualizzazione dettagli o modifica)
    public Prodotto getProdottoById(int id) throws SQLException {
        Prodotto p = null;
        Connection con = DataSourceProvider.getDataSource().getConnection();
        
        PreparedStatement ps = con.prepareStatement("SELECT * FROM prodotto WHERE id = ?");
        ps.setInt(1, id);
        
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            p = new Prodotto();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescrizione(rs.getString("descrizione"));
            p.setPrezzo(rs.getDouble("prezzo"));
            p.setImmagine(rs.getString("immagine"));
            p.setQuantita(rs.getInt("quantita"));
        }

        con.close();
        return p;
    }

    /* ==========================================================================
       NUOVI METODI PER IL CRUD AMMINISTRATORE (MARIA)
       ========================================================================== */

    // 1. TROVA TUTTI PER ADMIN (Mostra anche i prodotti non attivi nel pannello di controllo)
    public ArrayList<Prodotto> trovaTuttiAdmin() throws SQLException {
        ArrayList<Prodotto> lista = new ArrayList<>();
        Connection con = DataSourceProvider.getDataSource().getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM prodotto ORDER BY id DESC");
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            Prodotto p = new Prodotto();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescrizione(rs.getString("descrizione"));
            p.setPrezzo(rs.getDouble("prezzo"));
            p.setImmagine(rs.getString("immagine"));
            p.setQuantita(rs.getInt("quantita"));
            lista.add(p);
        }

        con.close();
        return lista;
    }

    // 2. SALVA / INSERISCI NUOVO PRODOTTO
    public void doSave(Prodotto prodotto) throws SQLException {
        String query = "INSERT INTO prodotto (nome, descrizione, prezzo, immagine, quantita, attivo) VALUES (?, ?, ?, ?, ?, true)";
        
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, prodotto.getNome());
            ps.setString(2, prodotto.getDescrizione());
            ps.setDouble(3, prodotto.getPrezzo());
            ps.setString(4, prodotto.getImmagine());
            ps.setInt(5, prodotto.getQuantita());
            
            ps.executeUpdate();
        }
    }

    // 3. AGGIORNA / MODIFICA PRODOTTO ESISTENTE
    public void doUpdate(Prodotto prodotto) throws SQLException {
        String query = "UPDATE prodotto SET nome = ?, descrizione = ?, prezzo = ?, immagine = ?, quantita = ? WHERE id = ?";
        
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, prodotto.getNome()); 
            ps.setString(2, prodotto.getDescrizione());
            ps.setDouble(3, prodotto.getPrezzo());
            ps.setString(4, prodotto.getImmagine());
            ps.setInt(5, prodotto.getQuantita());
            ps.setInt(6, prodotto.getId());
            
            ps.executeUpdate();
        }
    }

    // 4. CANCELLAZIONE LOGICA (Imposta attivo = false anziché fare il DELETE HARD, per non rompere i vincoli di integrità)
    public void doDelete(int id) throws SQLException {
        String query = "UPDATE prodotto SET attivo = false WHERE id = ?";
        
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}