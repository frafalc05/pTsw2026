package it.progetto.dao;

import java.sql.*;
import java.util.ArrayList;
import it.progetto.model.Prodotto;

public class ProdottoDAO {

    // Il tuo metodo attuale per prendere tutti i prodotti
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

    // NUOVO METODO: Aggiungi questo esattamente qui sotto!
    public Prodotto getProdottoById(int id) throws SQLException {
        Prodotto p = null;
        Connection con = DataSourceProvider.getDataSource().getConnection();
        
        // Prepariamo la query filtrando per ID
        PreparedStatement ps = con.prepareStatement("SELECT * FROM prodotto WHERE id = ?");
        ps.setInt(1, id); // Sostituisce il punto interrogativo con l'id passato
        
        ResultSet rs = ps.executeQuery();

        // Se trova il prodotto, ne estrae i dati
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
        return p; // Restituisce l'oggetto Prodotto compilato, oppure null se non l'ha trovato
    }
}