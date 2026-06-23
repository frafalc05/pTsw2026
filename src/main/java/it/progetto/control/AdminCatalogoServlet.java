package it.progetto.control;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

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
                    Prodotto prodotto = prodottoDAO.doRetrieveById(idModifica);
                    request.setAttribute("prodotto", prodotto);
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
        String categoria = request.getParameter("categoria");
        String attivoStr = request.getParameter("attivo");

        double prezzo = (prezzoStr != null && !prezzoStr.trim().isEmpty()) ? Double.parseDouble(prezzoStr) : 0.0;
        int quantita = (quantitaStr != null && !quantitaStr.trim().isEmpty()) ? Integer.parseInt(quantitaStr) : 0;
        boolean attivo = "true".equals(attivoStr);

        Prodotto p = new Prodotto();

        p.setNome(nome);
        p.setDescrizione(descrizione);
        p.setPrezzo(prezzo);
        p.setQuantita(quantita);
        p.setCategoria(categoria);
        p.setAttivo(attivo);

        try {
            Part filePart = request.getPart("immagine");

            if (filePart != null && filePart.getSize() > 0) {
                String nomeOriginale = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String estensione = "";

                int punto = nomeOriginale.lastIndexOf(".");
                if (punto >= 0) {
                    estensione = nomeOriginale.substring(punto);
                }

                String nomeFile = UUID.randomUUID().toString() + estensione;
                String sottoCartella = creaNomeCartella(categoria);

                String percorsoImages = request.getServletContext().getRealPath("/images");

                if (percorsoImages == null) {
                    throw new ServletException("Percorso images non disponibile");
                }

                Path cartellaUpload = Paths.get(percorsoImages, sottoCartella);
                Files.createDirectories(cartellaUpload);

                Path fileDestinazione = cartellaUpload.resolve(nomeFile);

                Files.copy(filePart.getInputStream(), fileDestinazione, StandardCopyOption.REPLACE_EXISTING);

                p.setImmagine(sottoCartella + "/" + nomeFile);

            } else if (idStr != null && !idStr.trim().isEmpty()) {
                Prodotto vecchioProdotto = prodottoDAO.doRetrieveById(Integer.parseInt(idStr));

                if (vecchioProdotto != null) {
                    p.setImmagine(vecchioProdotto.getImmagine());
                }
            } else {
                p.setImmagine("");
            }
        } catch (Exception e) {
            throw new ServletException(e);
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

    private String creaNomeCartella(String categoria) {
        if (categoria == null || categoria.trim().isEmpty()) {
            return "prodotti";
        }

        String valore = categoria.toLowerCase().trim();

        valore = valore.replace("à", "a");
        valore = valore.replace("è", "e");
        valore = valore.replace("é", "e");
        valore = valore.replace("ì", "i");
        valore = valore.replace("ò", "o");
        valore = valore.replace("ù", "u");

        valore = valore.replaceAll("[^a-z0-9]", "");

        if (valore.isEmpty()) {
            return "prodotti";
        }

        return valore;
    }
}