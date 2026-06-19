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

    /**
     * Gestisce la richiesta GET: mostra la pagina di checkout con il form 
     * per l'inserimento dei dati di spedizione e pagamento.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        // Controllo se l'utente è loggato, altrimenti lo rimando al login
        if (session.getAttribute("utente") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        // Controllo se il carrello esiste ed è vuoto, in tal caso lo rimando al carrello
        @SuppressWarnings("unchecked")
        List<ProdottoQuantita> carrello = (List<ProdottoQuantita>) session.getAttribute("carrello");
        if (carrello == null || carrello.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/CarrelloServlet");
            return;
        }
        
        // Se tutto è okay, inoltro l'utente alla vista del checkout (dove compilerà il form)
        request.getRequestDispatcher("/WEB-INF/view/user/checkout.jsp").forward(request, response);
    }

    /**
     * Gestisce la richiesta POST: riceve i dati dal form di checkout,
     * calcola il totale, inserisce l'ordine nel DB e svuota il carrello.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");
        
        @SuppressWarnings("unchecked")
        List<ProdottoQuantita> carrello = (List<ProdottoQuantita>) session.getAttribute("carrello");
        
        // Controllo di sicurezza aggiuntivo sulla sessione
        if (utente == null || carrello == null || carrello.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/CarrelloServlet");
            return;
        }
        
        // 1. RECUPERO DEI DATI DI SPEDIZIONE E PAGAMENTO DAL FORM HTML
        String nomeDestinatario = request.getParameter("nome_destinatario");
        String indirizzo = request.getParameter("indirizzo");
        String citta = request.getParameter("citta");
        String cap = request.getParameter("cap");
        String messaggio = request.getParameter("messaggio");
        
        // Nota: Se decidi di salvare anche il metodo di pagamento a DB, puoi usarlo qui
        // String metodoPagamento = request.getParameter("metodo_pagamento");
        
        try {
            // 2. CALCOLO DEL PREZZO FINALE TOTALE
            double totale = 0;
            for (ProdottoQuantita item : carrello) {
                totale += item.getProdotto().getPrezzo() * item.getQuantita();
            }

            // 3. COSTRUZIONE DELL'OGGETTO ORDINE CON I DATI RICEVUTI
            OrdineDAO ordineDao = new OrdineDAO();
            Ordine ordine = new Ordine();
            
            ordine.setIdUtente(utente.getId());
            ordine.setTotale(totale);
            ordine.setStato("In Lavorazione"); // Stato di default iniziale
            
            // Impostiamo i dati che prima finivano a NULL nel database
            ordine.setNomeDestinatario(nomeDestinatario);
            ordine.setIndirizzo(indirizzo);
            ordine.setCitta(citta);
            ordine.setCap(cap);
            ordine.setMessaggio(messaggio);
            
            // 4. SALVATAGGIO ORDINE PRINCIPALE NEL DATABASE
            // Il DAO deve restituire l'ID auto-incrementato appena generato per l'ordine
            int idOrdine = ordineDao.saveOrdine(ordine);
            
            // 5. SALVATAGGIO DEI DETTAGLI DEGLI ARTICOLI (Tabella di legame)
            for (ProdottoQuantita item : carrello) {
                ordineDao.saveDettaglioOrdine(
                    idOrdine, 
                    item.getProdotto().getId(), 
                    item.getQuantita(), 
                    item.getProdotto().getPrezzo()
                );
            }
            
            // 6. SVUOTAMENTO DEL CARRELLO (Richiesto dalle specifiche del prof)
            session.removeAttribute("carrello");
            
            // 7. REINDIRIZZAMENTO ALLA PAGINA RIEPILOGATIVA DEGLI ORDINI UTENTE
            response.sendRedirect(request.getContextPath() + "/ordini");
            
        } catch (Exception e) {
            throw new ServletException("Errore durante il completamento e il salvataggio dell'ordine", e);
        }
    }
}