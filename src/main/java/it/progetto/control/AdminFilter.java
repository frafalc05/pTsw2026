package it.progetto.control;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import it.progetto.model.Utente;

// Questo filtro si attiva su qualsiasi servlet o pagina che inizia con "Admin"
@WebFilter(urlPatterns = {"/AdminDashboardServlet", "/AdminCatalogoServlet", "/WEB-INF/view/admin/*"})
public class AdminFilter extends HttpFilter implements Filter {
       
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        HttpSession session = httpRequest.getSession(false);
        
        // Recuperiamo l'utente loggato dalla sessione
        Utente utente = (session != null) ? (Utente) session.getAttribute("utente") : null;
        
        // Controllo di sicurezza: se l'utente non c'è OPPURE non è un admin
        if (utente == null || ! "admin".equals(utente.getRuolo())) {
            // Lo reindirizziamo alla pagina di login del sito
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/LoginServlet");
        } else {
            // L'utente è l'amministratore! Può proseguire verso la pagina richiesta
            chain.doFilter(request, response);
        }
    }

    public void init(FilterConfig fConfig) throws ServletException {}
    public void destroy() {}
}