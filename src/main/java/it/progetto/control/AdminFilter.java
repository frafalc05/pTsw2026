package it.progetto.control;

import java.io.IOException;
import it.progetto.model.Utente;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// REQUISITO: Il filtro intercetta tutte le richieste dirette a url che iniziano con /admin/
@WebFilter("/admin/*")
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Metodo richiesto dall'interfaccia, si può lasciare vuoto
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        // 1. Recuperiamo la sessione (false = non crearne una nuova se non esiste)
        HttpSession session = httpRequest.getSession(false);
        
        // 2. Estraiamo l'oggetto utente e il ruolo salvati in sessione al momento del login
        Utente utente = (session != null) ? (Utente) session.getAttribute("utente") : null;
        String ruolo = (session != null) ? (String) session.getAttribute("ruolo") : null;

        // 3. CONTROLLO DEGLI ACCESSI (Requisito fondamentale del prof)
        if (utente == null || !"ADMIN".equalsIgnoreCase(ruolo)) {
            // Se l'utente non è loggato OPPURE non è un admin, blocchiamo la richiesta
            // Inviamo un errore 403 (Accesso Vietato)
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Accesso non autorizzato all'area amministrativa.");
            return; // Interrompe l'esecuzione: la richiesta NON arriverà mai alla servlet dell'admin
        }

        // 4. Se superi il controllo (sei l'admin), prosegui verso la risorsa richiesta
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Metodo richiesto dall'interfaccia, si può lasciare vuoto
    }
}