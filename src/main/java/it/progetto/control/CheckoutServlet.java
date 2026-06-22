package it.progetto.control;

import java.io.IOException;
import java.util.List;

import it.progetto.model.Utente;
import it.progetto.model.ProdottoQuantita;
import it.progetto.model.Ordine;
import it.progetto.dao.OrdineDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
       
        if (session.getAttribute("utente") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        @SuppressWarnings("unchecked")
        List<ProdottoQuantita> carrello = (List<ProdottoQuantita>) session.getAttribute("carrello");
        if (carrello == null || carrello.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/CarrelloServlet");
            return;
        }
        
        request.getRequestDispatcher("/WEB-INF/view/user/checkout.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");
        
        @SuppressWarnings("unchecked")
        List<ProdottoQuantita> carrello = (List<ProdottoQuantita>) session.getAttribute("carrello");
        
        if (utente == null || carrello == null || carrello.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/CarrelloServlet");
            return;
        }
        String nomeDestinatario = request.getParameter("nome_destinatario");
        String indirizzo = request.getParameter("indirizzo");
        String citta = request.getParameter("citta");
        String cap = request.getParameter("cap");
        String messaggio = request.getParameter("messaggio");
        
        
        try {
            double totale = 0;
            for (ProdottoQuantita item : carrello) {
                totale += item.getProdotto().getPrezzo() * item.getQuantita();
            }
            OrdineDAO ordineDao = new OrdineDAO();
            Ordine ordine = new Ordine();
            
            ordine.setIdUtente(utente.getId());
            ordine.setTotale(totale);
            ordine.setStato("In Lavorazione"); 
            ordine.setNomeDestinatario(nomeDestinatario);
            ordine.setIndirizzo(indirizzo);
            ordine.setCitta(citta);
            ordine.setCap(cap);
            ordine.setMessaggio(messaggio);
            
            int idOrdine = ordineDao.saveOrdine(ordine);
        
            for (ProdottoQuantita item : carrello) {
                ordineDao.saveDettaglioOrdine(
                    idOrdine, 
                    item.getProdotto().getId(), 
                    item.getQuantita(), 
                    item.getProdotto().getPrezzo()
                );
            }
            
            session.removeAttribute("carrello");
            response.sendRedirect(request.getContextPath() + "/ordini");
            
        } catch (Exception e) {
            throw new ServletException("Errore durante il completamento e il salvataggio dell'ordine", e);
        }
    }
}