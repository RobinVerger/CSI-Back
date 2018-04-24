package co.simplon.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.simplon.dao.EnqueteDAO;
import co.simplon.model.DataEnquete;
import co.simplon.model.Enquete;

/**
 * 
 * @author Robin
 * cette classe permet de faire le lien entre EnqueteController et la DAO EnqueteDAO
 */
@Service
public class EnqueteService {
	
	@Autowired
	private EnqueteDAO dao;
	
	/**
	 *  Permet de récupérer toutes les enquêtes et les insèrent dans une liste
	 * @return list<suspect>
	 * @throws Exception
	 */
	public DataEnquete getAllEnquete() throws Exception {
		return dao.listEnquete();
	}
	
	/**
	 *  Permet de récupérer les informations liées à une enquête à partir de son id
	 * @param id
	 * @return suspect
	 * @throws Exception
	 */
	public DataEnquete getEnquete(int id) throws Exception {
		return dao.getEnquete(id);
	}
	
	/**
	 *  Permet d'insérer une enquête dans la base de donnée 
	 * @param enquete
	 * @return enquete
	 * @throws Exception
	 */
	public Enquete insertEnquete(Enquete enquete) throws Exception {
		return dao.insertEnquete(enquete);
	}
	 /**
	  * Permet de mettre à jour une enquête
	  * @param id
	  * @param enquete
	  * @return enquete
	  * @throws Exception
	  */
	public Enquete updateEnquete( int id ,Enquete enquete) throws Exception {
		return dao.updateEnquete(enquete);
	}
	 /**
	  * Permet de lier un suspect à une enquête
	  * @param enquete
	  * @return enquete
	  * @throws Exception
	  */
	public Enquete addSuspectToEnquete (Enquete enquete) throws Exception {
		return dao.addSuspectToEnquete(enquete);
	}
	
	/**
	 * Permet de transférer une enquête de la table enquête à la table d'archive d'enquête
	 * @param enquete
	 * @return enquete
	 * @throws Exception
	 */
	
	
	public Enquete archiverEnquete (int id) throws Exception {
		return dao.archiverEnquete(id);
	}
	
	/**
	 * Permet de supprimer les informations liées à l'enquête que l'on veut supprimer dans la table personne impliquées 
	 * Cette fonction est toujours à utiliser avant d'utiliser la fonction supprimerEnquete() 
	 * @param id
	 * @throws Exception
	 */
	public void supprimerJointureEnquete (int id) throws Exception {
		dao.supprimerJointureEnquete(id);
	}
	
	/**
	 * Permet de supprimer une enquête et ses informations de la table enquête
	 * La fonction supprimerJointureEnquete() doit être utilisée avant la fonction supprimerEnquete()
	 * @param id
	 * @throws Exception
	 */
	public void supprimerEnquete (int id) throws Exception {
		dao.supprimerEnquete(id);
	}
}
