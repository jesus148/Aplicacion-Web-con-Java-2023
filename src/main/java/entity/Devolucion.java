package entity;

import java.util.Date;
import java.util.List;


import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Devolucion {

	private int idDevolucion , idAlumno ,idUsuario;
	private Date fechaRegistro;
	private Timestamp fechaDevolucion;
	private int estado;
	private Usuario usuario;
	private List<DevolucionHasLibro> detallesDevolucion;

}
