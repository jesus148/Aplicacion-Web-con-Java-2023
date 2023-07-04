package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.AlumnoDAO;
import entity.Alumno;
import entity.Pais;
import util.MySqlDBConexion;

public class MySqlAlumnoDAO implements AlumnoDAO {
	
	private static Logger log = Logger.getLogger(MySqlAlumnoDAO.class.getName());
	
	public int insertaAlumno(Alumno  obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into Alumno values(null,?,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombres());
			pstm.setString(2, obj.getApellidos());
			pstm.setString(3, obj.getTelefono());
			pstm.setString(4, obj.getDni());
			pstm.setString(5, obj.getCorreo());
			pstm.setDate(6, obj.getFechaNacimiento());
			pstm.setTimestamp(7, obj.getFechaRegistro());
			pstm.setInt(8, obj.getEstado());
			pstm.setInt(9, obj.getPais().getIdPais());
			log.info(">>>> " + pstm);

			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return salida;
	}

	@Override
	public List<Alumno> listaAlumno(String filtro) {
		List<Alumno> lista = new ArrayList<Alumno>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn =  MySqlDBConexion.getConexion();
			String  sql ="select a.*, p.nombre from alumno a inner join pais p on a.idPais = p.idPais where a.nombres like ? ";
			pstm =  conn.prepareStatement(sql);
			pstm.setString(1, filtro);
			
			log.info(">>>> " + pstm);
			
			rs= pstm.executeQuery();
			Alumno objAlumno = null;
			Pais objPais = null;
			 while (rs.next()) {
				objAlumno = new Alumno();
				objAlumno.setIdAlumno(rs.getInt(1));
				objAlumno.setNombres(rs.getString(2));
				objAlumno.setApellidos(rs.getString(3));
				objAlumno.setTelefono(rs.getString(4));
				objAlumno.setDni(rs.getString(5));
				objAlumno.setCorreo(rs.getString(6));
				objAlumno.setFechaNacimiento(rs.getDate(7));
				objAlumno.setFechaRegistro(rs.getTimestamp(8));
				objAlumno.setEstado(rs.getInt(9));
				
				
				objPais =  new Pais();
				objPais.setIdPais(rs.getInt(10));
				objPais.setNombre(rs.getString(11));
				
				objAlumno.setPais(objPais);
				lista.add(objAlumno);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm != null) pstm.close();
				if(conn != null) pstm.close();
			}catch (Exception e2){}
		}
		return lista;
	}

	@Override
	public int actualizaAlumno(Alumno obj) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "update alumno set nombres=?, apellidos =?, telefono =?, dni=?, correo=?, fechaNacimiento=?, estado=?, idPais=? where idAlumno=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombres());
			pstm.setString(2, obj.getApellidos());
			pstm.setString(3, obj.getTelefono());
			pstm.setString(4, obj.getDni());
			pstm.setString(5, obj.getCorreo());
			pstm.setDate(6, obj.getFechaNacimiento());
			pstm.setInt(7, obj.getEstado());
			pstm.setInt(8, obj.getPais().getIdPais());
			pstm.setInt(9, obj.getIdAlumno());
			
			
			log.info(">>>> " + pstm);
			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return salida;
	}

	@Override
	public int eliminaAlumno(int idAlumno) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "delete from alumno where idAlumno = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idAlumno);
			log.info(">>>> " + pstm);
			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return salida;
	}

	@Override
	public Alumno buscaAlumno(int idAlumno) {
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Alumno objAlumno = null;
		try {
			conn =  MySqlDBConexion.getConexion();
			String  sql ="select a.*, p.nombre from alumno a inner join pais p"
						+ " on a.idPais = p.idPais"
						+ " where a.idAlumno = ? ";
			pstm =  conn.prepareStatement(sql);
			pstm.setInt(1, idAlumno);
			
			log.info(">>>> " + pstm);
			
			rs= pstm.executeQuery();
			Pais objPais = null;
			 while (rs.next()) {
				objAlumno = new Alumno();
				objAlumno.setIdAlumno(rs.getInt(1));
				objAlumno.setNombres(rs.getString(2));
				objAlumno.setApellidos(rs.getString(3));
				objAlumno.setTelefono(rs.getString(4));
				objAlumno.setDni(rs.getString(5));
				objAlumno.setCorreo(rs.getString(6));
				objAlumno.setFechaNacimiento(rs.getDate(7));
				objAlumno.setFechaRegistro(rs.getTimestamp(8));
				objAlumno.setEstado(rs.getInt(9));
				
				objPais =  new Pais();
				objPais.setIdPais(rs.getInt(10));
				objPais.setNombre(rs.getString(11));
				objAlumno.setPais(objPais);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm != null) pstm.close();
				if(conn != null) pstm.close();
			}catch (Exception e2){}
		}
		return objAlumno;
	}

	@Override
	public List<Alumno> listaAlumnoComplejo(String nombres, String dni, int estado, int idPais) {
		List<Alumno> lista = new ArrayList<Alumno>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn =  MySqlDBConexion.getConexion();
			String  sql ="SELECT a.*, p.nombre FROM alumno a inner join  pais p on a.idPais=p.idPais "
					+ "where 1=1 "
					+ "and a.nombres like ? "
					+ "and (?='' or a.dni=? ) "
					+ "and a.estado= ? "
					+ "and (?= -1 or p.idPais = ? )  ";
			pstm =  conn.prepareStatement(sql);
			pstm.setString(1, nombres);
			pstm.setString(2, dni);
			pstm.setString(3, dni);
			pstm.setInt(4, estado);
			pstm.setInt(5, idPais);
			pstm.setInt(6, idPais);
			
			log.info(">>>> " + pstm);
			
			rs= pstm.executeQuery();
			Alumno objAlumno = null;
			Pais objPais = null;
			 while (rs.next()) {
				objAlumno = new Alumno();
				objAlumno.setIdAlumno(rs.getInt(1));
				objAlumno.setNombres(rs.getString(2));
				objAlumno.setApellidos(rs.getString(3));
				objAlumno.setTelefono(rs.getString(4));
				objAlumno.setDni(rs.getString(5));
				objAlumno.setCorreo(rs.getString(6));
				objAlumno.setFechaNacimiento(rs.getDate(7));
				objAlumno.setFechaRegistro(rs.getTimestamp(8));
				objAlumno.setEstado(rs.getInt(9));
				
				
				objPais =  new Pais();
				objPais.setIdPais(rs.getInt(10));
				objPais.setNombre(rs.getString(11));
				
				objAlumno.setPais(objPais);
				lista.add(objAlumno);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm != null) pstm.close();
				if(conn != null) pstm.close();
			}catch (Exception e2){}
		}
		return lista;
	}
}
