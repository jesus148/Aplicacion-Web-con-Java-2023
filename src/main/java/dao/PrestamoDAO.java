package dao;

import java.util.ArrayList;
import java.util.List;

import entity.Prestamo;
import entity.Alumno;
import entity.Libro;
import entity.PrestamoHasLibroPK;


public interface PrestamoDAO {

	
	//ESTE DAO TAMBIEN LO USAREMOS EN transaccion devolucion para buscar alumno y libro 
	

	public ArrayList<Libro> consultaCliente(String filtro);
	public ArrayList<Alumno> consultaXNombre(String filtro);
	public int inserta(Prestamo boletaBean, List<PrestamoHasLibroPK> lstDetalle);

	
}

