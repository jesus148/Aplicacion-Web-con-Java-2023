package entity;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RequestData {

	public String titulo;
    public String anio;
    public String serie;
    public int estado;
    public String categoria;
    public List<LibroExcel> tabla;
}

