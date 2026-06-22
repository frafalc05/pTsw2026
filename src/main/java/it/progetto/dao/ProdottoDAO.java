package it.progetto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import it.progetto.model.Prodotto;

public class ProdottoDAO {

    public ArrayList<Prodotto> trovaTutti() throws SQLException {
        ArrayList<Prodotto> lista = new ArrayList<>();

        String sql = "SELECT * FROM prodotto WHERE attivo = true";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(creaProdotto(rs));
            }
        }

        return lista;
    }

    public Prodotto getProdottoById(int id) throws SQLException {
        Prodotto prodotto = null;

        String sql = "SELECT * FROM prodotto WHERE id = ?";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    prodotto = creaProdotto(rs);
                }
            }
        }

        return prodotto;
    }

    public Prodotto doRetrieveById(int id) throws SQLException {
        return getProdottoById(id);
    }

    public ArrayList<Prodotto> trovaTuttiAdmin() throws SQLException {
        ArrayList<Prodotto> lista = new ArrayList<>();

        String sql = "SELECT * FROM prodotto ORDER BY id DESC";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(creaProdotto(rs));
            }
        }

        return lista;
    }

    public List<Prodotto> doRetrieveAll() throws SQLException {
        return trovaTuttiAdmin();
    }

    public void doSave(Prodotto prodotto) throws SQLException {
        String sql = "INSERT INTO prodotto (nome, descrizione, prezzo, immagine, quantita, categoria, attivo) VALUES (?, ?, ?, ?, ?, ?, true)";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, prodotto.getNome());
            ps.setString(2, prodotto.getDescrizione());
            ps.setDouble(3, prodotto.getPrezzo());
            ps.setString(4, prodotto.getImmagine());
            ps.setInt(5, prodotto.getQuantita());
            ps.setString(6, prodotto.getCategoria());

            ps.executeUpdate();
        }
    }

    public void doUpdate(Prodotto prodotto) throws SQLException {
        String sql = "UPDATE prodotto SET nome = ?, descrizione = ?, prezzo = ?, immagine = ?, quantita = ?, categoria = ?, attivo = ? WHERE id = ?";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, prodotto.getNome());
            ps.setString(2, prodotto.getDescrizione());
            ps.setDouble(3, prodotto.getPrezzo());
            ps.setString(4, prodotto.getImmagine());
            ps.setInt(5, prodotto.getQuantita());
            ps.setString(6, prodotto.getCategoria());
            ps.setBoolean(7, prodotto.isAttivo());
            ps.setInt(8, prodotto.getId());

            ps.executeUpdate();
        }
    }

    public void doDelete(int id) throws SQLException {
        String sql = "UPDATE prodotto SET attivo = false WHERE id = ?";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    public ArrayList<Prodotto> trovaPiuVendutiOnline() throws SQLException {
        ArrayList<Prodotto> lista = new ArrayList<>();

        String sql = "SELECT p.id, p.nome, p.descrizione, p.prezzo, p.immagine, p.quantita, p.categoria, p.attivo, SUM(r.quantita) AS totale_venduto " +
                     "FROM riga_ordine r " +
                     "JOIN prodotto p ON r.id_prodotto = p.id " +
                     "WHERE p.attivo = true " +
                     "GROUP BY p.id, p.nome, p.descrizione, p.prezzo, p.immagine, p.quantita, p.categoria, p.attivo " +
                     "ORDER BY totale_venduto DESC " +
                     "LIMIT 4";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(creaProdotto(rs));
            }
        }

        return lista;
    }

    private Prodotto creaProdotto(ResultSet rs) throws SQLException {
        Prodotto prodotto = new Prodotto();

        prodotto.setId(rs.getInt("id"));
        prodotto.setNome(rs.getString("nome"));
        prodotto.setDescrizione(rs.getString("descrizione"));
        prodotto.setPrezzo(rs.getDouble("prezzo"));
        prodotto.setImmagine(rs.getString("immagine"));
        prodotto.setQuantita(rs.getInt("quantita"));
        prodotto.setAttivo(rs.getBoolean("attivo"));

        try {
            prodotto.setCategoria(rs.getString("categoria"));
        } catch (SQLException e) {
            prodotto.setCategoria(null);
        }

        return prodotto;
    }
}