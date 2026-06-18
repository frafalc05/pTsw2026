package it.progetto.control;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Recuperiamo la sessione attuale senza crearne una nuova
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // Elimina tutti i dati (incluso il token utente e il ruolo)
            session.invalidate(); 
        }
        
        // Reindirizza l'utente alla home una volta uscito
        response.sendRedirect(request.getContextPath() + "/home");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}