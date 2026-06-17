package it.progetto.dao;

import java.sql.*;

import org.apache.commons.codec.digest.DigestUtils;

import it.progetto.model.Utente;

public class UtenteDAO {

    public void insertUtente(Utente u) throws SQLException {
        String sql = "INSERT INTO utente (nome, cognome, email, password, ruolo) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, u.getNome());
            ps.setString(2, u.getCognome());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getPassword());
            ps.setString(5, u.getRuolo());

            ps.executeUpdate();
        }
    }

    public Utente login(String email, String password) throws SQLException {
        String passwordHash = DigestUtils.sha256Hex(password);

        String sql = "SELECT * FROM utente WHERE email = ? AND password = ?";

        try (Connection con = DataSourceProvider.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, passwordHash);

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