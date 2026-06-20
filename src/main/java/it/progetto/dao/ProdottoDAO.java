package it.progetto.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import it.progetto.model.Prodotto;

public class ProdottoDAO {

    // Lato cliente: prende solo quelli attivi nel catalogo
    public ArrayList<Prodotto> trovaTutti() throws SQLException {
        ArrayList<Prodotto> lista = new ArrayList<>();
        String sql = "SELECT * FROM prodotto WHERE attivo=true";
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while(rs.next()){
                Prodotto p = new Prodotto();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setDescrizione(rs.getString("descrizione"));
                p.setPrezzo(rs.getDouble("prezzo"));
                p.setImmagine(rs.getString("immagine"));
                p.setQuantita(rs.getInt("quantita"));
                p.setAttivo(rs.getBoolean("attivo"));
                lista.add(p);
            }
        }
        return lista;
    }

    // Recupera il prodotto singolo per ID
    public Prodotto getProdottoById(int id) throws SQLException {
        Prodotto p = null;
        String sql = "SELECT * FROM prodotto WHERE id = ?";
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Prodotto();
                    p.setId(rs.getInt("id"));
                    p.setNome(rs.getString("nome"));
                    p.setDescrizione(rs.getString("descrizione"));
                    p.setPrezzo(rs.getDouble("prezzo"));
                    p.setImmagine(rs.getString("immagine"));
                    p.setQuantita(rs.getInt("quantita"));
                    p.setAttivo(rs.getBoolean("attivo"));
                }
            }
        }
        return p;
    }

    public Prodotto doRetrieveById(int id) throws SQLException {
        return getProdottoById(id);
    }

    /* ==========================================================================
       METODI PER IL CRUD AMMINISTRATORE
       ========================================================================== */

    // CORRETTO: L'admin vede TUTTI i prodotti nel DB per poterli gestire, anche quelli disattivati
    public ArrayList<Prodotto> trovaTuttiAdmin() throws SQLException {
        ArrayList<Prodotto> lista = new ArrayList<>();
        String sql = "SELECT * FROM prodotto ORDER BY id DESC";
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while(rs.next()){
                Prodotto p = new Prodotto();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setDescrizione(rs.getString("descrizione"));
                p.setPrezzo(rs.getDouble("prezzo"));
                p.setImmagine(rs.getString("immagine"));
                p.setQuantita(rs.getInt("quantita"));
                p.setAttivo(rs.getBoolean("attivo"));
                lista.add(p);
            }
        }
        return lista;
    }

    public List<Prodotto> doRetrieveAll() throws SQLException {
        return trovaTuttiAdmin();
    }

    // Salva nuovo prodotto impostandolo come attivo di default
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

    // Aggiorna i dati del prodotto includendo lo stato "attivo" gestibile dall'admin
    public void doUpdate(Prodotto prodotto) throws SQLException {
        String query = "UPDATE prodotto SET nome = ?, descrizione = ?, prezzo = ?, immagine = ?, quantita = ?, attivo = ? WHERE id = ?";
        
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, prodotto.getNome()); 
            ps.setString(2, prodotto.getDescrizione());
            ps.setDouble(3, prodotto.getPrezzo());
            ps.setString(4, prodotto.getImmagine());
            ps.setInt(5, prodotto.getQuantita());
            ps.setBoolean(6, prodotto.isAttivo());
            ps.setInt(7, prodotto.getId());
            
            ps.executeUpdate();
        }
    }

    // CORRETTO: Cancellazione LOGICA. Il prodotto rimane nel DB per non rompere la tabella riga_ordine
    public void doDelete(int id) throws SQLException {
        String query = "UPDATE prodotto SET attivo = false WHERE id = ?"; 
        
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}