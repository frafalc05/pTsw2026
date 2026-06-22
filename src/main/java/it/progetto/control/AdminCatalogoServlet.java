package it.progetto.control;

import java.io.File;
import java.io.IOException;
import java.util.List;
import it.progetto.dao.ProdottoDAO;
import it.progetto.model.Prodotto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/admin/catalogo")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  
    maxFileSize = 1024 * 1024 * 10,       
    maxRequestSize = 1024 * 1024 * 50    
)
public class AdminCatalogoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ProdottoDAO prodottoDAO = new ProdottoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "new":
                    request.getRequestDispatcher("/WEB-INF/view/admin/catalogo_form.jsp").forward(request, response);
                    break;
                    
                case "edit":
                    int idModifica = Integer.parseInt(request.getParameter("id"));
                    Prodotto p = prodottoDAO.doRetrieveById(idModifica);
                    request.setAttribute("prodotto", p);
                    request.getRequestDispatcher("/WEB-INF/view/admin/catalogo_form.jsp").forward(request, response);
                    break;
                    
                case "delete":
                    int idCancella = Integer.parseInt(request.getParameter("id"));
                    prodottoDAO.doDelete(idCancella);
                    response.sendRedirect(request.getContextPath() + "/admin/catalogo?action=list");
                    break;
                    
                default:
                    List<Prodotto> catalogo = prodottoDAO.doRetrieveAll();
                    request.setAttribute("catalogo", catalogo);
                    request.getRequestDispatcher("/WEB-INF/view/admin/catalogo_lista.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("id");
        String nome = request.getParameter("nome");
        String descrizione = request.getParameter("descrizione");
        String prezzoStr = request.getParameter("prezzo");
        String quantitaStr = request.getParameter("quantita");
        
        double prezzo = (prezzoStr != null && !prezzoStr.isEmpty()) ? Double.parseDouble(prezzoStr) : 0.0;
        int quantita = (quantitaStr != null && !quantitaStr.isEmpty()) ? Integer.parseInt(quantitaStr) : 0;
        
        Prodotto p = new Prodotto();
        p.setNome(nome);
        p.setDescrizione(descrizione);
        p.setPrezzo(prezzo);
        p.setQuantita(quantita);

        try {
            Part filePart = request.getPart("immagine"); 
            if (filePart != null && filePart.getSize() > 0) {
                String nomeFile = filePart.getSubmittedFileName();
                p.setImmagine(nomeFile); 
                
                String appPath = request.getServletContext().getRealPath("");
                String uploadPath = appPath + File.separator + "images";
                
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                
                filePart.write(uploadPath + File.separator + nomeFile);
            } else if (idStr != null && !idStr.trim().isEmpty()) {
                
                Prodotto vecchioProdotto = prodottoDAO.doRetrieveById(Integer.parseInt(idStr));
                if (vecchioProdotto != null) {
                    p.setImmagine(vecchioProdotto.getImmagine());
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }

        try {
            if (idStr == null || idStr.trim().isEmpty()) {
         
                prodottoDAO.doSave(p);
            } else {
                p.setId(Integer.parseInt(idStr));
                prodottoDAO.doUpdate(p);
            }
           response.sendRedirect(request.getContextPath() + "/admin/catalogo?action=list");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}