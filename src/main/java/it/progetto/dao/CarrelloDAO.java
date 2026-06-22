package it.progetto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import it.progetto.model.Prodotto;
import it.progetto.model.ProdottoQuantita;

public class CarrelloDAO {

    public void aggiungiProdotto(int idUtente, int idProdotto, int quantita) throws SQLException {
        String sql = "INSERT INTO carrello (id_utente, id_prodotto, quantita) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE quantita = quantita + VALUES(quantita), data_aggiunta = CURRENT_TIMESTAMP";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idUtente);
            ps.setInt(2, idProdotto);
            ps.setInt(3, quantita);
            ps.executeUpdate();
        }
    }

    public void aggiornaQuantita(int idUtente, int idProdotto, int quantita) throws SQLException {
        String sql = "UPDATE carrello SET quantita = ?, data_aggiunta = CURRENT_TIMESTAMP WHERE id_utente = ? AND id_prodotto = ?";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, quantita);
            ps.setInt(2, idUtente);
            ps.setInt(3, idProdotto);
            ps.executeUpdate();
        }
    }

    public void rimuoviProdotto(int idUtente, int idProdotto) throws SQLException {
        String sql = "DELETE FROM carrello WHERE id_utente = ? AND id_prodotto = ?";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idUtente);
            ps.setInt(2, idProdotto);
            ps.executeUpdate();
        }
    }

    public void svuotaCarrello(int idUtente) throws SQLException {
        String sql = "DELETE FROM carrello WHERE id_utente = ?";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idUtente);
            ps.executeUpdate();
        }
    }

    public List<ProdottoQuantita> caricaCarrelloUtente(int idUtente) throws SQLException {
        List<ProdottoQuantita> carrello = new ArrayList<>();

        String sql = "SELECT p.id, p.nome, p.descrizione, p.prezzo, p.immagine, p.quantita, p.categoria, p.attivo, c.quantita AS quantita_carrello " +
                     "FROM carrello c " +
                     "JOIN prodotto p ON c.id_prodotto = p.id " +
                     "WHERE c.id_utente = ? AND p.attivo = true";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idUtente);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Prodotto prodotto = new Prodotto();

                    prodotto.setId(rs.getInt("id"));
                    prodotto.setNome(rs.getString("nome"));
                    prodotto.setDescrizione(rs.getString("descrizione"));
                    prodotto.setPrezzo(rs.getDouble("prezzo"));
                    prodotto.setImmagine(rs.getString("immagine"));
                    prodotto.setQuantita(rs.getInt("quantita"));
                    prodotto.setCategoria(rs.getString("categoria"));
                    prodotto.setAttivo(rs.getBoolean("attivo"));

                    int quantitaCarrello = rs.getInt("quantita_carrello");

                    ProdottoQuantita pq = new ProdottoQuantita(prodotto, quantitaCarrello);
                    carrello.add(pq);
                }
            }
        }

        return carrello;
    }

    public void salvaCarrelloSessioneNelDb(int idUtente, List<ProdottoQuantita> carrelloSessione) throws SQLException {
        if (carrelloSessione == null || carrelloSessione.isEmpty()) {
            return;
        }

        for (ProdottoQuantita pq : carrelloSessione) {
            if (pq != null && pq.getProdotto() != null && pq.getQuantita() > 0) {
                aggiungiProdotto(idUtente, pq.getProdotto().getId(), pq.getQuantita());
            }
        }
    }
}