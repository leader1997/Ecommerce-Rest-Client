<%@page import="wspub.Panier"%>
<%@page import="DbInteraction.*"%>
<%@page import="wspub.Livre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="wspub.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>

<!--<link rel="stylesheet" href="bootstrap/bootrsi-min.css">-->
 <link rel="stylesheet" href="style/style.css">
	<!-- bootstrap link-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!--icon -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
</head>
<body>


		<nav class="navbar navbar-expand-lg navbar-dark bg-dark sb-navbar">
			<div class="container">
				  <a class="navbar-brand" href="Acceuil.jsp">BookMarket</a>
				  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
				  </button>

				  <div class="input-group" style="margin-left:150px;">
						<form action="search.jsp" method="get">
						<table>
							<tr>
								<td><input type="text" class="form-control" placeholder="rechercher un livre" name="recherche"></td>
								<td> <input type="submit" value="search" class="btn btn-primary"></td>
							<tr>
						</table>
							 
							
						</form>
           
            </div>	
            <% 
            
            HttpSession ses=request.getSession();
            if(ses.getAttribute("user")==null){%>
            		<a href="#" role="button" data-toggle="modal" data-target="#panier" class="btn btn-bd-inscrire mx-1">Panier</a>
				    <a href="#" role="button" data-toggle="modal" data-target="#identifier" class="btn btn-bd-inscrire mx-1">S'authentifier</a>
				    <a href="#" role="button" data-toggle="modal" data-target="#inscription" class="btn btn-bd-inscrire mx-1">S'inscrire</a>				  
			<%}else{
				Client c1=(Client)ses.getAttribute("user");
				String nom=(c1.getNom());
				System.out.println("header :"+c1.toString()); %>
				<a href="#" role="button" data-toggle="modal" data-target="#panier" class="btn btn-bd-inscrire mx-1">Panier</a>
				<a href="#"><button type="button" class="btn btn-success btn-md" style="margin-right: 5px;"><%=nom %></button></a>
				<a href="./disc"><button type="button" class="btn btn-danger btn-md">Logout</button></a>
			<%} %>
					
			</div>
		</nav>


<!-- Modal s'inscrire -->
<div class="modal fade" id="inscription" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">S'identifier</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
      	 <form action="./insc" method="post" accept-charset="utf-8" class="form" role="form">
                    <div class="row">
                        <div class="col-xs-6 col-md-6">
                            <input type="text" name="nom" value="" class="form-control input-lg" placeholder="nom"/>
                        </div>
                        <div class="col-xs-6 col-md-6">
                            <input type="text" name="prenom" value="" class="form-control input-lg" placeholder="prénom"/>
                        </div>
                    </div>
                    <br>
                    <input type="text" name="email" value="" class="form-control input-lg" placeholder="Email"/>
                	<br>
                    <input type="password" name="pwd" value="" class="form-control input-lg" placeholder="Mot de passe"/>
                    <br>
                    
                    <input type="text" name="adresse" value="" class="form-control input-lg" placeholder="adresse"/>
                    <br>
                    
                    <input type="text" name="cb" value="" class="form-control input-lg" placeholder="code bancaire"/>
                    <br>
                                   
             <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <input type="submit" class="btn btn-primary" value="Créer un compte">
      		</div>         
         </form>    
    </div>
  </div>
</div>
</div>
<%if(request.getParameter("ec")!=null){
						String msg=request.getParameter("ec");
                            	if(msg.equals("1")){%>
                            <div style="margin-bottom: 5px;width:100%;" class="input-group">
                            	<div class="alert alert-danger alert-dismissible" style="width:100%;">
  									<strong>Attention!</strong>mot de passe ou email invalide
												</div>
							</div>
							<% }if(msg.equals("3")){%>
                            <div style="margin-bottom: 5px;width:100%;" class="input-group">
                            	<div class="alert alert-danger alert-dismissible" style="width:100%;">
  									<strong>Attention!</strong>Email ou code bancaire invalide déja existant !!
												</div>
							</div>
                            <!--</div>-->
                            <% }
                            	if(msg.equals("0")){
                            		HttpSession ses1=request.getSession();
                            		Client c1=(Client)(ses1.getAttribute("user"));
                            		%>
                            <div style="margin-bottom: 5px" class="input-group" style="width:100%">
                            	<div class="alert alert-success alert-dismissible" style="width:100%;">
  									<strong>Soyez le Bienvenue  ! <%=c1.getNom() %></strong>
								</div>
  									
							</div>
							</div>
                            <!--</div>-->
                 
                            <% }}%>
