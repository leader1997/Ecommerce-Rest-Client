package DbInteraction;

import java.util.ArrayList;
import java.util.List;
import wspub.*;


import javax.ws.rs.*;
import javax.ws.rs.client.*;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;




public class demandes {
	
	static String url = "http://localhost:8089/Rest_Service/";
	static javax.ws.rs.client.Client client = ClientBuilder.newClient();
	static WebTarget target = client.target(url);
	
//=============================== affiche All ===========================
	public ArrayList<Livre> affichAll(){
		List<Livre> L = client.target(url).path("demandes/afficheAll").request(MediaType.APPLICATION_JSON).get(Response.class).readEntity(new GenericType<List<Livre>>() {});
		
		
		ArrayList<Livre> A=new ArrayList<Livre>();
		
		for(Livre i : L) {
			A.add(i);
		}
		return A;
	}
//============================ getRec ===================================
	public ArrayList<Livre> getRec(String M){
				
		List<Livre> L = client.target(url).path("demandes/getRec/"+M).request(MediaType.APPLICATION_JSON).get(Response.class).readEntity(new GenericType<List<Livre>>() {});
		
		
		ArrayList<Livre> A=new ArrayList<Livre>();
		
		for(Livre i : L) {
			A.add(i);
		}
		return A;
	}
//=========================================================================================	
	public int selectDernierPanier() {
		return target.path("demandes/selectDernierPanier").request(MediaType.APPLICATION_JSON).get(int.class);
		
	}
//=========================================================================================	
	public int editLivre(Livre l) {
				
		return target.path("demandes/editLivre/"+l).request(MediaType.APPLICATION_JSON).get(int.class);
	}
//=========================================================================================
	public wspub.Client recClient(String email,String password) {
				
		return target.path("demandes/recClient/"+email+"/"+password).request(MediaType.APPLICATION_JSON).get(wspub.Client.class);
	}
//==========================================================================================	
	 public Livre selectLivreId(int id) {
		 		 
		 return target.path("demandes/selectLivreId/" +id).request(MediaType.APPLICATION_JSON).get(Livre.class);
			
	 }
//=========================================================================================	 
	 public int ajouterLivre(Livre l) {
		
		 return target.path("demandes/ajouterLivre/" +l).request(MediaType.APPLICATION_JSON).get(int.class);
	 }
//=================================================================================	
	 public void supprimerLivre( int id) {
		
		 target.path("demandes/supprimerLivre"+id).request().post(Entity.entity(int.class, MediaType.APPLICATION_JSON));	
	 }
//=================================================================================	 
	 public int ajouterP(int idc,int idl,int qte) {
		
		 return target.path("demandes/ajouterP"+idc+"/"+idl+"/"+qte).request(MediaType.APPLICATION_JSON).get(int.class);
		
	 }
//================================================================================	
	 public boolean ClientNewCompte(wspub.Client c) {
					
		 return target.path("demandes/ClientNewCompte/"+c).request(MediaType.APPLICATION_JSON).get(boolean.class);	
	 }
//================================= verif email ======================================
	 public int verifEmail(String email) {
				
		 return target.path("demandes/verifEmail/" +email).request(MediaType.APPLICATION_JSON).get(int.class);
	 }
//================================= selectLivreC ====================================	
	 public ArrayList<Panier> selectLivreC(int idc){
		
		 List<Panier> P = client.target(url).path("demandes/selectLivreC/"+idc).request(MediaType.APPLICATION_JSON).get(Response.class).readEntity(new GenericType<List<Panier>>() {});
			
		
		ArrayList<Panier> A=new ArrayList<Panier>();
		
		for(Panier i : P) {
			A.add(i);
		}
		return A;
	 }
//========================================= verifCB =================================
	 public boolean verifCB(int cb) {
		
		 return target.path("demandes/"+cb).request(MediaType.APPLICATION_JSON).get(boolean.class);
	 }

	
	
}
