package dao;

import entity.Devolucion;
import entity.DevolucionHasLibroPK;


import java.util.List;

public interface DevolucionDAO {
	
	
	
	public int inserta(Devolucion devolucionBean, List<DevolucionHasLibroPK> lstDetalle);
	
	
	
}

