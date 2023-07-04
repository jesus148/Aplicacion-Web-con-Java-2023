package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.LibroDAO;
import entity.Categoria;
import entity.Libro;
import util.MySqlDBConexion;

public class MySqlLibroDAO implements LibroDAO {
	private static Logger log = Logger.getLogger(MySqlProveedorDAO.class.getName());
	@Override
	public int insertaLibro(Libro obj) {
		// TODO Auto-generated method stub
		
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "call sp_libro_inserta(?,?,?,?,?,?)";
			pstm = conn.prepareCall(sql);
			pstm.setString(1, obj.getTitulo());
			pstm.setInt(2, obj.getAnio());
			pstm.setString(3, obj.getSerie());
			pstm.setTimestamp(4, obj.getFechaRegistro());
			pstm.setInt(5, obj.getEstado());
			pstm.setInt(6, obj.getCategoria().getIdCategoria());
			
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
	public List<Libro> listaLibro(String filtro) {
		// TODO Auto-generated method stub
		List<Libro> lista = new ArrayList<Libro>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select cl.*, ca.descripcion from libro cl inner join categoria_libro ca on cl.idCategoria = ca.idCategoria where cl.titulo like ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, filtro);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Libro objLibro = null;
			Categoria objCategoria = null;
			while(rs.next()) {
				objLibro = new Libro();
				objLibro.setIdLibro(rs.getInt(1));
				objLibro.setTitulo(rs.getString(2));
				objLibro.setAnio(rs.getInt(3));
				objLibro.setSerie(rs.getString(4));
				objLibro.setFechaRegistro(rs.getTimestamp(5));
				objLibro.setEstado(rs.getInt(6));
				
				objCategoria = new Categoria();
				objCategoria.setIdCategoria(rs.getInt(7));
				objCategoria.setDescripcion(rs.getString(8));
				objLibro.setCategoria(objCategoria);
				
				lista.add(objLibro);
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
	
	@Override
	public int actualizaLibro(Libro obj) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "update libro set titulo=?, anio=?, serie=?, estado=?, idCategoria=? where idLibro=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getTitulo());
			pstm.setInt(2, obj.getAnio());
			pstm.setString(3, obj.getSerie());
			pstm.setInt(4, obj.getEstado());
			pstm.setInt(5, obj.getCategoria().getIdCategoria());
			pstm.setInt(6, obj.getIdLibro());
			
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
	public int eliminaLibro(int idLibro) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "delete from libro where idLibro = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idLibro);
			
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
	public Libro buscaLibro(int idLibro) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Libro objLibro = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select cl.*, ca.descripcion from Libro cl inner join categoria_libro ca on "
					+ " cl.idCategoria = ca.idCategoria "
					+ " where cl.idLibro = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idLibro);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Categoria objCategoria = null;
			while(rs.next()) {
				objLibro = new Libro();
				objLibro.setIdLibro(rs.getInt(1));
				objLibro.setTitulo(rs.getString(2));
				objLibro.setAnio(rs.getInt(3));
				objLibro.setSerie(rs.getString(4));
				objLibro.setFechaRegistro(rs.getTimestamp(5));
				objLibro.setEstado(rs.getInt(6));
				
				objCategoria = new Categoria();
				objCategoria.setIdCategoria(rs.getInt(7));
				objCategoria.setDescripcion(rs.getString(8));
				objLibro.setCategoria(objCategoria);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		return objLibro;
	}
	@Override
	public List<Libro> listaCompleja(String titulo, String anio, String serie, int estado, int idCategoria) {
		List<Libro> lista = new ArrayList<Libro>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "SELECT l.*, c.descripcion FROM libro l inner join categoria_libro c "
					+ "on l.idCategoria = c.idCategoria "
					+ "where 1=1 "
					+ "and l.titulo like ? "
					+ "and (? = '' or l.anio = ? ) "
					+ "and l.serie like ? "
					
					+ "and ( ? = -1 or l.idCategoria = ? ) " 
					+ "and l.estado = ? "
					;
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, titulo);
			pstm.setString(2, anio);
			pstm.setString(3, anio);
			//pstm.setString(4, serie);
			pstm.setString(4, serie);
			pstm.setInt(5, idCategoria);
			pstm.setInt(6, idCategoria);
			pstm.setInt(7, estado);
			
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Libro objLibro = null;
			Categoria objCategoria = null;
			while(rs.next()) {
				objLibro = new Libro();
				objLibro.setIdLibro(rs.getInt(1));
				objLibro.setTitulo(rs.getString(2));
				objLibro.setAnio(rs.getInt(3));
				objLibro.setSerie(rs.getString(4));
				objLibro.setFechaRegistro(rs.getTimestamp(5));
				objLibro.setEstado(rs.getInt(6));
				
				
				objCategoria = new Categoria();
				objCategoria.setIdCategoria(rs.getInt(7));
				objCategoria.setDescripcion(rs.getString(8));
				objLibro.setCategoria(objCategoria);
				
				lista.add(objLibro);
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
