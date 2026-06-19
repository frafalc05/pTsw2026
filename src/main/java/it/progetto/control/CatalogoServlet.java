package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import it.progetto.dao.ProdottoDAO;
import it.progetto.model.Prodotto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/catalogo")
public class CatalogoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    // Inizializziamo il DAO per accedere al database
    private ProdottoDAO prodottoDAO = new ProdottoDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 1. Recupera la lista di tutti i prodotti attivi dal database
            List<Prodotto> listaProdotti = prodottoDAO.trovaTutti();
            
            // 2. Passa la lista alla pagina JSP con il nome esatto "prodotti"
            request.setAttribute("prodotti", listaProdotti);
            
        } catch (SQLException e) {
            e.printStackTrace();
            // Opzionale: puoi loggare l'errore se il database ha problemi di connessione
        }

        // 3. Invia i dati alla pagina JSP utente
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/user/catalogo.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}