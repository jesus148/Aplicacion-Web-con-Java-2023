package entity;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class DevolucionHasLibroPK  implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private int idDevolucion;
	private int idLibro;
	private int estado;
	private Timestamp fechaDevolucion;

}
