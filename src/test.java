

import java.rmi.RemoteException;
import java.util.List;

import javax.xml.rpc.ServiceException;

import DbInteraction.Demandes;
import DbInteraction.DemandesService;
import DbInteraction.DemandesServiceLocator;
import DbInteraction.Livre;



public class test {

	public static void main(String[] args) throws RemoteException {
		
		DemandesService de=new DemandesServiceLocator();
		
		try {
			Demandes d=de.getdemandesPort();
			Livre[] l=d.afficheAll();
			
			for(Livre i:l) {
				System.out.println(i.getAuteur());
			}
			
			
			
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
