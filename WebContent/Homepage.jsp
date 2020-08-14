<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
	<!-- SCRIPT TAG-->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>

	
	<!-- META TAG -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.6, shrink-to-fit=no">
	
	<meta name="description" content="layout template responsive">
	<meta name="author" content="Paolo Apostolico, Pamela Casullo, Giulio Triggiani">
	 <!--  LINK TAG -->
	<title>HomePage</title>
	<link rel="stylesheet" href="css/default.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" crossorigins=anomymous >
	<link rel="stylesheet" href="css/layout.css">
</head>
<body> 
<%@include file="header.jsp"%>
    <!-- LOGIN -->

    <div id=login>
    <form action ="<%=request.getContextPath()%>/Login" method="post">
  <div class="form-group">
    <label >Username</label>
    <input type="text" class="form-control" name="nome_utente" placeholder="nome utente" >
    <small id="emailHelp" class="form-text text-muted">Non condividere la password con nessuno</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="text" class="form-control" name="password_utente">
  </div>
  <div class="form-group"><label><a href="password.html">Password dimenticata?</a></label> </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" >
    <label class="form-check-label" >Mantienimi registrato</label>
  </div>
  <button type="submit" class="btn btn-primary">Accedi</button>
</form>
</div>
<!-- CAROSELLO IMMAGINI -->
<div class=article-preview>
<div class="container-sm">
  <div class="container left">
        <div class="title">
            <h3 class="mt-5">Articoli</h3>
        </div>
        
        <div class="section" id="carousel">
        <div class="container left">
            <div class="row">
                <div class="col-md-8 mr-auto ml-auto">
<!-- CAROSELLO -->
                    <div class="card card-raised card-carousel">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="3000">
                          <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1" class=""></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
                          </ol>
                          <div class="carousel-inner">
                            <div class="carousel-item active">
                               <img class="d-block w-100" src="https://media-cdn.tripadvisor.com/media/photo-s/12/28/ef/0f/getlstd-property-photo.jpg" alt="Third slide">
                              <div class="carousel-caption d-none d-md-block">
                                <h4>
                                   <span id="article-preview">
                                   <a href=article1.jsp><button class="btn btn-primary btn-lg"> LA NOSTRA LOBBY!!<br><br>
                                    Unitevi a noi e vivete l'esport a 360 gradi!</button></a> 
                                    </span> 
                                </h4>
                              </div>
                            </div>
                            <div class="carousel-item">
                              <img class="d-block w-100" src="https://esports.thegamesmachine.it/wp-content/uploads/2019/06/6-6-660x330.jpg"  alt="Second slide">
                              <div class="carousel-caption d-none d-md-block">
                                <h4>
                                    <span id="article-preview">
                                    <a href=article2.jsp><button class="btn btn-primary btn-lg">NUOVA STAGIONE E-SPORT PER I MAD DISCORD</button></a>
                                    </span>
                                </h4>
                              </div>
                            </div>
                            <div class="carousel-item">
                            	<img class="d-block w-100" src="https://esportsobserver.com/wp-content/uploads/2018/09/43859811844_acd3b01b76_k-e1536737361509.jpg" alt="First slide">
                              <div class="carousel-caption d-none d-md-block">
                                <h4>
                                    <span id="article-preview">
                                   <a href=article3.jsp><button class="btn btn-primary btn-lg">MOBA E-sports<br><br>
                                    INCREDIBILI PARTITE TI ASPETTANO!</button></a></span>
                                </h4>
                              </div>
                            </div>
                          </div>
                          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <i class="material-icons"><</i>
                            <span class="sr-only">Previous</span>
                          </a>
                          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <i class="material-icons"> > </i>
                            <span class="sr-only">Next</span>
                          </a>
                        </div>
                    </div>
                    <!-- FINE CAROSELLO-->

                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>

</body>
</html>