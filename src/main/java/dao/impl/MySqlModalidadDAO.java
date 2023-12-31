package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.ModalidadDAO;
import entity.Modalidad;
import util.MySqlDBConexion;



public class MySqlModalidadDAO implements ModalidadDAO {
	
	private static Logger Log = Logger.getLogger(MySqlModalidadDAO.class.getName());

	@Override
	public List<Modalidad> listaModalidad() {
		List<Modalidad> lista = new ArrayList<Modalidad>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql ="Select * from modalidad";
			pstm = conn.prepareStatement(sql);
			Log.info(">>>>" + pstm);
			
			rs=pstm.executeQuery();
			Modalidad obj = null;
			while(rs.next()) {
				obj = new Modalidad();
				obj.setIdModalidad(rs.getInt(1));
				obj.setDescripcion(rs.getString(2));
				lista.add(obj);
			}
				
				
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm !=null) pstm.close();
				if (conn !=null) conn.close();
			}catch (Exception e2) {	}
				
		}
		
		
		return lista;
	}

	
}
