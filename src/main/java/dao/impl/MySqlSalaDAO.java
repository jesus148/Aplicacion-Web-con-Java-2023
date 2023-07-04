package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.SalaDAO;


import entity.Sala;
import entity.Sede;

import util.MySqlDBConexion;



/*
 * <!-- PROYECTO haciendo un crud a la tabla SALA -->
 METODOS DEL CRUD
 4 PASO
 
 OJO: al agregar metodos en el dao>clientedao  : aca saldra error
 */



//CAMBIOS FINALES PARA SUBIR A MI GIT


//arreglando el error : solo seleccion el icono de cono error q sale a la izquierda de  public class MySqlClienteDAO implements ClienteDAO
// y selecciona add uniplement methods esto auto lo agrega esos metodos
public class MySqlSalaDAO implements SalaDAO {
	
	

	private static Logger log = Logger.getLogger(MySqlSalaDAO.class.getName());
	
	//insertaProvedor : metodo llamado desde el dao
	
	
	
	/* 1 METODO INSERTA SOLO TABLA CLIENTE*/
	public int insertaSala(Sala  obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			
			
			//1 FORMA 
			//SIN SP CONSULTA NORMAL
			//String sql = "insert into sala values(null,?,?,?,?,?,?,?)";
		    //	pstm = conn.prepareStatement(sql);
		
			
			//2FORMA 
			//CON SP ES MAS SEGURO 
			String sql ="call  sp_sala_inserta(?,?,?,?,?,?,?)";
			pstm = conn.prepareCall(sql);
			
			
			
			pstm.setString(1, obj.getNumero());
			pstm.setInt(2, obj.getPiso());
			pstm.setInt(3, obj.getNumAlumnos());
			pstm.setString(4, obj.getRecursos());
			pstm.setTimestamp(5, obj.getFechaRegistro());
			pstm.setInt(6, obj.getEstado());
			pstm.setInt(7, obj.getSede().getIdSede());
			
			log.info(">>>> " + pstm);

			salida = pstm.executeUpdate();// esto es para actulizar cuando insertamos etc
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return salida; // devuelve la cantidad de registrados
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	//LISTA SALA + TABLA SEDE(NOMBRE)
	@Override
	public List<Sala> listaSala(String filtro) {
		
		
		List<Sala> lista = new ArrayList<Sala>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			
			
			
			//1 FORMA 
			//SIN SP CONSULTA NORMAL
			//NUEVA TABLA CLIENTE + CATEGORIA(NOMBRE)
			
			//descomentar esto
			//String sql = "select sa.*,se.nombre from sala sa inner join sede se on "
			//		+ " sa.idSede=se.idSede "
		     //			+ " where sa.numero like ? ";
		    //	pstm = conn.prepareStatement(sql);
			
			
			
			
			
			
			//2 FORMA 
			//CON SP ES MAS SEGURO 
	         String sql ="call sp_sala_lista(?)";
			//preparecall es para procedure
			pstm = conn.prepareCall(sql);
			
			
			
			
			pstm.setString(1, filtro);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Sala objSala = null;
			Sede objSede = null;
			while(rs.next()) {
				objSala = new Sala();
				objSala.setIdSala(rs.getInt(1));;
				objSala.setNumero(rs.getString(2));
				objSala.setPiso(rs.getInt(3));
				objSala.setNumAlumnos(rs.getInt(4));
				objSala.setRecursos(rs.getString(5));
				objSala.setFechaRegistro(rs.getTimestamp(6));
				objSala.setEstado(rs.getInt(7));
				
				objSede = new Sede();
				objSede.setIdSede(rs.getInt(8));
				objSede.setNombre(rs.getString(9));
				objSala.setSede(objSede);
				
				lista.add(objSala);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return lista;//muestra un array de datos
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	

	//METODO ACTUALIZA
	@Override
	public int actualizaSala(Sala obj) {
		
		
		

		int salida = -1;
			
			Connection conn = null;
			PreparedStatement pstm = null;
			try {
				conn = MySqlDBConexion.getConexion();
				
				
				
				
				
				
				//1 FORMA 
				//============================================================================
				//SIN SP CONSULTA NORMAL
				//solo actulizamos la tabla cliente
				//recordar q el id o primary key no se actuliza es unico
				//tampoco se actuliza la fecha de registro ya q es unica no es un primary key
				//si en el caso no actulizamos todos los valoroes solo ciertos valore ,los valores q no hemos modificado pondra los mismos valores y
				//volvera actulizar 
			    // de tal forma q se actuliza con el mismo valor
				
				
				//recordar q al actulizar , actuliza por orden de los atributos o columnas
				//String sql = "update sala set numero = ? , piso= ?, numAlumnos=?, recursos =? ,  estado =? , idSede=? where idSala= ? ";
				//pstm = conn.prepareStatement(sql);
				
				
				
				
				
				
				//2 FORMA 
				//CON SP ES MAS SEGURO 
				String sql ="call sp_sala_actualiza(?,?,?,?,?,?,?)";
				pstm = conn.prepareCall(sql);
				
				
				
				
				
				
				//este orden es de acuerdo a la consulta update arriba
				pstm.setString(1, obj.getNumero());
				pstm.setInt(2, obj.getPiso());
				pstm.setInt(3, obj.getNumAlumnos());
				pstm.setString(4, obj.getRecursos());
				pstm.setInt(5, obj.getEstado());
				pstm.setInt(6, obj.getSede().getIdSede());
				pstm.setInt(7, obj.getIdSala());
				
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
			
			
			//muestra la cantidad de actulizados
			return salida;
			
		
		
		
		
		
		
		
		
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//METODO DE ELIMINA CLIENTE apartir de un id eliminamos todo el objeto

	@Override
	public int eliminaSala(int idSala) {
           int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			
			//1 FORMA 
			//============================================================================
			//SIN SP CONSULTA NORMAL
			//String sql = "delete from sala where idSala = ?";
			//pstm = conn.prepareStatement(sql);
			
			
			
			
			//2 FORMA 
			//CON SP ES MAS SEGURO 
			String sql ="call sp_sala_elimina(?)";
			pstm = conn.prepareCall(sql);
			
			
			
			pstm.setInt(1,idSala );
		
			
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
		
		
		//retorna la cantidad de eliminados
		return salida;
	}
	
	
	
	
	
	
	
	
	
	
	
	
 
	//METODO BUSCAR
	//  tabla sala + sede(nombre)
	@Override
	public Sala buscaSala(int idSala) {

		
		
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Sala objSala = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			
			//1 FORMA 
			//============================================================================
			//SIN SP CONSULTA NORMAL
			
			/*
			 * String sql = "select sa.*, se.nombre from sala sa inner join sede se on " +
			 * " sa.idSede=se.idSede " + " where sa.idSala = ? "; pstm =
			 * conn.prepareStatement(sql);
			 */
			
			
			
			
			//2 FORMA 
			//============================================================================
			//CON SP ES MAS SEGURO 
			
			String sql="call sp_sala_busca( ? )"; 
			pstm = conn.prepareCall(sql);
			
			
			
			
			
			pstm.setInt(1, idSala);
			
			log.info(">>>> " + pstm);

			//guarda la data encontrada
			rs = pstm.executeQuery();
		
			Sede objSede = null;
			while(rs.next()) {
				objSala = new Sala();
				objSala.setIdSala(rs.getInt(1));
				objSala.setNumero(rs.getString(2));
				objSala.setPiso(rs.getInt(3));
				objSala.setNumAlumnos(rs.getInt(4));
				objSala.setRecursos(rs.getString(5));
				objSala.setFechaRegistro(rs.getTimestamp(6));
				objSala.setEstado(rs.getInt(7));
				
				objSede = new Sede();
				objSede.setIdSede(rs.getInt(8));
				objSede.setNombre(rs.getString(9));
				objSala.setSede(objSede);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		
		//retorna un objeto cliente osea la tabla cliente + tabla categoria(nombre)
		return objSala;
	}














	
	//METODO LISTA COMPLEJO  SALA + SEDE (PAIS)
	//consulta compleja se refiere a consultas mezcladas ya se por nombre y fecha o mas campos mixto
	// osea este metodo complejo sirva para cuando el usario quiere consiultar ya sea solo por 1 campo o 2 campos o ni 1 campo
	// ene este caso lista por por 4 campos numero y recursos y el estado,categoria y ahi jugamos con los campos lo envie o no lo envie = se ejecuta
	//ademas recordar que la fecha es obligatoria en caso tenga o lo modifcias en el servelt

	@Override
	public List<Sala> listaCompleja(String numero,int piso , String recursos, int estado, int idSede) {
		
		List<Sala> lista = new ArrayList<Sala>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			
			
			//1 FORMA 
			//============================================================================
			//SIN SP CONSULTA NORMAL
			//esta explicacion del sql esta en semana 11 lp2
			//DEL SQL copiar igual a la estrutura copiar dentro de los " "
			//el eclipse te ayuda con los espacios
			//poner espacios en blanco al final
			
			
			
//			String sql = "SELECT  sa.* , se.nombre FROM sala  sa inner join sede se  "
//					+ " on sa.idSede = se.idSede "
//					+ " where 1 = 1 "
//					+ " and sa.numero like 	?  "
//					+ " and ( ? = 0  or sa.piso = ?	) "
//					+ " and ( ? = ''  or sa.recursos like ?	) "	
//					+ " and sa.estado = ? "
//					+ " and ( ? = -1  or sa.idSede = ? ); ";
			
			
//			pstm = conn.prepareStatement(sql);
//			pstm.setString(1, numero);
//			pstm.setInt(2, piso);
//			pstm.setInt(3, piso);
//			pstm.setString(4, recursos);
//			pstm.setString(5, recursos);
//			pstm.setInt(6, estado);
//			pstm.setInt(7, idSede);
//			pstm.setInt(8, idSede);
			
			
			
			
			
			
			
			
			//2 FORMA 
			//============================================================================
			//CON SP ES MAS SEGURO 
			
	        String sql ="call sp_empleado_complejo(?,?,?,?,?)";
			//preparecall es para procedure
			pstm = conn.prepareCall(sql);
			
			
			pstm.setString(1, numero);
			pstm.setInt(2, piso);
			pstm.setString(3, recursos);
			pstm.setInt(4, estado);
			pstm.setInt(5, idSede);
			
			
			
			
			
	
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();	
			Sala objSala = null;
			Sede objSede = null;
			
			//desenvolsando la data para almacenar en el array lista
			//atraves de la clase guia donde se guardo objeto x objeto
			//ver la tabla sql y desenvolsar en ese orden de la tabla mysql
			while(rs.next()) {
				objSala = new Sala();
				objSala.setIdSala(rs.getInt(1));;
				objSala.setNumero(rs.getString(2));
				objSala.setPiso(rs.getInt(3));
				objSala.setNumAlumnos(rs.getInt(4));
				objSala.setRecursos(rs.getString(5));
				objSala.setFechaRegistro(rs.getTimestamp(6));
				objSala.setEstado(rs.getInt(7));
				
				objSede = new Sede();
				objSede.setIdSede(rs.getInt(8));
				objSede.setNombre(rs.getString(9));
				objSala.setSede(objSede);
				
				lista.add(objSala);
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
