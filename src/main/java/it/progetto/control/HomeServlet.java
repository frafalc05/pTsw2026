package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import it.progetto.dao.ConnectionDB;
import it.progetto.dao.ProdottoDAO;
import it.progetto.model.Prodotto;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"", "/home"})
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProdottoDAO prodottoDAO = new ProdottoDAO();

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ConnectionDB.getConnection();

        try {
            ArrayList<Prodotto> piuVendutiOnline = prodottoDAO.trovaPiuVendutiOnline();
            request.setAttribute("piuVendutiOnline", piuVendutiOnline);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("piuVendutiOnline", new ArrayList<Prodotto>());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/user/home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}