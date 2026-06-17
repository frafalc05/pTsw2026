package it.progetto.control;

import it.progetto.dao.UtenteDAO;
import it.progetto.model.Utente;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

import org.apache.commons.codec.digest.DigestUtils;

@WebServlet("/registrazione")
public class RegistrazioneServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/view/common/registrazione.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String conferma = request.getParameter("confermaPassword");

        // controllo password
        if (password == null || !password.equals(conferma)) {
            request.setAttribute("errore", "Le password non coincidono");
            request.getRequestDispatcher("/WEB-INF/view/common/registrazione.jsp")
                   .forward(request, response);
            return;
        }

        // HASH password
        String hash = DigestUtils.sha256Hex(password);

        Utente u = new Utente();
        u.setNome(nome);
        u.setCognome(cognome);
        u.setEmail(email);
        u.setPassword(hash);
        u.setRuolo("USER");

        try {
            UtenteDAO dao = new UtenteDAO();
            dao.insertUtente(u);

            response.sendRedirect(request.getContextPath() + "/login");

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}