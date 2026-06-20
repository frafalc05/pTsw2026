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
        
        String dataInizio = request.getParameter("dataInizio");
        String dataFine = request.getParameter("dataFine");
        String idClienteStr = request.getParameter("idCliente");
        
        Integer idCliente = null;
        if (idClienteStr != null && !idClienteStr.trim().isEmpty()) {
            try {
                idCliente = Integer.parseInt(idClienteStr);
            } catch (NumberFormatException e) {
                
            }
        }

        OrdineDAO ordineDAO = new OrdineDAO();
        
        try {
            
            List<Ordine> listaOrdini = ordineDAO.doRetrieveAdminReport(dataInizio, dataFine, idCliente);
            
            request.setAttribute("listaOrdini", listaOrdini);
            request.setAttribute("dataInizio", dataInizio);
            request.setAttribute("dataFine", dataFine);
            request.setAttribute("idCliente", idClienteStr);
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/dashboard.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
      
        if ("updateStato".equals(action)) {
            try {
                int idOrdine = Integer.parseInt(request.getParameter("idOrdine"));
                String nuovoStato = request.getParameter("nuovoStato");
                
                OrdineDAO ordineDAO = new OrdineDAO();
                
                ordineDAO.updateStato(idOrdine, nuovoStato);
                
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                return;
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
      
        doGet(request, response);
    }
}