package entity;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Libro {

	private int idLibro, idCategoria;
	private String titulo;
	private int anio;
	private String serie;
	private Timestamp fechaRegistro;
	private int estado;
	private Categoria categoria;
	
	
	//esto no pertenece a libro solo lo hacemos para poner la fecha de devolucion
	private Date fechaDevolucion;
	private Timestamp fecDevolucion;
	
	
	//fecha formateada de la fecha devolucion de arriba pa q se vea mejor
	private String fechaFormateada;

}
