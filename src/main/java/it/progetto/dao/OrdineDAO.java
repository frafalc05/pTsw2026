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
            
            // Parametri base
            ps.setInt(1, ordine.getIdUtente());
            ps.setDouble(2, ordine.getTotale());
            ps.setString(3, ordine.getStato());
            
            // NUOVI: Parametri di spedizione recuperati dall'oggetto Ordine
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

    // 2. Lasciato vuoto per evitare l'errore sulla tabella dettaglio_ordine
    public void saveDettaglioOrdine(int idOrdine, int idProdotto, int quantita, double prezzo) throws Exception {
        // Nessuna operazione richiesta (puoi implementarla in futuro se serve)
    }

    // 3. RISOLTO: Aggiunto il '?' mancante dopo 'id_utente ='
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
                    
                    // Dati spedizione estratti dal DB
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

    /**
     * NUOVO METODO PER L'AMMINISTRATORE
     * Consente di visualizzare gli ordini complessivi filtrando per intervallo di date e/o ID cliente.
     */
    public List<Ordine> doRetrieveAdminReport(String dataInizio, String dataFine, Integer idCliente) throws Exception {
        List<Ordine> lista = new ArrayList<>();
        
        // Base della query SQL
        StringBuilder sql = new StringBuilder("SELECT * FROM ordine WHERE 1=1");
        
        // Costruzione dinamica dei filtri
        if (dataInizio != null && !dataInizio.trim().isEmpty()) {
            sql.append(" AND data_ordine >= ?");
        }
        if (dataFine != null && !dataFine.trim().isEmpty()) {
            // Aggiungiamo la fine della giornata per includere gli ordini fatti nella data limite 'y'
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
                // Imposta il limite "dalla data x" a inizio giornata
                ps.setString(paramIndex++, dataInizio + " 00:00:00");
            }
            if (dataFine != null && !dataFine.trim().isEmpty()) {
                // Imposta il limite "alla data y" a fine giornata completa
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
}