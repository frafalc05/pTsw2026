package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import it.progetto.dao.CarrelloDAO;
import it.progetto.dao.UtenteDAO;
import it.progetto.model.ProdottoQuantita;
import it.progetto.model.Utente;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/login", "/LoginServlet"})
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UtenteDAO utenteDAO = new UtenteDAO();
    private CarrelloDAO carrelloDAO = new CarrelloDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/user/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Utente utente = utenteDAO.login(email, password);

            if (utente != null) {
                HttpSession session = request.getSession();

                @SuppressWarnings("unchecked")
                List<ProdottoQuantita> carrelloSessione = (List<ProdottoQuantita>) session.getAttribute("carrello");

                session.setAttribute("utente", utente);
                session.setAttribute("ruolo", utente.getRuolo());
                session.setAttribute("accessToken", UUID.randomUUID().toString());

                carrelloDAO.salvaCarrelloSessioneNelDb(utente.getId(), carrelloSessione);

                List<ProdottoQuantita> carrelloDb = carrelloDAO.caricaCarrelloUtente(utente.getId());
                session.setAttribute("carrello", carrelloDb);

                if ("ADMIN".equalsIgnoreCase(utente.getRuolo())) {
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