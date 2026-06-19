package it.progetto.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import it.progetto.model.Prodotto;

public class ProdottoDAO {

    // Lato cliente: prende solo quelli attivi
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
                }
            }
        }
        return p;
    }

    // ALLINEAMENTO SERVLET: Mappa su getProdottoById
    public Prodotto doRetrieveById(int id) throws SQLException {
        return getProdottoById(id);
    }

    /* ==========================================================================
       METODI PER IL CRUD AMMINISTRATORE
       ========================================================================== */

    // MODIFICATO: Ora mostra all'admin solo i prodotti attivi, così l'eliminazione ha effetto visivo immediato!
    public ArrayList<Prodotto> trovaTuttiAdmin() throws SQLException {
        ArrayList<Prodotto> lista = new ArrayList<>();
        String sql = "SELECT * FROM prodotto WHERE attivo=true ORDER BY id DESC";
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
                lista.add(p);
            }
        }
        return lista;
    }

    // ALLINEAMENTO SERVLET: Mappa su trovaTuttiAdmin
    public List<Prodotto> doRetrieveAll() throws SQLException {
        return trovaTuttiAdmin();
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

    // 4. CANCELLAZIONE LOGICA (Imposta lo stato a disattivato)
 // Sostituisci il vecchio doDelete con questo se vuoi la cancellazione TOTALE dal DB
    public void doDelete(int id) throws SQLException {
        String query = "DELETE FROM prodotto WHERE id = ?"; // <-- Cambiata la query
        
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}