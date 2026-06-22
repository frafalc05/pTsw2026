package it.progetto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import it.progetto.model.Ordine;

public class OrdineDAO {

    public int saveOrdine(Ordine ordine) throws Exception {
        String query = "INSERT INTO ordine (id_utente, totale, stato, data_ordine, nome_destinatario, indirizzo, citta, cap, messaggio) "
                     + "VALUES (?, ?, ?, NOW(), ?, ?, ?, ?, ?)";
        
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setInt(1, ordine.getIdUtente());
            ps.setDouble(2, ordine.getTotale());
            ps.setString(3, ordine.getStato());
            ps.setString(4, ordine.getNomeDestinatario());
            ps.setString(5, ordine.getIndirizzo());
            ps.setString(6, ordine.getCitta());
            ps.setString(7, ordine.getCap());
            ps.setString(8, ordine.getMessaggio());
            
            ps.executeUpdate();
            
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }
   public void saveDettaglioOrdine(int idOrdine, int idProdotto, int quantita, double prezzo) throws Exception {
        String query = "INSERT INTO riga_ordine (id_ordine, id_prodotto, quantita, prezzo_acquisto) VALUES (?, ?, ?, ?)";
        
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setInt(1, idOrdine);
            ps.setInt(2, idProdotto);
            ps.setInt(3, quantita);
            ps.setDouble(4, prezzo); 
            
            ps.executeUpdate();
        }
    }

    public List<Ordine> getOrdiniByUtente(int idUtente) throws Exception {
        List<Ordine> lista = new ArrayList<>();
        String query = "SELECT * FROM ordine WHERE id_utente = ? ORDER BY data_ordine DESC";
        
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setInt(1, idUtente);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Ordine o = new Ordine();
                    o.setId(rs.getInt("id"));
                    o.setIdUtente(rs.getInt("id_utente"));
                    o.setTotale(rs.getDouble("totale"));
                    o.setStato(rs.getString("stato"));
                    o.setDataOrdine(rs.getTimestamp("data_ordine"));
                    o.setNomeDestinatario(rs.getString("nome_destinatario"));
                    o.setIndirizzo(rs.getString("indirizzo"));
                    o.setCitta(rs.getString("citta"));
                    o.setCap(rs.getString("cap"));
                    o.setMessaggio(rs.getString("messaggio"));
                    
                    lista.add(o);
                }
            }
        }
        return lista;
    }

    public List<Ordine> doRetrieveAdminReport(String dataInizio, String dataFine, Integer idCliente) throws Exception {
        List<Ordine> lista = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM ordine WHERE 1=1");
        
        if (dataInizio != null && !dataInizio.trim().isEmpty()) {
            sql.append(" AND data_ordine >= ?");
        }
        if (dataFine != null && !dataFine.trim().isEmpty()) {
            sql.append(" AND data_ordine <= ?");
        }
        if (idCliente != null) {
            sql.append(" AND id_utente = ?");
        }
        
        sql.append(" ORDER BY data_ordine DESC");

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {
            
            int paramIndex = 1;
            
            if (dataInizio != null && !dataInizio.trim().isEmpty()) {
                ps.setString(paramIndex++, dataInizio + " 00:00:00");
            }
            if (dataFine != null && !dataFine.trim().isEmpty()) {
                ps.setString(paramIndex++, dataFine + " 23:59:59");
            }
            if (idCliente != null) {
                ps.setInt(paramIndex++, idCliente);
            }
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Ordine o = new Ordine();
                    o.setId(rs.getInt("id"));
                    o.setIdUtente(rs.getInt("id_utente"));
                    o.setTotale(rs.getDouble("totale"));
                    o.setStato(rs.getString("stato"));
                    o.setDataOrdine(rs.getTimestamp("data_ordine"));
                    o.setNomeDestinatario(rs.getString("nome_destinatario"));
                    o.setIndirizzo(rs.getString("indirizzo"));
                    o.setCitta(rs.getString("citta"));
                    o.setCap(rs.getString("cap"));
                    o.setMessaggio(rs.getString("messaggio"));
                    
                    lista.add(o);
                }
            }
        }
        return lista;
    }
    public void updateStato(int idOrdine, String nuovoStato) throws Exception {
        String query = "UPDATE ordine SET stato = ? WHERE id = ?";
        
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, nuovoStato);
            ps.setInt(2, idOrdine);
            
            ps.executeUpdate();
        }
    }
}