<%@page import="wspub.Livre"%>
<%@page import="DbInteraction.demandes"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>

<% 
   int id=Integer.parseInt(request.getParameter("id")); 
   demandes d1=new demandes();
   Livre l=d1.selectLivreId(id);
%>
<table width="100%" border="1px solid black">
<tr>
			<td><img src="<%=l.getImage()%>" height="400" width="250" align="center">
			<td style="padding-left:30px;">
			<table width="100%">
				<tr>
					<td>
						<P><b>NOM    	   :</b></P>
					</td>
					<td>
						<%=l.getNom() %>
					</td>
				</tr>
				<tr>
					<td>
						<p><b>AUTEUR    	   :</b></p>
					</td>
					<td>
						<%=l.getAuteur() %>
					</td>
				</tr>
				<tr>
					<td>
						<P><b>DESCRIPTION   	   :</b></P>
					</td>
					<td>
						<%=l.getDescription() %>
					</td>
				</tr>
				<tr>
					<td style="padding-top:20px;">
						<P><b>PRIX    	   :</b></P>
					</td>
					<td style="padding-top:20px;">
						<h3 color="red"><%=l.getPrix() %> DH</h3>
					</td>
				</tr>
				<tr>
				<% request.setAttribute("idLivre", l.getId());%>
				
					<td>
						<a href="./paiement" class="btn btn-primary" >terminer_l'achat</a>
					</td>
					<td>
					<form action="./addPanier" method="get">
					<input style="display:none;"type="text" name="id" value="<%=l.getId()%>" >
					<input type="range" list="tickmarks" min="1" max="10" name="qte">
					<input type="submit" class="btn btn-success" value="ajouter au panier">
					</form>
						
					</td>
				
					
				</tr>
				
				
			</table>
			</td></td>
			
</tr>
</table>
</body>
</html>