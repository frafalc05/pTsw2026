package it.progetto.control;

import java.io.IOException;
import java.util.List;

import it.progetto.model.Utente;
import it.progetto.model.Ordine;
import it.progetto.dao.OrdineDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ordini")
public class OrdiniServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");
        
        // Se l'utente non è loggato, lo rimandiamo al login
        if (utente == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        try {
            // 1. Chiamiamo il DAO per leggere gli ordini reali dell'utente dal DB
            OrdineDAO ordineDao = new OrdineDAO();
            List<Ordine> listaOrdini = ordineDao.getOrdiniByUtente(utente.getId());
            
            // 2. Passiamo la lista alla pagina JSP tramite un attributo della request
            request.setAttribute("listaOrdini", listaOrdini);
            
        } catch (Exception e) {
            e.printStackTrace(); // Ti mostra eventuali errori di lettura in console
        }
        
        // 3. Inoltriamo alla pagina jsp corretta (adatta il percorso se diverso nel tuo progetto)
        request.getRequestDispatcher("/WEB-INF/view/user/ordini.jsp").forward(request, response);
    }
}