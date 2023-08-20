package dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.RevistaDAO;
import entity.Modalidad;
import entity.Revista;
import util.FechaUtil;
import util.MySqlDBConexion;

public class MySqlRevistaDAO implements RevistaDAO {
	
	private static Logger Log = Logger.getLogger(MySqlRevistaDAO.class.getName());

	@Override
	public int insertarRevista(Revista obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into revista values(null,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,obj.getNombre());
			pstm.setString(2, obj.getFrecuencia());
			pstm.setDate(3,obj.getFechaCreacion());
			pstm.setTimestamp(4,obj.getFechaRegistro());
			pstm.setInt(5, obj.getEstado());
			pstm.setInt(6,obj.getModalidad().getIdModalidad());
			
			Log.info(">>>> " + pstm);
			
			salida = pstm.executeUpdate();
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm !=null) pstm.close();
				if(conn!=null) conn.close();
			}catch (Exception e2) {}
		}
		
		
		return salida;
	}

	@Override
	public List<Revista> listaRevistaPorNombre(String filtro) {
		List<Revista> lista = new ArrayList<Revista>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "select c.*, a.descripcion from revista c inner join modalidad a on "
					+ "  c.idModalidad = a.idModalidad "
					+ " where c.nombre like ? ";
					
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,filtro);
			Log.info(">>>>" + pstm);
			
			rs= pstm.executeQuery();
			Revista objRevista = null;
			Modalidad objModalidad = null;
			while(rs.next()) {
				objRevista = new Revista();
				objRevista.setIdRevista(rs.getInt(1));
				objRevista.setNombre(rs.getString(2));
				objRevista.setFrecuencia(rs.getString(3));
				objRevista.setFechaCreacion(rs.getDate(4));
				objRevista.setFechaRegistro(rs.getTimestamp(5));		
				objRevista.setEstado(rs.getInt(6));
				objRevista.setFechaFormateada(FechaUtil.getFechaFormateadaYYYYMMdd(rs.getDate(4))   );
				
				objModalidad = new Modalidad();
				objModalidad.setIdModalidad(rs.getInt(7));
				objModalidad. setDescripcion(rs.getString(8));
				
				objRevista.setModalidad(objModalidad);
				lista.add(objRevista);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm != null) pstm.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		
		return lista;
	}

	@Override
	public int actualizaRevista(Revista obj) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql ="update revista set nombre=?, frecuencia=?, fechaCreacion=?, estado=?, idModalidad=? where  idRevista=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,obj.getNombre());
			pstm.setString(2, obj.getFrecuencia());
			pstm.setDate(3, obj.getFechaCreacion());
			pstm.setInt(4,obj.getEstado());
			pstm.setInt(5,obj.getModalidad().getIdModalidad());
			pstm.setInt(6,obj.getIdRevista());
			
			
			Log.info(">>>> " + pstm);
			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
				
			} catch (Exception e2) {}
		}
		return salida;
	}

	@Override
	public int eliminaRevista(int idRevista) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql =" delete from revista where idRevista = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1,idRevista);
			
			Log.info(">>>> " + pstm);
			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
				
			} catch (Exception e2) {
				
			}
		}
		return salida;
	}

	@Override
	public Revista buscaRevista(int idRevista) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Revista objRevista = null;
		
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "select c.*, a.descripcion from revista c inner join modalidad a on "
					+ "  c.idModalidad = a.idModalidad "
					+ " where c.idRevista = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1,idRevista);
			
			Log.info(">>>>" + pstm);
			
			rs= pstm.executeQuery();
			
			Modalidad objModalidad = null;
			while(rs.next()) {
				objRevista = new Revista();
				objRevista.setIdRevista(rs.getInt(1));
				objRevista.setNombre(rs.getString(2));
				objRevista.setFrecuencia(rs.getString(3));
				objRevista.setFechaCreacion(rs.getDate(4));
				objRevista.setFechaRegistro(rs.getTimestamp(5));
				objRevista.setEstado(rs.getInt(6));
				
				objModalidad = new Modalidad();
				objModalidad.setIdModalidad(rs.getInt(7));
				objModalidad.setDescripcion(rs.getString(8));
				objRevista.setModalidad(objModalidad);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm != null) pstm.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		
		return objRevista;
	}

	@Override
	public List<Revista> listaRevistaComplejo(String nombre,String frecuencia, int idModalidad, int estado, Date fecInicio, Date fecFin) {
		List<Revista> lista = new ArrayList<Revista>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "Select e.*,p.descripcion from revista e inner join modalidad p "
					+ "on e.idModalidad = p.idModalidad "
					+ "where 1=1 "
					+ "and e.nombre like ? "
					+ "and e.frecuencia like ? "
					+ "and (? = -1 or e.idModalidad = ? ) "
					+ "and e.estado = ? "
					+ "and e.fechaRegistro >= ? "
					+ "and e.fechaRegistro <= ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,nombre);
			pstm.setString(2,frecuencia);
			pstm.setInt(3, idModalidad);
			pstm.setInt(4, idModalidad);
			pstm.setInt(5, estado);
			pstm.setDate(6, fecInicio);
			pstm.setDate(7, fecFin);
			
			
			
			
			
			Log.info(">>>>" + pstm);
			
			rs= pstm.executeQuery();
			Revista objRevista = null;
			Modalidad objModalidad = null;
			while(rs.next()) {
				objRevista = new Revista();
				objRevista.setIdRevista(rs.getInt(1));
				objRevista.setNombre(rs.getString(2));
				objRevista.setFrecuencia(rs.getString(3));
				objRevista.setFechaCreacion(rs.getDate(4));
				objRevista.setFechaRegistro(rs.getTimestamp(5));		
				objRevista.setEstado(rs.getInt(6));
				objRevista.setFechaFormateada(FechaUtil.getFechaFormateadaYYYYMMdd(rs.getDate(4)));
				
				objModalidad = new Modalidad();
				objModalidad.setIdModalidad(rs.getInt(7));
				objModalidad. setDescripcion(rs.getString(8));
				
				objRevista.setModalidad(objModalidad);
				lista.add(objRevista);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm != null) pstm.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		
		return lista;
	}

	@Override
	public List<Revista> listaPorFecha(Date fecInicio, Date fecFin) {

			List<Revista> lista = new ArrayList<Revista>();
			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			try {
				conn = MySqlDBConexion.getConexion();
				
				String sql ="SELECT e.*, p.descripcion FROM revista e "
						+ "inner join modalidad p on e.idModalidad = p.idModalidad "
						+ "where fechaRegistro between ?  and ? ";
				pstm = conn.prepareStatement(sql);
				pstm.setDate(1, fecInicio);
				pstm.setDate(2, fecFin);
				
				Log.info(">>>> " + pstm);

				rs = pstm.executeQuery();
				Revista objRevista = null;
				Modalidad objModalidad = null;
				while(rs.next()) {
					objRevista = new Revista();
					objRevista.setIdRevista(rs.getInt(1));
					objRevista.setNombre(rs.getString(2));
					objRevista.setFrecuencia(rs.getString(3));
					objRevista.setFechaCreacion(rs.getDate(4));
					objRevista.setFechaRegistro(rs.getTimestamp(5));		
					objRevista.setEstado(rs.getInt(6));
					objRevista.setFechaFormateada(FechaUtil.getFechaFormateadaYYYYMMdd(rs.getDate(4)));
					
					objModalidad = new Modalidad();
					objModalidad.setIdModalidad(rs.getInt(7));
					objModalidad. setDescripcion(rs.getString(8));
					
					objRevista.setModalidad(objModalidad);
					lista.add(objRevista);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstm != null) pstm.close();
					if (conn != null) conn.close();
				} catch (Exception e2) {}
			}
			
			return lista;
	}
	
	

	
}
