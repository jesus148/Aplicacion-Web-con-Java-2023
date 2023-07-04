package dao;


import java.util.List;


import entity.Sala;

public interface SalaDAO {
	
	
	
	
	
	
	
	
	//-======================================== LISTADO COMPLEJO SALA
	


	//CONSULTA COMPLEJA
	//consulta compleja se refiere a consultas mezcladas ya se por nombre y fecha o mas campos mixto
	//consulta compleja se refiere a consultas mezcladas ya se por nombre y fecha o mas campos mixto
	// osea este metodo complejo sirva para cuando el usario quiere consiultar ya sea solo por 1 campo o 2 campos o ni 1 campo
	// ene este caso lista por por 2 campos nombre y páis y estado y ahi jugamos con los campos lo envie o no lo envie = se ejecuta
	public abstract List<Sala> listaCompleja(String numero,int piso , String recursos, int estado ,int idSede);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*================================================================================ CRUD 
	 * <!-- haciendo un crud a la tabla sala -->
	 
	 3 PASO
	  OJO: al agregar metodos aqui te saldra error dao.imp>mysqlclientedao pq es una interface
	 */
	
	
	//metodo inserta solo a sala
	public abstract int insertaSala(Sala obj);
	
	//listamos a partir de 1 palabra todo los objetos q concuerden esa palabra
		public abstract List<Sala> listaSala(String filtro);
		
		
		
			
		//METODO ACTULIZA SOLO A TABLA SALA
		
		public abstract int actualizaSala(Sala obj);
		
		//apartir del id eliminamos el objeto
		public abstract int eliminaSala(int idSala);
		
		//a apartir de iD se buscar el objeto
		public abstract Sala buscaSala(int idSala);
		
	
	
	
	
	
	

	
}

