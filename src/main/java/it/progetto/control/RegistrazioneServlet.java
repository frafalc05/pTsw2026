package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;

import org.apache.commons.codec.digest.DigestUtils;

import it.progetto.dao.UtenteDAO;
import it.progetto.model.Utente;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/registrazione")
public class RegistrazioneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/user/registrazione.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String conferma = request.getParameter("confermaPassword");

        
        

        try {
            UtenteDAO dao = new UtenteDAO();
            if (dao.doRetrieveByEmail(email) != null) {
                request.setAttribute("errore", "Questa email è già registrata.");

                request.getRequestDispatcher("/WEB-INF/view/user/registrazione.jsp")
                       .forward(request, response);
                return;
            }

            Utente u = new Utente();
            u.setNome(nome);
            u.setCognome(cognome);
            u.setEmail(email);
            u.setPassword(DigestUtils.sha256Hex(password));
            u.setRuolo("USER");

            dao.insertUtente(u);

            response.sendRedirect(request.getContextPath() + "/login");

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}