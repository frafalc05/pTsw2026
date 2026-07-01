package it.progetto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import it.progetto.model.Prodotto;
import it.progetto.dao.ConnectionDB; // Sostituisci con la tua classe di connessione

public class PreferitiDAO {

    public boolean aggiungiPreferito(int idUtente, int idProdotto) {
        String query = "INSERT INTO preferiti (id_utente, id_prodotto) VALUES (?, ?)";
        try (Connection conn = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, idUtente);
            ps.setInt(2, idProdotto);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean rimuoviPreferito(int idUtente, int idProdotto) {
        String query = "DELETE FROM preferiti WHERE id_utente = ? AND id_prodotto = ?";
        try (Connection conn = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, idUtente);
            ps.setInt(2, idProdotto);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public List<Prodotto> getPreferitiUtente(int idUtente) {
        List<Prodotto> lista = new ArrayList<>();
        String query = "SELECT p.* FROM prodotto p " +
                       "JOIN preferiti f ON p.id = f.id_prodotto " +
                       "WHERE f.id_utente = ?";
        try (Connection conn = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, idUtente);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Prodotto p = new Prodotto();
                    p.setId(rs.getInt("id"));
                    p.setNome(rs.getString("nome"));
                    p.setDescrizione(rs.getString("descrizione"));
                    p.setPrezzo(rs.getDouble("prezzo"));
                    p.setImmagine(rs.getString("immagine"));
                    lista.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
}