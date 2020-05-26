<%@page import="wspub.Livre"%>
<%@page import="java.util.ArrayList"%>
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
	demandes d= new demandes();
	String M=request.getParameter("recherche");
	
	ArrayList<Livre> A=d.getRec(M); 
	int k=0;
	if(A.size()==0){%>
	<div style="margin-bottom: 5px;width:100%;" class="input-group">
                            	<div class="alert alert-success " style="width:100%;">
  									<strong>Recherche sur :<%=M %></strong>  : <%=A.size()%> Resultat trouvé .
												</div>
							</div>
							<%} else{%>
	<div style="margin-bottom: 5px;width:100%;" class="input-group">
                            	<div class="alert alert-success " style="width:100%;">
  									<strong>Recherche sur :<%=M %></strong>  : " <%=A.size()%> " Resultat trouvé .
												</div>
							</div>					
			<%} %>
	
	<div class="container-fluid">
		<div class="row" style="margin-top:15px;">
	<% for(Livre l :A){
		%>		
		<div class="col-md-3">
		
		
			
			
				<a href="descProd.jsp?id=<%=l.getId()%>""><img src="<%=l.getImage() %>" class="livres" height="340px" width="245px"></a>
				<table style="margin-buttom:20px;" >
					<tr>
						<td>
							<a   href="descProd.jsp?id=<%=l.getId()%>""><button type="button" class="btn btn-warning" style="width:100%;">  Découvrir  </button></a>
						</td>
						<td>
						<a   href="descProd.jsp?id=<%=l.getId()%>""><button type="button" class="btn btn-success" style="width:100%;">  Ajouter____panier   </button></a>
						</td>
					</tr>
				</table>
				<br>
			</div>
			
		
		<% }%>
		</div></div>
</body>
</html>