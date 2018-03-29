package co.simplon.dao;

import co.simplon.model.DataSuspect;
import co.simplon.model.Suspect;
/**
 * 
 * @author jean philippe
 * interface définit les methodes utilisées dans l'implementation jdbcSuspectDAO
 *
 */
public interface SuspectDAO {
	
	public DataSuspect listSuspect() throws Exception;
	
	public DataSuspect  getSuspect(int id) throws Exception;
	
	public Suspect insertSuspect(Suspect suspect) throws Exception;
	
	public Suspect updateSuspect( Suspect suspect) throws Exception;
	
	public Suspect addSuspectToEnquete (Suspect suspect) throws Exception;
	
	public int verifSuspectExiste (Suspect suspect) throws Exception;

}
