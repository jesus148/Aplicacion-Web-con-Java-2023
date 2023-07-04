package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.PrestamoDAO;
import entity.Alumno;
import entity.Libro;
import entity.Prestamo;
import entity.PrestamoHasLibro;
import entity.PrestamoHasLibroPK;
import util.MySqlDBConexion;
import java.util.Date;

public class MySqlPrestamoDAO implements PrestamoDAO {
	

	@Override
	public ArrayList<Libro> consultaCliente(String filtro) {

		
		ArrayList<Libro> data = new ArrayList<Libro>();
		Libro bean = null;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql ="select * from libro  where titulo like ? ";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, (filtro));
		
			
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()){
				bean = new Libro();
				bean.setIdLibro(rs.getInt("idLibro"));
				bean.setTitulo(rs.getString("titulo"));
				bean.setAnio(rs.getInt("anio"));
				bean.setSerie(rs.getString("serie"));
				bean.setFechaRegistro(rs.getTimestamp("fechaRegistro"));
				bean.setEstado(rs.getInt("estado"));
				bean.setIdCategoria(rs.getInt("idcategoria"));
				data.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				conn.close();
				pstm.close();
			} catch (SQLException e) {
			}
		}
		return data;

	}

	@Override
	public ArrayList<Alumno> consultaXNombre(String filtro) {
		
		
		
		ArrayList<Alumno> data = new ArrayList<Alumno>();
		Alumno bean = null;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			String sql = null;
			conn = MySqlDBConexion.getConexion();
			 sql ="select * from alumno where  nombres like ? ";
					pstm = conn.prepareStatement(sql);
					pstm.setString(1, filtro + "%");
					
					
			
					
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()){
				bean = new Alumno();
				bean.setIdAlumno(rs.getInt("idAlumno"));
				bean.setNombres(rs.getString("nombres"));
				bean.setApellidos(rs.getString("apellidos"));
				bean.setTelefono(rs.getString("telefono"));
				bean.setDni(rs.getString("dni"));
				bean.setCorreo(rs.getString("correo"));
				bean.setFechaNacimiento(rs.getDate("fechaNacimiento"));
				bean.setFechaRegistro(rs.getTimestamp("fechaRegistro"));
				bean.setEstado(rs.getInt("estado"));
				bean.setIdPais(rs.getInt("idPais"));
				
				
				
				
				data.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				conn.close();
				pstm.close();
			} catch (SQLException e) {
			}
		}
		return data;
	}


	@Override
	public int inserta(Prestamo boletaBean, List<PrestamoHasLibroPK> lstDetalle) {
		int contador = -1;
		Connection conn = null;
		PreparedStatement pstm1 = null, pstm2= null,pstm3= null;
		
		try {
			conn = MySqlDBConexion.getConexion();
			//Se anula el auto envio
			conn.setAutoCommit(false);
			
			//se crea el sql de la cabecera
			String sql1 ="INSERT INTO prestamo (idPrestamo, fechaPrestamo, idAlumno, idUsuario) VALUES (null, CURTIME(), ?, ?)";
			pstm1 = conn.prepareStatement(sql1);
			pstm1.setInt(1, boletaBean.getIdAlumno());
			pstm1.setInt(2, boletaBean.getIdUsuario());
			
			
			pstm1.executeUpdate();
			
			
			//se obtiene el idBoleta insertado
			String sql2 ="select max(idPrestamo) from prestamo";
			pstm2 =  conn.prepareStatement(sql2);
			ResultSet rs = pstm2.executeQuery();
			rs.next();
			int idPrestamo = rs.getInt(1);
			
			//se inserta el detalle de boleta
			String sql3 ="INSERT INTO prestamo_tiene_libro (idPrestamo, idLibro) VALUES (?, ?)";
			pstm3 =  conn.prepareStatement(sql3);
			
			
			
			//se ejecuta todos los SQL en la base de datos
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
				//se vuelva a un inicio 
				//No permite un SQL por separado
			} catch (SQLException e1) {}
			e.printStackTrace();
		} finally{
			try {
				conn.close();
				pstm1.close();
				pstm2.close();
				pstm3.close();
				
			} catch (SQLException e) {
			}
		}
		return contador;
	}
	}


