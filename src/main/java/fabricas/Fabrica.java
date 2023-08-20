package fabricas;

import dao.AlumnoDAO;
import dao.AutorDAO;
import dao.CategoriaDAO;
import dao.DevolucionDAO;
import dao.EditorialDAO;
import dao.GradoDAO;
import dao.LibroDAO;
import dao.ModalidadDAO;
import dao.PaisDAO;
import dao.PrestamoDAO;
import dao.ProveedorDAO;
import dao.RevistaDAO;
import dao.SalaDAO;
import dao.SedeDAO;
import dao.SeparacionDAO;
import dao.TesisDAO;
import dao.UsuarioDAO;


public abstract class Fabrica {

	public static final int MYSQL = 1;
	public static final int SQLSERVER = 2;

	public abstract UsuarioDAO getUsuarioDAO();
	public abstract AlumnoDAO  getAlumnoDAO();
	public abstract AutorDAO getAutorDAO();
	public abstract EditorialDAO getEditorialDAO();
	public abstract LibroDAO getLibroDAO();
	public abstract ProveedorDAO getProveedorDAO();

	//Revista
	public abstract RevistaDAO getRevistaDAO(); 
	//Modalidad
	public abstract ModalidadDAO getModalidadDAO(); 
	
	
	//sala 
	public abstract SalaDAO getSala();
	public abstract SedeDAO getSede();
	
	
	
	
	public abstract TesisDAO getTesisDAO();

	
	
	
	//transacccion prestamo 
	public abstract PrestamoDAO getPrestamoDAO();
	
	
	
	
	//transaccion devolucion
	
	public abstract DevolucionDAO getDevolucionDAO();
	
	
	

	public abstract SeparacionDAO getSeparacionDAO();
	
	
	
	
	public abstract CategoriaDAO getCategoria();

	public abstract LibroDAO getLibro();
	public abstract PaisDAO getPais();
	
	//Autor
	public abstract GradoDAO getGrado();
	public abstract AutorDAO getAutor();
	
	
	public static Fabrica getFabrica(int tipo){
		Fabrica salida = null;
		switch(tipo){
			case MYSQL: 
				salida = new FabricaMysql();
				break;
			
		}
		return salida;
	}
	
}
