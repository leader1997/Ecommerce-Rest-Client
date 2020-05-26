<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



      <div class="modal-body">
      	      <table class="table table-striped">
    <thead>
    <% int sum1=0;
    if(ses.getAttribute("panier")!=null){
  		ArrayList<Panier> A2=(ArrayList<Panier>)(ses.getAttribute("panier"));
  		
  		for(Panier p :A2){
  			sum1+=p.getLivre().getPrix()*p.getQte();
  		}
    }
  		%>															
  		
      <tr width="100%"><td>Total :</td><td style="padding-right: 60px;"> <strong><%=sum %></td><td></strong> DH  </strong></td><td><a <% if(ses.getAttribute("user")!=null){%>href="./paiement"<% }else{%> href="#" role="button" data-toggle="modal" data-target="#identifier" class="btn btn-bd-inscrire mx-1"><%}%><button type="button" class="btn btn-danger btn-md" >payer </button></a></td></tr>
      <tr>
        <th>Livre</th>
        <th>titre</th>
        <th>quantité</th>
        <th width="60px">Prix</th>
        <th>Decouvrir</th>
        <th>Supprimer</th>
      </tr>
    </thead>
    <tbody>
    
     <%
     if(ses.getAttribute("panier")!=null){
  		ArrayList<Panier> A3=(ArrayList<Panier>)(ses.getAttribute("panier"));
     if(A3.size()!=0){
    	 for(Panier i:A3){
     %>
      <tr>
      	<td><img src="<%=i.getLivre().getImage()%>" height="50px" width="30px"></td>
        <td><%=i.getLivre().getNom()%> </td>
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

</body>
</html>