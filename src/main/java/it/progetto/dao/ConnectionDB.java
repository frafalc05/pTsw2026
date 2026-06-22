package it.progetto.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDB {

	public static Connection getConnection() {

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/fiorista_maria",
					"root",
					"root"
			);

			return con;

		} catch(Exception e) {

			System.out.println("ERRORE DATABASE");
			e.printStackTrace();

			return null;
		}
	}
}