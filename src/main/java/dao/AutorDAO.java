package dao;

import java.sql.Date;
import java.util.List;

import entity.Autor;


public interface AutorDAO {
	public abstract List<Autor> listaPorFecha(Date fecInicio, Date fecFin);
	public abstract List<Autor> listaAutorComplejo(String nombres, String apellidos,Date fecInicio, Date fecFin, String telefono, int estado, int idGrado);

	
	
	public abstract int insertaAutor(Autor obj);
	public abstract List<Autor> listaAutor(String filtro);
	public abstract int actualizaAutor(Autor obj);
	public abstract int eliminaAutor(int idAutor);
	public abstract Autor buscaAutor(int idAutor);




	
}

