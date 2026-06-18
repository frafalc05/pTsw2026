package it.progetto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import it.progetto.model.Ordine;

public class OrdineDAO {

    // 1. Salva l'ordine inserendo automaticamente la data corrente
    public int saveOrdine(Ordine ordine) throws Exception {
        String query = "INSERT INTO ordine (id_utente, totale, stato, data_ordine) VALUES (?, ?, ?, NOW())";
        
        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setInt(1, ordine.getIdUtente());
            ps.setDouble(2, ordine.getTotale());
            ps.setString(3, ordine.getStato());
            
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
        // Nessuna operazione richiesta
    }

    // 3. RISOLTO: Aggiunto il '?' mancante dopo 'id_utente ='
    public List<Ordine> getOrdiniByUtente(int idUtente) throws Exception {
        List<Ordine> lista = new ArrayList<>();
        
        // CORRETTO: Adesso c'è il "id_utente = ?" per accogliere il parametro della servlet
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
                    
                    lista.add(o);
                }
            }
        }
        return lista;
    }
}