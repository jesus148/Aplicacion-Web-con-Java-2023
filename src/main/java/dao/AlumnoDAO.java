package dao;

import java.util.List;

import entity.Alumno;

public interface AlumnoDAO {

	public  abstract int insertaAlumno( Alumno obj );
	public abstract List<Alumno> listaAlumno (String filtro);
	public abstract int actualizaAlumno(Alumno obj);
	public abstract int eliminaAlumno(int idAlumno);
	public abstract Alumno buscaAlumno(int idAlumno);
	//PC3
	public abstract List<Alumno> listaAlumnoComplejo(String nombres, String dni, int estado, int idPais);
}

