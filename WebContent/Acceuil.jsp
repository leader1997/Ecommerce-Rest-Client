<%@page import="wspub.Livre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DbInteraction.*"%>
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
<!--  -->
 			<%
	demandes d=new demandes();
	ArrayList<Livre> A=d.affichAll(); 
	int k=0;%>
	<div class="container-fluid">
		<div class="row" style="margin-top:15px;">
	<% for(Livre l :A){
		%>		
		<div class="col-md-3">
		
		
			
			
				<a href="descProd.jsp?id=<%=l.getId()%>""><img src="<%=l.getImage() %>" class="livres" height="340px" width="245px"></a>
				<table style="margin-buttom:20px;" >
				
					<tr>
						<td>
							<a   href="descProd.jsp?id=<%=l.getId()%>"><button type="button" class="btn btn-warning" style="width:100%;">  Découvrir  </button></a>
						</td>
						<td>
						<a   href="./addPanier?id=<%=l.getId()%>&res=ac&qte=1"><button type="button" class="btn btn-success" style="width:100%;">  Ajouter_au_panier   </button></a>
						</td>
					</tr>
				</table>
				<br>
			</div>
			
		
		<% }%>
		</div></div>
			

</body>
</html>