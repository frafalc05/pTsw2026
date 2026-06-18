package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;

import it.progetto.dao.UtenteDAO;
import it.progetto.model.Utente;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
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
                
                // REQUISITO: Token inserito in sessione per il controllo degli accessi
                session.setAttribute("utente", utente);
                session.setAttribute("ruolo", utente.getRuolo());

                // REQUISITO: Controllo del ruolo per il reindirizzamento
                if ("ADMIN".equalsIgnoreCase(utente.getRuolo())) {
                    // Se è admin, lo reindirizziamo alla servlet della dashboard admin (o alla pagina admin)
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard"); 
                } else {
                    // Se è un cliente normale, va alla home
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