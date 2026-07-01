package it.progetto.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import it.progetto.dao.PreferitiDAO;
import it.progetto.dao.ProdottoDAO; 
import it.progetto.model.Prodotto;
import it.progetto.model.Utente;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private PreferitiDAO preferitiDAO = new PreferitiDAO();
    private ProdottoDAO prodottoDAO = new ProdottoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");
        List<Prodotto> prodottiPreferiti = new ArrayList<>();

        if (utente != null) {
            prodottiPreferiti = preferitiDAO.getPreferitiUtente(utente.getId());
        } else {
            @SuppressWarnings("unchecked")
            List<Integer> wishlistOspite =
                    (List<Integer>) session.getAttribute("wishlist_ospite");

            if (wishlistOspite != null && !wishlistOspite.isEmpty()) {
                for (Integer idProd : wishlistOspite) {
                    try {
                        Prodotto p = prodottoDAO.getProdottoById(idProd);
                        if (p != null) {
                            prodottiPreferiti.add(p);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        request.setAttribute("prodottiPreferiti", prodottiPreferiti);
        request.getRequestDispatcher("/WEB-INF/view/user/wishlist.jsp").forward(request, response);
    }  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idProdotto = Integer.parseInt(request.getParameter("idProdotto"));
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");

        String rispostaAjax = "";

        if (utente != null) {

            List<Prodotto> preferitiAttuali =
                    preferitiDAO.getPreferitiUtente(utente.getId());

            boolean giaPresente = false;

            for (Prodotto p : preferitiAttuali) {
                if (p.getId() == idProdotto) {
                    giaPresente = true;
                    break;
                }
            }

            if (!giaPresente) {
                preferitiDAO.aggiungiPreferito(utente.getId(), idProdotto);
                rispostaAjax = "aggiunto";
            } else {
                preferitiDAO.rimuoviPreferito(utente.getId(), idProdotto);
                rispostaAjax = "rimosso";
            }

        } else {

            @SuppressWarnings("unchecked")
            List<Integer> wishlistOspite =
                    (List<Integer>) session.getAttribute("wishlist_ospite");

            if (wishlistOspite == null) {
                wishlistOspite = new ArrayList<>();
            }

            if (!wishlistOspite.contains(idProdotto)) {
                wishlistOspite.add(idProdotto);
                rispostaAjax = "aggiunto";
            } else {
                wishlistOspite.remove(Integer.valueOf(idProdotto));
                rispostaAjax = "rimosso";
            }

            session.setAttribute("wishlist_ospite", wishlistOspite);
        }

        response.setContentType("text/plain");
        response.getWriter().write(rispostaAjax);
    }   

}   