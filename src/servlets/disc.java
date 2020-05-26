package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class disc
 */
@WebServlet("/disc")
public class disc extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses=request.getSession();
		if(ses.getAttribute("user")!=null) {
			ses.removeAttribute("user");
			if(ses.getAttribute("panier")!=null) {
				ses.removeAttribute("panier");
			}
			response.sendRedirect("Acceuil.jsp");
		}
	}

	

}
