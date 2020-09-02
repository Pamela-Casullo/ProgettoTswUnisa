<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
	

	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
	<script type="text/javascript" src="script/login.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.6, shrink-to-fit=no">
	
	<meta name="description" content="layout template responsive">
	<meta name="author" content="Paolo Apostolico, Pamela Casullo, Giulio Triggiani">
	 
	 <link rel="stylesheet" href="css/default.css">
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
</head>
<body>

<!--  SIDEBAR -->
<nav id=nav class="navbar navbar-expand-lg navbar-dark">

<%System.out.println(request.getSession().getAttribute("email"));
if(request.getSession().getAttribute("email")!=null && request.getSession().getAttribute("email").equals("admin@admin.com")) { %>

  <a class="navbar-brand" href="index_administrator.jsp">
  <img id=logo alt="logo_azienda" src="./images/LogoGif.gif" width="60" style="	border-radius: 70%;border-width: none;">
  
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="index_administrator.jsp">PANNELLO DI CONTROLLO <span class="sr-only">(current)</span></a>
      </li>
 
      <li class="nav-item">
        <a class="nav-link" href="gestioneArticoli.jsp">Gestione Articoli</a>
      </li>
      <li>
      <a class="nav-link" href="gestioneShop.jsp">Gestione Shop</a>
      </li>
      <li>
      <a class="nav-link" href="gestioneUtenti.jsp">Gestione Utenti</a>
      </li>
   
    </ul>
      
   <%} else { System.out.println("nonfunziono"); %>
 	<a class="navbar-brand" href="Homepage.jsp">
  <img id=logo alt="logo_azienda" src="./images/LogoGif.gif" width="60" style="	border-radius: 70%;border-width: none;">
  
  </a>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">

    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="Homepage.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li>
      <a class="nav-link" href="Article.jsp">Articoli</a>
      </li>
      <li>
      <a class="nav-link" href="about.jsp">About</a>
      </li>
      <li>
      <a class="nav-link" href="shop.jsp">Shop</a>
      </li>
    </ul>
     <% } %>
 <%if(request.getSession().getAttribute("email")==null){ %> 
    <form class="form-inline my-2 my-lg-0">
    
    <ul class="navbar-nav mr-auto">
    <li> 
    <span><a class="nav-link" href="signup.jsp"><u> Sign-up</u></a></span>
    
    <li>
    
   <button class="btn btn-dark"> <a class="nav-link" href="login.jsp">Login</a> </button>
    </ul>
    </form>
    </div>
    </div>

    <% } else { %>
    <nav id=nav class="navbar navbar-expand-lg navbar-dark">
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
	 <li class="nav-item">
		<p style="color:orange;">Benvenuto, <%=request.getSession().getAttribute("email") %>
		<a href="<%=request.getContextPath()%>/Logout">Logout</a>
	</li> 
    </ul>
      </div>

 <% } %>
</nav>
</nav>   


		<footer>
		<span>APOSTOLICO PAOLO, 
		CASULLO PAMELA, 
		TRIGGIANI GIULIO. 
		Diritti ai rispettivi proprietari©</span>
		</footer>
	
</body>
</body>
</html>


