package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.SedeDAO;
import entity.Sede;
import util.MySqlDBConexion;

public class MySqlSedeDAO implements SedeDAO {
	
private static Logger log = Logger.getLogger(MySqlSedeDAO.class.getName());
	
	public List<Sede> listaSede() {
		List<Sede> lista = new ArrayList<Sede>(); //almacen de resultado
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			
			
			//1 FORMA 
			//CONSULTA NORMAL SIN SP 
			//String sql = "select * from sede";
		    //	pstm = conn.prepareStatement(sql);
			
			
			
		
			//2 FORMA 
			//CON SP ES MAS SEGURO 
	         String sql ="call sp_sede_lista()";
			//preparecall es para procedure
			pstm = conn.prepareCall(sql);
			
			
			
			
			
			log.info(">>>> " + pstm);

			//rs :donde se almacena todo 
			rs = pstm.executeQuery();//esto se usa para el select
			Sede obj = null;
			while(rs.next()) {
				obj = new Sede();
				obj.setIdSede(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				lista.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return lista; //al q llama este metodo le retornara todo el resultado de la consulta 
	}
	
	
	
		
	
	
	
	

}
