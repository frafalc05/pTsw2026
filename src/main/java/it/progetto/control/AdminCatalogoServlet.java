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
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
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
                    // Mostra il form vuoto per un nuovo inserimento
                    request.getRequestDispatcher("/WEB-INF/view/admin/catalogo_form.jsp").forward(request, response);
                    break;
                    
                case "edit":
                    // Recupera il prodotto per ID e mostra il form precompilato
                    int idModifica = Integer.parseInt(request.getParameter("id"));
                    Prodotto p = prodottoDAO.doRetrieveById(idModifica);
                    request.setAttribute("prodotto", p);
                    request.getRequestDispatcher("/WEB-INF/view/admin/catalogo_form.jsp").forward(request, response);
                    break;
                    
                case "delete":
                    // Disattiva il prodotto (Cancellazione logica)
                    int idCancella = Integer.parseInt(request.getParameter("id"));
                    prodottoDAO.doDelete(idCancella);
                    response.sendRedirect(request.getContextPath() + "/admin/catalogo?action=list");
                    break;
                    
                default:
                    // Elenco completo di tutti gli elementi del catalogo attivi per l'admin
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
        
        // Forza la codifica UTF-8 per evitare problemi con lettere accentate
        request.setCharacterEncoding("UTF-8");

        // Recupero dei parametri inviati dal Form
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

        // --- GESTIONE E SALVATAGGIO FILE IMMAGINE ---
        try {
            Part filePart = request.getPart("immagine"); // Mappato sul name="immagine" del tag <input>
            if (filePart != null && filePart.getSize() > 0) {
                String nomeFile = filePart.getSubmittedFileName();
                p.setImmagine(nomeFile); // Imposta il nome del file nel database (es: rosa.jpg)
                
                // Individua il percorso reale della cartella root sul server locale di Tomcat
                String appPath = request.getServletContext().getRealPath("");
                String uploadPath = appPath + File.separator + "images";
                
                // Crea fisicamente la cartella /images sul server se non esiste
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                
                // Scrive il file binario dell'immagine nella cartella /images/ del server
                filePart.write(uploadPath + File.separator + nomeFile);
            } else if (idStr != null && !idStr.trim().isEmpty()) {
                // In fase di MODIFICA: se l'admin non carica una nuova foto, recupera e mantiene quella vecchia
                Prodotto vecchioProdotto = prodottoDAO.doRetrieveById(Integer.parseInt(idStr));
                if (vecchioProdotto != null) {
                    p.setImmagine(vecchioProdotto.getImmagine());
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Registra nei log del server eventuali anomalie di caricamento file
        }

        // --- PERSISTENZA SUL DATABASE ---
        try {
            if (idStr == null || idStr.trim().isEmpty()) {
                // Esegue l'inserimento con flag attivo=true automatico
                prodottoDAO.doSave(p);
            } else {
                // Aggiorna il prodotto esistente sul database
                p.setId(Integer.parseInt(idStr));
                prodottoDAO.doUpdate(p);
            }
            // Pattern Post-Redirect-Get per evitare reinvii accidentali dei dati ricaricando la pagina
            response.sendRedirect(request.getContextPath() + "/admin/catalogo?action=list");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}