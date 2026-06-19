package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;
import it.progetto.dao.UtenteDAO;
import it.progetto.model.Utente;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(urlPatterns = {"/login", "/LoginServlet"})
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/user/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            UtenteDAO dao = new UtenteDAO();
            Utente utente = dao.login(email, password);

            if (utente != null) {
                HttpSession session = request.getSession();
                session.setAttribute("utente", utente);
                session.setAttribute("ruolo", utente.getRuolo());

                // Controllo del ruolo per decidere dove mandare l'utente
                if ("ADMIN".equalsIgnoreCase(utente.getRuolo())) {
                    // MODIFICATO: reindirizza al nuovo percorso pulito e protetto dal filtro
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard"); 
                } else {
                    response.sendRedirect(request.getContextPath() + "/home");
                }
                
            } else {
                request.setAttribute("errore", "Email o password non corretti");
                request.getRequestDispatcher("/WEB-INF/view/user/login.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}