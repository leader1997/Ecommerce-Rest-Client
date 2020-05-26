package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DbInteraction.demandes;
import wspub.*;


/**
 * Servlet implementation class addPanier
 */

@WebServlet("/addPanier")
public class addPanier extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses=request.getSession();
		demandes d=new demandes();
		int idL=Integer.parseInt(request.getParameter("id"));
		int qte =Integer.parseInt(request.getParameter("qte"));
		String res=request.getParameter("res");
		
		if(ses.getAttribute("panier")!=null) {
			if(ses.getAttribute("user")!=null) {
				ArrayList<Panier> A=(ArrayList<Panier>)ses.getAttribute("panier");
				try {
					
					int idc=((Client)ses.getAttribute("user")).getId();
							int isInsered=d.ajouterP(idc, idL,qte);
							if(isInsered!=0) {
								Livre l=d.selectLivreId(idL);
								Panier p=new Panier(isInsered,l,qte);
								A.add(p);
								ses.setAttribute("panier", A);
								response.sendRedirect("descProd.jsp?id="+idL+"&ec=11");
							}else {
								response.sendRedirect("descProd.jsp?id="+idL+"&ec=12");
							}
					} catch (Exception e) {
					response.sendRedirect("descProd.jsp?id="+idL+"&ec=12");
					}
				
				
				
			}else {
				ArrayList<Panier> A=(ArrayList<Panier>)ses.getAttribute("panier");
				try {
					Livre l=d.selectLivreId(idL);
					Panier p=new Panier(l,qte);
					A.add(p);
					ses.setAttribute("panier", A);
					response.sendRedirect("descProd.jsp?id="+idL+"&ec=11");
				} catch (Exception e) {
					response.sendRedirect("descProd.jsp?id="+idL+"&ec=12");
					}
			}
		}else {
			if(ses.getAttribute("user")!=null) {
				ArrayList<Panier> A=new ArrayList<Panier>();
				try {
					
					
					int idc=((Client)ses.getAttribute("user")).getId();
					int isInsered=d.ajouterP(idc,idL,qte);
							if(isInsered!=0) {
								Livre l=d.selectLivreId(idL);
								Panier p=new Panier(isInsered,l,qte);
									p.setIdp(isInsered);
									p.setLivre(l);
									p.setQte(qte);
								A.add(p);
								ses.setAttribute("panier", A);
								response.sendRedirect("descProd.jsp?id="+idL+"&ec=11");
							}else {
								response.sendRedirect("descProd.jsp?id="+idL+"&ec=12");
							}
					} catch (Exception e) {
					response.sendRedirect("descProd.jsp?id="+idL+"&ec=12");
					}
				
				
				
			}else {
				ArrayList<Panier> A=new ArrayList<Panier>();
				try {
					Livre l=d.selectLivreId(idL);
					Panier p=new Panier(l,qte);
					A.add(p);
					ses.setAttribute("panier", A);
					response.sendRedirect("descProd.jsp?id="+idL+"&ec=11");
				} catch (Exception e) {
					response.sendRedirect("descProd.jsp?id="+idL+"&ec=12");
					}
		}
	}
	}}
