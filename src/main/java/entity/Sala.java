package entity;





import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter



/* <!-- 2 PASO CRUD SALA --> */
public class Sala {

	private int idSala;
	private String numero;
	private int piso;
	private int numAlumnos;
	private String recursos;
	private Timestamp fechaRegistro;
	private int estado;
	private Sede sede;
	

	
	
	
	

}
