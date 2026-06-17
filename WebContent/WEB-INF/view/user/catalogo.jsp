<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it">

<head>
<meta charset="UTF-8">
<title>Catalogo - Fiorista Maria</title>

<link rel="stylesheet" 
href="${pageContext.request.contextPath}/styles/style1.css">

</head>

<body>

<jsp:include page="/WEB-INF/view/common/header.jsp"/>


<section class="sezione">

<h1>Il nostro catalogo</h1>

<p>
Scegli tra bouquet, rose, piante e composizioni floreali
per ogni occasione.
</p>


<div class="filtri">

<input 
type="text" 
placeholder="Cerca un prodotto...">


<select>
<option>Tutte le categorie</option>
<option>Bouquet</option>
<option>Rose</option>
<option>Piante</option>
<option>Laurea</option>
<option>Anniversario</option>
</select>

</div>



<div class="prodotti">


<div class="card">

<img src="${pageContext.request.contextPath}/images/image.jpg">

<h3>Bouquet Primavera</h3>

<p>
Composizione colorata con fiori freschi di stagione.
</p>

<p class="prezzo">
€34,90
</p>


<a class="btn" href="#">
Dettagli
</a>


</div>



<div class="card">

<img src="${pageContext.request.contextPath}/images/image.jpg">

<h3>Rose Rosse Deluxe</h3>

<p>
Elegante mazzo di rose rosse per occasioni romantiche.
</p>

<p class="prezzo">
€49,90
</p>


<a class="btn" href="#">
Dettagli
</a>


</div>



<div class="card">

<img src="${pageContext.request.contextPath}/images/image.jpg">

<h3>Orchidea Bianca</h3>

<p>
Pianta ornamentale elegante da interno.
</p>

<p class="prezzo">
€29,90
</p>


<a class="btn" href="#">
Dettagli
</a>


</div>


</div>


</section>


<jsp:include page="/WEB-INF/view/common/footer.jsp"/>


</body>

</html>