<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>${empty prodotto ? 'Nuovo Prodotto' : 'Modifica Prodotto'} - Admin</title>
    
    <%-- Collegamento ai fogli di stile esterni --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/ordine.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/admin.css">
</head>
<body>

    <%-- Include l'header globale --%>
    <jsp:include page="/WEB-INF/view/common/header.jsp" />

    <div class="ordini-container" style="max-width: 600px; margin-top: 40px;">
        <h2 class="ordini-titolo">${empty prodotto ? 'Aggiungi Nuovo Prodotto' : 'Modifica Prodotto'}</h2>
        
        <c:if test="${not empty errore}">
            <div style="background-color: #f8d7da; color: #721c24; padding: 10px; border-radius: 4px; margin-bottom: 20px;">
                ${errore}
            </div>
        </c:if>

        <div class="form-container">
            <form action="${pageContext.request.contextPath}/AdminCatalogoServlet" method="POST">
                
                <%-- Campo ID nascosto: valorizzato solo se stiamo modificando un prodotto esistente --%>
                <input type="hidden" name="id" value="${prodotto.id}">

                <div class="form-group">
                    <label for="nome">Nome del Fiore / Composizione</label>
                    <input type="text" id="nome" name="nome" value="${prodotto.nome}" class="form-control" required placeholder="Es. Bouquet di Tulipani Rosa">
                </div>

                <div class="form-group">
                    <label for="descrizione">Descrizione Dettagliata</label>
                    <textarea id="descrizione" name="descrizione" class="form-control" rows="4" required placeholder="Inserisci i dettagli ed i fiori utilizzati...">${prodotto.descrizione}</textarea>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="prezzo">Prezzo (€)</label>
                        <input type="number" id="prezzo" name="prezzo" step="0.01" value="${prodotto.prezzo}" class="form-control" required placeholder="0.00">
                    </div>
                    
                    <div class="form-group">
                        <label for="quantita">Quantità Stock Magazzino</label>
                        <input type="number" id="quantita" name="quantita" value="${empty prodotto ? 10 : prodotto.quantita}" class="form-control" required min="0">
                    </div>
                </div>

                <div class="form-group">
                    <label for="immagine">Nome File Immagine</label>
                    <input type="text" id="immagine" name="immagine" value="${empty prodotto.immagine ? 'default.png' : prodotto.immagine}" class="form-control" required placeholder="Es. tulipani.png">
                </div>

                <div class="actions-row">
                    <a href="${pageContext.request.contextPath}/AdminCatalogoServlet?action=list" class="btn-link" style="margin: 0; padding: 10px 20px;">Annulla</a>
                    <button type="submit" class="btn-save">${empty prodotto ? 'Inserisci Prodotto' : 'Salva Modifiche'}</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>