<!-- Panier  -->

<div class="modal fade" id="panier" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" width="70%">
  <div class="modal-dialog" role="document" width="70%">
    <div class="modal-content overflow-auto" width="70%">
      <div class="modal-header" width="70%">
        <table><tr><td></table><h5 style="margin-right:40px;" class="modal-title" id="exampleModalLabel">Mon panier</h5></td><td ><a href="monPanier.jsp"><button class="btn btn-success">Aller_au_panier</button></a></td></tr></table>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	      <table class="table table-striped">
    <thead>
    <% int sum=0;
    if(ses.getAttribute("panier")!=null){
  		ArrayList<Panier> A1=(ArrayList<Panier>)(ses.getAttribute("panier"));
  		
  		for(Panier p :A1){
  			sum+=p.getLivre().getPrix()*p.getQte();
  		}
    }
  		%>															
  		
      <tr width="100%"><td>Total :</td><td style="padding-right: 60px;"> <strong><%=sum %>   </strong> DH  </strong></td><td><a <% if(ses.getAttribute("user")!=null){%>href="./paiement"<% }else{%> href="#" role="button" data-toggle="modal" data-target="#identifier" class="btn btn-bd-inscrire mx-1"><%}%><button type="button" class="btn btn-danger btn-md" >payer </button></a></td></tr>
      <tr>
        <th>Livre</th>
        <th>quantité</th>
        <th >Prix</th>
        <th>Decouvrir</th>
        <th>Supprimer</th>
      </tr>
    </thead>
    <tbody>
    
     <%
     if(ses.getAttribute("panier")!=null){
  		ArrayList<Panier> A2=(ArrayList<Panier>)(ses.getAttribute("panier"));
     if(A2.size()!=0){
    	 for(Panier i:A2){
     %>
      <tr>
      	<td><img src="<%=i.getLivre().getImage()%>" height="50px" width="30px"></td>
        <td><%=i.getQte()%></td>
        <td width="60px"><%=i.getLivre().getPrix()%> Dh</td>
        <td><a href="descProd.jsp?id=<%=i.getLivre().getId()%>"><button class="btn btn-success">decouvrir</button></a></td>
        <%if(ses.getAttribute("user")!=null){ %><td><a href="./suPanier?idp=<%=i.getIdp()%>"><button class="btn btn-danger">supprimer</button></td><%}
        else{
        %><td><a href="./suPanier?idl=<%=i.getLivre().getId()%>"><button class="btn btn-danger">supprimer</button></a></td><%} %>
      </tr>
     <%}}} %>
    </tbody>
  </table>
	  </div> 
    </div>
  </div>
</div>


<!-- modal identifier -->

<!-- Modal S'identifier -->
<div class="modal fade" id="identifier" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">S'identifier</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	      <form action="./auth" method="post" accept-charset="utf-8" class="form" role="form">        
                            <div style="margin-bottom: 5px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control" name="email" value="" placeholder="Email" required>                                        
                                    </div>      
                            <div style="margin-bottom: 5px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control" name="pwd" placeholder="Mot de passe" pattern="" required>
                                    </div>
                            <!--  <div style="margin-bottom: 5px" class="input-group">-->
                           
                            <div class="input-group">
                                      
                                    </div>
                                <div style="margin-top:1px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                      <input type="submit" id="btn-login" class="btn btn-success" value="se connecter">
                                    </div>
                                </div>
         
                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:5px; font-size:85%" >
                                            Vous n'avez pas un compte
                                        <a href="#" data-dismiss="modal" data-toggle="modal" data-target="#inscription">
                                            S'inscrire
                                        </a>
                                        </div>
                                    </div>
                                </div>    
                            </form>
	  </div> 
    </div>
  </div>
</div>













</body>
</html>