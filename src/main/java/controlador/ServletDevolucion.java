package controlador;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;


import java.util.ArrayList;
import java.util.logging.Logger;
   


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;

import dao.DevolucionDAO;
import util.FechaUtil;
import entity.Devolucion;
import entity.DevolucionHasLibroPK;
import entity.Libro;
import entity.Respuesta;	
import entity.Usuario;
import fabricas.Fabrica;


@WebServlet("/devolucion")
public class ServletDevolucion extends HttpServlet {
	
	
	//esto es una importacion con q varibale por que choca con import java.sql.Date;
    //  private java.util.Date x; 
	
	
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(ServletDevolucion.class.getName());//infor de la consulta
	

	//METODO PRINCIPAL apartir de aca redirecciona alos demas osea primero entra aca cuando llaman a este servelt
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String metodo = request.getParameter("metodo");
		if(metodo.equals("agregaSeleccion")){
			agregar(request, response);
		}else if(metodo.equals("eliminaSeleccion")){
			eliminar(request, response);
		}else if(metodo.equals("registraDevolucion")){
			registra(request, response);
		}
		
		
		
		
	}
	
	
	
	
	
	










	//TABLA ULTIMA DEL JSP TEMPORAL SOLO PARA LIBRO
	//METODO AGREGAR , AGREGA EN LA TABLA DE INTRANETINSERTADEVOLUCION EL LIBRO PERO SOLO EN SESION , OSE SOLO
	//sesion: osea data esta agregada solo en tiempo de sesion mientras el usuario este logueado
	@SuppressWarnings("unchecked")
	protected void agregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.info("En agregar seleccion");
		
		//solo recibe 1 LIBRO por cada agregar , puedo hacer varios agregar
		String idlibro = request.getParameter("idLibro");
		String nombre = request.getParameter("nombreLibro");
		String fecha = request.getParameter("FechaDevolucion");
		String estado = request.getParameter("Estado");
		
		
		int idLibro = Integer.parseInt(idlibro);
		Date Fec = Date.valueOf(fecha);
		int esta = Integer.parseInt(estado);
				
		//inciar la tabla temporal, recordar que esta transaccion devolucion de array esta con la clase guia
		ArrayList<Libro> devolucion;
		
		//Se verifica si existe en sesion osea en forma temporal , 
		HttpSession session = request.getSession();
		
		//ACA BUSCAR LA TABLA TEMPORARL ESta al final en el jsp
		//dataDeGrilla : esta es creado aqui  cuando el valor es null , osea la tabla temporal
		if(session.getAttribute("dataDeGrilla") == null){
			devolucion = new ArrayList<Libro>();//si no hay la tabla temporal lo crea 
		}else{
			devolucion = (ArrayList<Libro>)session.getAttribute("dataDeGrilla");//si ya existe solo le da permiso a la sesion
			//osea esta tabla ya esta creada con todo los libros , algo asi como reasignarlo 
		}
		
		//Se crear el objeto con la clase guia
		Libro libro  = new Libro();
		libro.setIdLibro(idLibro);
		libro.setTitulo(nombre);
		libro.setEstado(esta);
		libro.setFechaDevolucion(Fec); //este dato no le pertence a libro solo para temporal la fecha de devolucion
		libro.setFechaFormateada(FechaUtil.getFechaFormateadaYYYYMMddDate( Fec) ); //fecha formateada de fec devolcion para el jsp
		
		//bolenao verificia si o no
		boolean noExiste = true;
		
		//se verifica los repetidos y si lo encuentra lo remplaza
		//osea solo puede pedir 1 libro de 1 tipo , de esad forma nos evitamos repeticiones filas
		for (int i = 0; i < devolucion.size(); i++) {
			if(devolucion.get(i).getIdLibro() == idLibro){
				devolucion.set(i, libro); //lo remplaza por el libro q registraras
				noExiste = false; //cambia al false para ya no agregar 
				break;
			}
		}
		
		//Si no existe se agrega a la tabla temporal , ese producto
		if(noExiste){
			devolucion.add(libro);
		}
		
		//la lista se agrega a sesion , osea la tabla temporal se agrega a la sesion para verificar y no crear otra si no reescribir
		//esto es para actualizar ya sea a reasignar o crear
		session.setAttribute("dataDeGrilla", devolucion);
		
		
		
		//DATOS DE REGRESO AL JSP 
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setMensaje("Se abgregó el libro >>  " + idlibro +" >>> " + nombre);
		objRespuesta.setDatos(devolucion);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		
			
	}
	
	
	
	
	

	//METODO IGUAL ELIMINA PERO SOLO LOS DATOS DE LIBRO DE LA GRILLA PERO EN SESION 
	//elimina de forma temporal en la tabla ultima 
	@SuppressWarnings("unchecked")
	protected void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.info("En eliminar seleccion");
		
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		
		//eliminar de la sesion , pide del arraylist la sesion , osea esa tabla temporal la obtiene osea debe estar creada
		ArrayList<Libro> Devolucion = (ArrayList<Libro>)session.getAttribute("dataDeGrilla");

		//busca el array list
		//Se elimina el libro de la tabla temporal
		for (Libro p : Devolucion) {
			if(p.getIdLibro() == Integer.parseInt(id)){
				Devolucion.remove(p);  //y lo remueve
				break;
			}
		}
		
		//vuelve actualizar la sesion
		//la lista se agrega a sesion  ,osea con el dato ya eliminado ya no se  mostrara en la tabla temporal
		session.setAttribute("dataDeGrilla", Devolucion);
		
		
		// DATOS DE REGRESO AL JSP
		Respuesta objRespuesta = new Respuesta();	
		objRespuesta.setMensaje("Se eliminó el producto  " + id);
		objRespuesta.setDatos(Devolucion);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(json);
	}
	
	
	
	
	

	//METODO REGISTRA  , solo recibe el id del alumno
	//este metodo agregar a la base de datos directamente , ose no es temporal
	
	@SuppressWarnings("unchecked")
	protected void registra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.info("En registra boleta");
		
		
		//obtiene la sesion activa 
		HttpSession session = request.getSession();

		//Devolucion que esta en sesion , osea la tabla temporal aca se la pide y no al jsp 
		//"dataDeGrilla" : es como el id de la tabla temporal 
		ArrayList<Libro> Devolucion = (ArrayList<Libro>)session.getAttribute("dataDeGrilla");
		
		//recibiendo data del jsp 
		String alumno = request.getParameter("idAlumno");
		int idAlumno = Integer.parseInt(alumno);
		
		
		//RECORDAR DATE : EN SQL Y JAVA solo es 19/08/1998 osea fecha corta y DATETIME: en sql es fecha larga y especifica --> "2023-05-23 18:18:35"
		//en SQL ---> DATE(SQL) = DATE(JAVA)     Y  DATETIME(SQL) =  Timestamp(JAVA)
		//CONVIRTIENDO DE DATE A TIMESTAMP que es lo q pide la bd
	

		
		
	
		



		
		
		
		
		
		//Usuario : es el que se a logueado en la sesion que se ha guardado en el login
		//"objUsuario" : es el usario encontrado osea toda la data de ese usuario esta definido en serveltloguin
		Usuario objusuario = (Usuario) session.getAttribute("objUsuario");
		
		
		//Creamos la Boleta , esta es la tabla que ingresara a la base de datos , esto servira pa insertar devolucion
		Devolucion b = new Devolucion();
		b.setIdAlumno(idAlumno);
		b.setIdUsuario(objusuario.getIdUsuario());
		

		
		
		
		
		//Creamos el detalle osea es como la copia de la tabla temporal(libro) alamacena todo de la tabla temporal
		ArrayList<DevolucionHasLibroPK> detalles = new ArrayList<DevolucionHasLibroPK>();
		// LIBRO es la tabla temporal lo pondra en detalles
		for (Libro x : Devolucion) {
			DevolucionHasLibroPK det = new DevolucionHasLibroPK();

			det.setIdLibro(x.getIdLibro());
			det.setEstado(x.getEstado());
			det.setFechaDevolucion(x.getFecDevolucion());;
		
			detalles.add(det);
		}
		
		
		
		
		
		//Se inserta la boleta
		Fabrica mysql = Fabrica.getFabrica(Fabrica.MYSQL);
		DevolucionDAO dao = mysql.getDevolucionDAO();
		
		//ENVIA LA DEVOLUCION  Y LA TABLA TEMPORAL(copia) al modelo
		dao.inserta(b, detalles);
		
		//limpiamos la sesion osea limpiamos la tabla temporal
		session.removeAttribute("dataDeGrilla"); //elimina ese id de la tabla temporal ya puede crear uno nuevo
		Devolucion.clear(); //limpia
		
		
		//DATOS DE REGRESO AL JSP
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setMensaje("Se registró la devolucion  ");
		objRespuesta.setDatos(Devolucion);//se le envia limpia la devolucion
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
