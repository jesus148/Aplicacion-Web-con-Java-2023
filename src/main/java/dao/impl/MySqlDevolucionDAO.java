package dao.impl;

import java.util.List;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.ResultSet;
import dao.DevolucionDAO;
import entity.Devolucion;
import entity.DevolucionHasLibroPK;
import java.util.logging.Logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import util.MySqlDBConexion;

public class MySqlDevolucionDAO implements DevolucionDAO {

	

	
	//MODELO ES PARA BOLETA   insertar , buscar cliente y producto
	
	private static Logger log = Logger.getLogger(MySqlDevolucionDAO.class.getName());
	
	
	
	
	
	//ESTE MODELO SOLO AFECTARA A 3 TABLAS DEVOLUCION , DEVOLUCION_HAS_LIBRO, LIBRO
		//recibe 2 parametros el devolucionBean el id cliente y el id usuario
		//lstDetalle : es la tabla temporal del jsp la copia
	@Override
	public int inserta(Devolucion devolucionBean, List<DevolucionHasLibroPK> lstDetalle) {
		
log.info("---> En MySqlBoleta-> inserta");
		
		
		int contador = -1;
		Connection conn = null;
		PreparedStatement pstm1 = null, pstm2= null,pstm3= null, pstm4 = null;
		
		//PSTM(prepared stament)
		//Una instrucción SQL se compila previamente y se almacena en un objeto PreparedStatement. Este objeto se puede usar para ejecutar 
		//de manera eficiente esta declaración varias veces.
		
		try {
			conn = MySqlDBConexion.getConexion();
			//Se anula el auto envio
			conn.setAutoCommit(false);
			
			
			//CREA E INSERTA A LA TABLA DEVOLUCION 
			//se crea el sql de la cabecera
			String sql1 ="insert into devolucion values(null,?, ?, curtime() ,?,? ) ";
			pstm1 = conn.prepareStatement(sql1);
			pstm1.setInt(1, devolucionBean.getIdAlumno());
			pstm1.setInt(2, devolucionBean.getIdUsuario());
			pstm1.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			pstm1.setInt(4,  1);
			pstm1.executeUpdate();
			log.info(">> pstm1 >> " + pstm1);
			
			
			//BUSCAR EL ID DE LA DEVOLUCION INSERTADA
			//se obtiene el idDevolucion insertado , el maximo significa el ultimo id osea el inserta
			String sql2 ="select max(idDevolucion) from devolucion ";
			pstm2 =  conn.prepareStatement(sql2);
			log.info(">> pstm2 >> " + pstm2);
			ResultSet rs = pstm2.executeQuery();
			//rs.next :Método que mueve el cursor una fila dentro del ResultSet. Inicialmente el cursor se sitúa antes de la primera fila.
			//Cuando el cursor se posiciona después de la última fila el método devuelve false. , esto es como 1 for o each para las filas
			rs.next();
			int idDevolucion = rs.getInt(1);//esto obtiene de la tabla o la consulta o el resultado el id
			
			
			
			
			//INSERTA DETALLE DEVOLUCION (HACEMOS ESTO APARTIR DE AQUI PQ DEVOLUCION PUEDE TENER 1 LIBRO O VARIOS LIBROS A DEVOLVER
			//por ende debe hacer un recorrido)
			//se inserta el detalle de devolucion 
			String sql3 ="insert into devolucion_has_libro values( ? , ? ) ";
			pstm3 =  conn.prepareStatement(sql3);
			
			//Actualiza la tabla libro 
			String sql4 ="update libro set estado = ?  where idLibro = ? ";
			pstm4 =  conn.prepareStatement(sql4);
			
			//usamos la clase guia DevolucionHasLibroPK y hacer un recorrido al lstDetalle(temporal de libro)
			//esto hara un recorrido por cuantos libros tengas en la tabla temporal
			//osea una boleta tiene varios productos logico
			for (DevolucionHasLibroPK aux : lstDetalle) {
				
				//actualizar el estado  de tabla libro
				pstm4.setInt(1, aux.getEstado());
				pstm4.setInt(2, aux.getIdLibro());
				pstm4.executeUpdate();
				log.info(">> pstm4 >> " + pstm4);
				
				
				//DETALLE DEVOLUCION
				//crea un detalle devolucion pero pa cada libro en orden osea comparte idDevolucion
				pstm3.setInt(1, idDevolucion);//para cada libro usara el = iddevolucion
				pstm3.setInt(2, aux.getIdLibro());
			
				pstm3.executeUpdate();
				log.info(">> pstm3 >> " + pstm3);
			}
			
			
			//se ejecuta todos los SQL en la base de datos
			//Este método envía una COMMITdeclaración al servidor MySQL, confirmando la transacción actual. Dado que Connector/Python no se 
			//confirma automáticamente de forma predeterminada, es importante llamar a este método después de cada transacción que modifica 
			//los datos de las tablas que usan motores de almacenamiento transaccional.
			
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
