package it.progetto.dao;
import java.sql.*;
import java.util.ArrayList;

import it.progetto.model.Prodotto;


public class ProdottoDAO {



public ArrayList<Prodotto> trovaTutti() throws SQLException {


ArrayList<Prodotto> lista =
new ArrayList<>();


Connection con =
DataSourceProvider
.getDataSource()
.getConnection();



PreparedStatement ps =
con.prepareStatement(

"SELECT * FROM prodotto WHERE attivo=true"

);



ResultSet rs =
ps.executeQuery();



while(rs.next()){


Prodotto p =
new Prodotto();


p.setId(rs.getInt("id"));

p.setNome(
rs.getString("nome")
);


p.setDescrizione(
rs.getString("descrizione")
);


p.setPrezzo(
rs.getDouble("prezzo")
);


p.setImmagine(
rs.getString("immagine")
);


p.setQuantita(
rs.getInt("quantita")
);



lista.add(p);


}



con.close();


return lista;


}


}