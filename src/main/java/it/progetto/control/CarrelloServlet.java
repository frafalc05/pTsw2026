package it.progetto.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import it.progetto.dao.ProdottoDAO;
import it.progetto.model.Prodotto;
import it.progetto.model.ProdottoQuantita;

@WebServlet("/CarrelloServlet")
public class CarrelloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProdottoDAO prodottoDAO = new ProdottoDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        @SuppressWarnings("unchecked")
        List<ProdottoQuantita> carrello = (List<ProdottoQuantita>) session.getAttribute("carrello");
        if (carrello == null) {
            carrello = new ArrayList<>();
            session.setAttribute("carrello", carrello);
        }

        String action = request.getParameter("action");
     // Sotto il tuo controllo if ("add".equals(action)) { ... } aggiunto precedentemente, inserisci:

        if ("update".equals(action)) {
            int idProdotto = Integer.parseInt(request.getParameter("id"));
            int nuovaQuantita = Integer.parseInt(request.getParameter("quantita"));
            
            if (carrello != null) {
                for (ProdottoQuantita item : carrello) {
                    if (item.getProdotto().getId() == idProdotto) {
                        item.setQuantita(nuovaQuantita);
                        break;
                    }
                }
            }
            return; // Interrompe l'esecuzione senza ricaricare la pagina
        }

        if ("remove".equals(action)) {
            int idProdotto = Integer.parseInt(request.getParameter("id"));
            if (carrello != null) {
                carrello.removeIf(item -> item.getProdotto().getId() == idProdotto);
            }
            response.sendRedirect(request.getContextPath() + "/CarrelloServlet");
            return;
        }

        if ("clear".equals(action)) {
            if (carrello != null) {
                carrello.clear();
            }
            response.sendRedirect(request.getContextPath() + "/CarrelloServlet");
            return;
        }

        if ("add".equals(action)) {
            try {
                int idProdotto = Integer.parseInt(request.getParameter("id"));
                int quantita = Integer.parseInt(request.getParameter("quantita"));

                boolean giaPresente = false;
                for (ProdottoQuantita item : carrello) {
                    if (item.getProdotto().getId() == idProdotto) { 
                        item.setQuantita(item.getQuantita() + quantita);
                        giaPresente = true;
                        break;
                    }
                }

                if (!giaPresente) {
                    Prodotto prodotto = prodottoDAO.getProdottoById(idProdotto); 
                    if (prodotto != null) {
                        carrello.add(new ProdottoQuantita(prodotto, quantita));
                    }
                }

                int totaleArticoli = 0;
                for (ProdottoQuantita item : carrello) {
                    totaleArticoli += item.getQuantita();
                }

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print("{\"totaleArticoli\":" + totaleArticoli + "}");
                out.flush();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/user/carrello.jsp").forward(request, response);
    }
}