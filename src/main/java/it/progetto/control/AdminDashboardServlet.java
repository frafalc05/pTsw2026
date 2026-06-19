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

@WebServlet("/AdminDashboardServlet")
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
                // Se viene inserito un ID non numerico lo ignoriamo o impostiamo a null
            }
        }

        OrdineDAO ordineDAO = new OrdineDAO();
        
        try {
            // 2. Chiamata al database per estrarre la lista filtrata
            List<Ordine> listaOrdini = ordineDAO.doRetrieveAdminReport(dataInizio, dataFine, idCliente);
            
            // 3. Re-impostiamo i parametri come attributi per mantenere i campi compilati nel form
            request.setAttribute("listaOrdini", listaOrdini);
            request.setAttribute("dataInizio", dataInizio);
            request.setAttribute("dataFine", dataFine);
            request.setAttribute("idCliente", idClienteStr);
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 4. Inoltro dei dati alla pagina di visualizzazione della Dashboard
        request.getRequestDispatcher("/WEB-INF/view/admin/dashboard.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}