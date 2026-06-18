package it.progetto.control;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import it.progetto.model.ProdottoQuantita;

@WebServlet("/carrello")
public class CarrelloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        // Recuperiamo il carrello dalla sessione
        ArrayList<ProdottoQuantita> carrello = (ArrayList<ProdottoQuantita>) session.getAttribute("carrello");
        
        // Se non esiste ancora (il carrello è vuoto per la prima volta), creiamo una lista vuota
        if (carrello == null) {
            carrello = new ArrayList<>();
            session.setAttribute("carrello", carrello);
        }
        
        // Spediamo il carrello alla pagina JSP
        request.getRequestDispatcher("/WEB-INF/view/user/carrello.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}