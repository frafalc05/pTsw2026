package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import it.progetto.dao.OrdineDAO;
import it.progetto.model.Utente;
import it.progetto.model.Ordine; 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ordini")
public class OrdiniServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Sicurezza: se l'utente non è loggato, lo rimandiamo al login
        if (session == null || session.getAttribute("utente") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Utente utente = (Utente) session.getAttribute("utente");

        try {
            OrdineDAO dao = new OrdineDAO();
            // Recupera gli ordini associati all'ID dell'utente loggato
            // CORRETTO: Usiamo il nome esatto del metodo presente in OrdineDAO
            List<Ordine> listaOrdini = dao.getOrdiniByUtente(utente.getId());
            
            // Passa la lista alla pagina JSP
            request.setAttribute("listaOrdini", listaOrdini);
            
            // Inoltra alla pagina jsp dentro WEB-INF
            request.getRequestDispatcher("/WEB-INF/view/user/ordini.jsp").forward(request, response);
            
        } catch (SQLException e) {
            throw new ServletException(e);
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}