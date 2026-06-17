package it.progetto.dao;

import java.sql.*;
import it.progetto.model.Utente;

public class UtenteDAO {

    public Utente login(String email, String password) throws SQLException {
        String sql = "SELECT * FROM utente WHERE email = ? AND password = ?";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Utente u = new Utente();
                    u.setId(rs.getInt("id"));
                    u.setNome(rs.getString("nome"));
                    u.setCognome(rs.getString("cognome"));
                    u.setEmail(rs.getString("email"));
                    u.setPassword(rs.getString("password"));
                    u.setRuolo(rs.getString("ruolo"));
                    return u;
                }
            }
        }

        return null;
    }
}