package it.progetto.dao;

import java.sql.*;
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
	        ps.setString(5, "USER");

	        ps.executeUpdate();
	    }
	}
}