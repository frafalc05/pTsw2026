package it.progetto.control;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/immagine-prodotto/*")
public class ImmagineProdottoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Path getCartellaUpload() {
        return Paths.get(System.getProperty("user.home"), "fiorista-maria", "uploads", "images");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/") || pathInfo.contains("..")) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String percorsoRelativo = pathInfo.substring(1);

        Path baseUpload = getCartellaUpload();
        Path fileUpload = baseUpload.resolve(percorsoRelativo).normalize();

        if (!fileUpload.startsWith(baseUpload.normalize())) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        if (Files.exists(fileUpload) && Files.isRegularFile(fileUpload)) {
            inviaFile(response, fileUpload);
            return;
        }

        String percorsoStatico = request.getServletContext().getRealPath("/images/" + percorsoRelativo);

        if (percorsoStatico != null) {
            Path fileStatico = Paths.get(percorsoStatico);

            if (Files.exists(fileStatico) && Files.isRegularFile(fileStatico)) {
                inviaFile(response, fileStatico);
                return;
            }
        }

        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    private void inviaFile(HttpServletResponse response, Path file) throws IOException {
        String contentType = Files.probeContentType(file);

        if (contentType == null) {
            contentType = "application/octet-stream";
        }

        response.setContentType(contentType);
        response.setContentLengthLong(Files.size(file));
        Files.copy(file, response.getOutputStream());
    }
}