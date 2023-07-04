package entity;

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

}
