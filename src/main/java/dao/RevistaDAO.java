package dao;
import java.sql.Date;
import java.util.List;

import entity.Revista;

public interface RevistaDAO {
	
	//Consulta
	public abstract List<Revista> listaPorFecha(Date fecInicio, Date fecFin);
	public abstract List<Revista>listaRevistaComplejo(String nombre,String frecuencia, int idModalidad, int estado, Date fecInicio, Date fecFin);
	
	
	//CRUD
	public abstract List<Revista> listaRevistaPorNombre(String filtro);
	public abstract int insertarRevista(Revista obj);
	public abstract int actualizaRevista(Revista obj);
	public abstract int eliminaRevista (int idRevista);
	public abstract Revista buscaRevista(int idRevista);
	
	
	
	
	
}

