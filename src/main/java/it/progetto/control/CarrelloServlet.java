package it.progetto.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import it.progetto.dao.CarrelloDAO;
import it.progetto.dao.ProdottoDAO;
import it.progetto.model.Prodotto;
import it.progetto.model.ProdottoQuantita;
import it.progetto.model.Utente;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CarrelloServlet")
public class CarrelloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProdottoDAO prodottoDAO = new ProdottoDAO();
    private CarrelloDAO carrelloDAO = new CarrelloDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Utente utente = (Utente) session.getAttribute("utente");

        @SuppressWarnings("unchecked")
        List<ProdottoQuantita> carrello = (List<ProdottoQuantita>) session.getAttribute("carrello");

        if (carrello == null) {
            carrello = new ArrayList<>();
            session.setAttribute("carrello", carrello);
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            try {
                int idProdotto = Integer.parseInt(request.getParameter("id"));
                int quantita = Integer.parseInt(request.getParameter("quantita"));

                if (quantita < 1) {
                    quantita = 1;
                }

                boolean trovato = false;

                for (ProdottoQuantita item : carrello) {
                    if (item.getProdotto().getId() == idProdotto) {
                        item.setQuantita(item.getQuantita() + quantita);
                        trovato = true;
                        break;
                    }
                }

                if (!trovato) {
                    Prodotto prodotto = prodottoDAO.getProdottoById(idProdotto);

                    if (prodotto != null) {
                        carrello.add(new ProdottoQuantita(prodotto, quantita));
                    }
                }

                session.setAttribute("carrello", carrello);

                if (utente != null) {
                    carrelloDAO.aggiungiProdotto(utente.getId(), idProdotto, quantita);
                }

                int totaleArticoli = calcolaTotaleArticoli(carrello);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                PrintWriter out = response.getWriter();
                out.print("{\"totaleArticoli\":" + totaleArticoli + "}");
                out.flush();

            } catch (Exception e) {
                e.printStackTrace();

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                PrintWriter out = response.getWriter();
                out.print("{\"errore\":\"" + e.getMessage() + "\"}");
                out.flush();
            }

            return;
        }

        if ("update".equals(action)) {
            try {
                int idProdotto = Integer.parseInt(request.getParameter("id"));
                int nuovaQuantita = Integer.parseInt(request.getParameter("quantita"));

                if (nuovaQuantita < 1) {
                    nuovaQuantita = 1;
                }

                for (ProdottoQuantita item : carrello) {
                    if (item.getProdotto().getId() == idProdotto) {
                        item.setQuantita(nuovaQuantita);
                        break;
                    }
                }

                session.setAttribute("carrello", carrello);

                if (utente != null) {
                    carrelloDAO.aggiornaQuantita(utente.getId(), idProdotto, nuovaQuantita);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return;
        }

        if ("remove".equals(action)) {
            try {
                int idProdotto = Integer.parseInt(request.getParameter("id"));

                carrello.removeIf(item -> item.getProdotto().getId() == idProdotto);
                session.setAttribute("carrello", carrello);

                if (utente != null) {
                    carrelloDAO.rimuoviProdotto(utente.getId(), idProdotto);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            response.sendRedirect(request.getContextPath() + "/CarrelloServlet");
            return;
        }

        if ("clear".equals(action)) {
            try {
                carrello.clear();
                session.setAttribute("carrello", carrello);

                if (utente != null) {
                    carrelloDAO.svuotaCarrello(utente.getId());
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            response.sendRedirect(request.getContextPath() + "/CarrelloServlet");
            return;
        }

        response.sendRedirect(request.getContextPath() + "/catalogo");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Utente utente = (Utente) session.getAttribute("utente");

        if (utente != null) {
            try {
                List<ProdottoQuantita> carrelloDb = carrelloDAO.caricaCarrelloUtente(utente.getId());
                session.setAttribute("carrello", carrelloDb);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("/WEB-INF/view/user/carrello.jsp").forward(request, response);
    }

    private int calcolaTotaleArticoli(List<ProdottoQuantita> carrello) {
        int totaleArticoli = 0;

        if (carrello != null) {
            for (ProdottoQuantita item : carrello) {
                totaleArticoli += item.getQuantita();
            }
        }

        return totaleArticoli;
    }
}