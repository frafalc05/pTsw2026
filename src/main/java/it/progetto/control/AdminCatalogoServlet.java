package it.progetto.control;

import java.io.IOException;
import java.util.List;
import it.progetto.dao.ProdottoDAO;
import it.progetto.model.Prodotto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/catalogo")
public class AdminCatalogoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ProdottoDAO prodottoDAO = new ProdottoDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "new":
                    // Mostra la pagina con il form vuoto per un nuovo inserimento
                    request.getRequestDispatcher("/WEB-INF/view/admin/catalogo_form.jsp").forward(request, response);
                    break;
                    
                case "edit":
                    // Recupera il prodotto specifico per ID e mostra il form precompilato per la modifica
                    int idModifica = Integer.parseInt(request.getParameter("id"));
                    Prodotto p = prodottoDAO.doRetrieveById(idModifica);
                    request.setAttribute("prodotto", p);
                    request.getRequestDispatcher("/WEB-INF/view/admin/catalogo_form.jsp").forward(request, response);
                    break;
                    
                case "delete":
                    // Cancella l'elemento dal database e ricarica la lista aggiornata
                    int idCancella = Integer.parseInt(request.getParameter("id"));
                    prodottoDAO.doDelete(idCancella);
                    // Reindirizzamento corretto al nuovo URL della servlet
                    response.sendRedirect(request.getContextPath() + "/admin/catalogo?action=list");
                    break;
                    
                default:
                    // Di default visualizza l'elenco completo di tutti gli elementi del catalogo
                    List<Prodotto> catalogo = prodottoDAO.doRetrieveAll();
                    request.setAttribute("catalogo", catalogo);
                    request.getRequestDispatcher("/WEB-INF/view/admin/catalogo_lista.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Gestisce il salvataggio dei dati inviati dal form (sia NUOVO inserimento che MODIFICA)
        String idStr = request.getParameter("id");
        String nome = request.getParameter("nome");
        String descrizione = request.getParameter("descrizione");
        double prezzo = Double.parseDouble(request.getParameter("prezzo"));
        
        Prodotto p = new Prodotto();
        p.setNome(nome);
        p.setDescrizione(descrizione);
        p.setPrezzo(prezzo);

        try {
            if (idStr == null || idStr.trim().isEmpty()) {
                // Se non c'è l'ID, stiamo inserendo un nuovo elemento
                prodottoDAO.doSave(p);
            } else {
                // Se l'ID è presente, aggiorniamo l'elemento esistente
                p.setId(Integer.parseInt(idStr));
                prodottoDAO.doUpdate(p);
            }
            // Reindirizzamento corretto al nuovo URL della lista aggiornata
            response.sendRedirect(request.getContextPath() + "/admin/catalogo?action=list");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}