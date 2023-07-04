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
import dao.impl.MySqlAlumnoDAO;
import dao.impl.MySqlAutorDAO;
import dao.impl.MySqlCategoriaDAO;
import dao.impl.MySqlDevolucionDAO;
import dao.impl.MySqlEditorialDAO;
import dao.impl.MySqlGradoDAO;
import dao.impl.MySqlLibroDAO;
import dao.impl.MySqlModalidadDAO;
import dao.impl.MySqlPaisDAO;
import dao.impl.MySqlPrestamoDAO;
import dao.impl.MySqlProveedorDAO;
import dao.impl.MySqlRevistaDAO;
import dao.impl.MySqlSalaDAO;
import dao.impl.MySqlSedeDAO;
import dao.impl.MySqlSeparacionDAO;
import dao.impl.MySqlTesisDAO;
import dao.impl.MySqlUsuarioDAO;

public class FabricaMysql extends Fabrica {

	public UsuarioDAO getUsuarioDAO() {			return new MySqlUsuarioDAO(); 	}
	public AlumnoDAO getAlumnoDAO() {			return new MySqlAlumnoDAO(); 	}
	public AutorDAO getAutorDAO() {				return new MySqlAutorDAO(); 	}
	public TesisDAO getTesisDAO() {				return new MySqlTesisDAO(); 	}


	//Revista
	public RevistaDAO getRevistaDAO() {			return new MySqlRevistaDAO(); 	}
	//Modalidad
	public ModalidadDAO getModalidadDAO() {		return new MySqlModalidadDAO();	}
	
	
	public LibroDAO getLibroDAO() {				return new MySqlLibroDAO(); 	}
	public ProveedorDAO getProveedorDAO() {		return new MySqlProveedorDAO(); 	}
	public EditorialDAO getEditorialDAO() {		return new MySqlEditorialDAO(); 	}
	public PrestamoDAO getPrestamoDAO() {		return new MySqlPrestamoDAO(); 	}
	public SeparacionDAO getSeparacionDAO() {	return new MySqlSeparacionDAO(); 	}
	public DevolucionDAO getDevolucionDAO() {	return new MySqlDevolucionDAO(); 	}

	

	
	
	
	
	
	
	//registra SALA
	
	public SalaDAO getSala() {
		return new MySqlSalaDAO(); 	
		}
	
	@Override
	public SedeDAO getSede() {
		// TODO Auto-generated method stub	
		return new MySqlSedeDAO() ;
	}

	
	
	
	
	
	
	
	

	public CategoriaDAO getCategoria() {	
	
		return new MySqlCategoriaDAO();
	}
	public LibroDAO getLibro() {	
		
		return new MySqlLibroDAO();
	}
	public PaisDAO getPais() {
		return new MySqlPaisDAO();
	}
	//Autor
	@Override
	public GradoDAO getGrado() {
		// TODO Auto-generated method stub
		return new MySqlGradoDAO();
	}
	@Override
	public AutorDAO getAutor() {
		// TODO Auto-generated method stub
		return new MySqlAutorDAO();

	}
	
	
}
