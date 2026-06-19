package it.progetto.control;

import java.io.IOException;
import java.util.ArrayList;
import it.progetto.dao.ProdottoDAO;
import it.progetto.model.Prodotto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminCatalogoServlet")
public class AdminCatalogoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        ProdottoDAO prodottoDAO = new ProdottoDAO();

        try {
            if (action == null || action.equals("list")) {
                // Legge tutti i prodotti (inclusi quelli disattivati) per l'admin
                ArrayList<Prodotto> prodotti = prodottoDAO.trovaTuttiAdmin();
                request.setAttribute("prodotti", prodotti);
                request.getRequestDispatcher("/WEB-INF/view/admin/catalogo_lista.jsp").forward(request, response);
            
            } else if (action.equals("delete")) {
                // Esegue la disattivazione logica del prodotto
                int id = Integer.parseInt(request.getParameter("id"));
                prodottoDAO.doDelete(id);
                response.sendRedirect(request.getContextPath() + "/AdminCatalogoServlet?action=list");
            
            } else if (action.equals("edit") || action.equals("new")) {
                // Smista l'apertura del form per inserire o per modificare
                if (action.equals("edit")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Prodotto p = prodottoDAO.getProdottoById(id);
                    request.setAttribute("prodotto", p);
                }
                request.getRequestDispatcher("/WEB-INF/view/admin/catalogo_form.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/AdminDashboardServlet");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        
        // Recupero campi dal form sottomesso
        String idStr = request.getParameter("id");
        String nome = request.getParameter("nome");
        String descrizione = request.getParameter("descrizione");
        double prezzo = Double.parseDouble(request.getParameter("prezzo"));
        String immagine = request.getParameter("immagine");
        int quantita = Integer.parseInt(request.getParameter("quantita"));

        Prodotto p = new Prodotto();
        p.setNome(nome);
        p.setDescrizione(descrizione);
        p.setPrezzo(prezzo);
        p.setImmagine(immagine);
        p.setQuantita(quantita);

        try {
            if (idStr == null || idStr.trim().isEmpty()) {
                // Se non c'è l'ID, stiamo inserendo una nuova riga
                prodottoDAO.doSave(p); 
            } else {
                // Altrimenti stiamo modificando un record esistente
                p.setId(Integer.parseInt(idStr));
                prodottoDAO.doUpdate(p); 
            }
            response.sendRedirect(request.getContextPath() + "/AdminCatalogoServlet?action=list");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errore", "Impossibile completare l'operazione sul prodotto.");
            request.setAttribute("prodotto", p);
            request.getRequestDispatcher("/WEB-INF/view/admin/catalogo_form.jsp").forward(request, response);
        }
    }
}