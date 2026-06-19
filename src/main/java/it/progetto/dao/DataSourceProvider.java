package it.progetto.dao;
import javax.sql.DataSource;

import com.mysql.cj.jdbc.MysqlDataSource;


public class DataSourceProvider {


	private static DataSource dataSource;


	public static DataSource getDataSource(){


		if(dataSource == null){


			MysqlDataSource ds = new MysqlDataSource();


			ds.setURL(
			"jdbc:mysql://localhost:3306/fiorista_maria"
			);


			ds.setUser("root");


		ds.setPassword("root");


			dataSource = ds;


		}


		return dataSource;


	}

}