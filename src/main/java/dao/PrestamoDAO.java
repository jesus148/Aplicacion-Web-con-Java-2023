package dao;

import java.util.ArrayList;
import java.util.List;

import entity.Prestamo;
import entity.Alumno;
import entity.Libro;
import entity.PrestamoHasLibroPK;


public interface PrestamoDAO {


	public ArrayList<Libro> consultaCliente(String filtro);
	public ArrayList<Alumno> consultaXNombre(String filtro);
	public int inserta(Prestamo boletaBean, List<PrestamoHasLibroPK> lstDetalle);

	
}

