package wspub;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "Panier")
@XmlAccessorType(XmlAccessType.FIELD)

public class Panier implements Serializable{
	
	@Override
	public String toString() {
		return "Panier [idp=" + idp + ", Livre=" + Livre + ", qte=" + qte + "]";
	}

	private int idp;
	private Livre Livre;
	private int qte;
	
	public Panier(int idp, Livre livre, int qte) {
		super();
		this.idp = idp;
		Livre = livre;
		this.qte = qte;
	}
	public Panier(Livre livre, int qte) {
		
		Livre = livre;
		this.qte = qte;
	}

	public int getQte() {
		return qte;
	}

	public void setQte(int qte) {
		this.qte = qte;
	}

	public Panier() {
		
	}
	
	public Panier(int idp, Livre livre) {
		super();
		this.idp = idp;
		Livre = livre;
	}

	public int getIdp() {
		return idp;
	}

	public void setIdp(int idp) {
		this.idp = idp;
	}

	public Livre getLivre() {
		return Livre;
	}

	public void setLivre(Livre livre) {
		Livre = livre;
	}
	
	
	
	
	
}
