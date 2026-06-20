package it.progetto.control;

import java.io.IOException;
import java.util.List;
import it.progetto.dao.OrdineDAO;
import it.progetto.model.Ordine;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Recupero dei filtri inoltrati dal form della dashboard
        String dataInizio = request.getParameter("dataInizio");
        String dataFine = request.getParameter("dataFine");
        String idClienteStr = request.getParameter("idCliente");
        
        Integer idCliente = null;
        if (idClienteStr != null && !idClienteStr.trim().isEmpty()) {
            try {
                idCliente = Integer.parseInt(idClienteStr);
            } catch (NumberFormatException e) {
                // Se viene inserito un ID non numerico lo ignoriamo silenziosamente
            }
        }

        OrdineDAO ordineDAO = new OrdineDAO();
        
        try {
            // 2. Chiamata al database per estrarre la lista filtrata complessiva
            List<Ordine> listaOrdini = ordineDAO.doRetrieveAdminReport(dataInizio, dataFine, idCliente);
            
            // 3. Impostiamo i dati come attributi per la JSP
            request.setAttribute("listaOrdini", listaOrdini);
            request.setAttribute("dataInizio", dataInizio);
            request.setAttribute("dataFine", dataFine);
            request.setAttribute("idCliente", idClienteStr);
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 4. Inoltro alla pagina di visualizzazione strutturata sotto WEB-INF
        request.getRequestDispatcher("/WEB-INF/view/admin/dashboard.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        // INTERCETTAZIONE DELLA MODIFICA STATO ORDINE
        if ("updateStato".equals(action)) {
            try {
                int idOrdine = Integer.parseInt(request.getParameter("idOrdine"));
                String nuovoStato = request.getParameter("nuovoStato");
                
                OrdineDAO ordineDAO = new OrdineDAO();
                // Chiama il metodo che abbiamo inserito nel tuo OrdineDAO
                ordineDAO.updateStato(idOrdine, nuovoStato);
                
                // Ricarica la pagina in modo pulito con i dati aggiornati
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                return;
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        // Comportamento di fallback se la richiesta POST non riguarda lo stato dell'ordine
        doGet(request, response);
    }
}