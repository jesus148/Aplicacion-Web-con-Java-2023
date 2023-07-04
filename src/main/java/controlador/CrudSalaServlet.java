package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


import dao.SalaDAO;


import entity.Respuesta;
import entity.Sala;
import entity.Sede;
import fabricas.Fabrica;



@WebServlet("/crudSala")
public class CrudSalaServlet extends HttpServlet {


	
	
	private static final long serialVersionUID = 1L;
	
	
	

	//esto q esta aca es para q basicamente algo asi como mostrar mensajes ya sea error o correcto .etc
	private static Logger log = Logger.getLogger(CrudSalaServlet.class.getName());

	
	

	
	
	
	//RECORDAR CUANDO LLAMEN O ENTREN @WebServlet("/crudCliente") 
	//automaticamente le redigira en este metodo service apartir de aca ya lo redirecciona al metodo que pide
	//este servelt sera para hacer todas las peticiones
	//de aca rediccionara alos demas metodos
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudSalaServlet >> service");//mensaje
		//dependiendo de la variable q le envies
		//ESTE ES EL PARAMETRO , recordar escribir igual el parametro  "metodo" en el jsp
		String vmetodo = req.getParameter("metodo");
		//dependiendo del parametro enviado te redicciona al metodo respectivo
		switch (vmetodo) {
		case "lista":
			lista(req, resp);
			break;
		case "inserta":
			inserta(req, resp);
			break;
		case "actualiza":
			actualiza(req, resp);
			break;
		case "eLogica":
			eliminacionLogica(req, resp);
			break;
		case "eFisica":
			eliminacionFisica(req, resp);
			break;
		}
	}
	
	
	
	
	
	
	
	
	
	


	
	//METODO PARA LISTAR CLIENTE + CATEGORIA(NOMBRE)
	//este metodo listara cuando hayamos insertado o eliminado , actualizara y listara toda la data pero usamos este metodo con un parametro
	protected void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudSalaServlet >> lista");

		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		SalaDAO dao = fabrica.getSala();

		
		//recordar q cuando llamamos a este metodo y no le pasamos un parametro hara un listado de toda la tabla 
		//pq tiene el % : significa que lista todo algo parecido
		String filtro = req.getParameter("filtro");
		//toda la data obtenida se almacena en el array lista
		List<Sala> lista = dao.listaSala(filtro + "%");

		
		
		//se lo enviamos de regreso al q llame este metodo osea se lo mandamos de regreso al jsp , pero convertido en json 
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		resp.setContentType("application/json;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.println(json);
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	//INSERTA SOLO A SALA
	protected void inserta(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudSalaServlet >> inserta");
		

		
		//parametros del ventana modal registra
		//estos parametro son los name de los inputs de la ventana modal registra cliente o edita cliente deben ser iguales
		//recogiendo la data del usuario pa insertar cliente
		String vnumero= req.getParameter("numero");
		String vpiso = req.getParameter("piso");
		String vnumAlu = req.getParameter("numAlu");
		String vrecursos= req.getParameter("recursos");
		String vsede = req.getParameter("sede");
	

		Sede objSede = new Sede();
		objSede.setIdSede(Integer.parseInt(vsede));
		
		//recordar recomendable q sea ordenado segun la tabla 
		//y ademas lo + importante convertir los datos lo + importante segun requiera la bd mysql
		Sala objSala = new Sala();
		objSala.setNumero(vnumero);
		objSala.setPiso(Integer.parseInt(vpiso));
		objSala.setNumAlumnos(Integer.parseInt(vnumAlu));
		objSala.setRecursos(vrecursos);
		objSala.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
		objSala.setEstado(1);
		objSala.setSede(objSede);
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		SalaDAO dao = fabrica.getSala();
	
		int insertados = dao.insertaSala(objSala);
		
		
		
		
		//ESTO Q ESTA ACA ES PARA QU1 CUANDO INSERTEMOS O ELIMINEMOS O ACTULIZEMOS SE MUESTRA AUTO EN LA TABL Y NO SEa NESECARIO DAR CLICK 
		// EN EL BOTON FILTRAR osea se actulize inmediato como ajax
		//listamos cliente % osea todo , despues de insertar recordar eso osea el metodo
		List<Sala> lista=dao.listaSala("%");
		
		
		
		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
			objRespuesta.setMensaje("Registro exitoso");
		}else {
			objRespuesta.setMensaje("Error en el registro");
		}
		
		
		//VALORES DE REGRESO AL JSP
		//este valor de json es el valor q se devuelve osea cuando se ejcuta este metod , el q ejecuta este le devuevle este mensaje osea el jsp
		//el mensaje se devuelve al jsp pa comfirmar el registro
		
		
		
		//array de la clase respuesta ? que es incognito le pasamos la data de lista cliente q tiene toda la data de cliente , luego obviamente de
		// registrar , osea le pasamos pa volver actulizar inmediatemente luego de registrar
		objRespuesta.setDatos(lista);
		
		
		
		//todo respuesta q tiene el mensaje y data del array pa listar todo cliente lo convierte en json y le retorna al jsp
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
		
		
		


	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//METODO ACTULIZA SOLO SALA

	protected void actualiza(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudSalaSerlevt >> actualiza");
		
		
		
		
		
		
		

		//parametros del ventana modal actualiza
				//estos parametro son los name de los inputs de la ventana modal actualiza cliente deben ser iguales
				//recogiendo la data del usuario pa actualiza cliente
		      String vidSala = req.getParameter("idSala");
				String vnumero = req.getParameter("numero");
				String vpiso = req.getParameter("piso");
				String vnumAlum = req.getParameter("numAlum");
				String vrecursos = req.getParameter("recursos");
				String vestado = req.getParameter("estado");
				String vsede = req.getParameter("sede");

				Sede objSede = new Sede();
				objSede.setIdSede(Integer.parseInt(vsede));
				
				//recordar recomendable q sea ordenado segun la tabla 
				//y ademas lo + importante convertir los datos lo + importante segun requiera la bd mysql
				Sala objSala = new Sala();
				objSala.setIdSala(Integer.parseInt(vidSala));
				objSala.setNumero(vnumero);
				objSala.setPiso(Integer.parseInt(vpiso));
				objSala.setNumAlumnos(Integer.parseInt(vnumAlum));
				objSala.setRecursos(vrecursos);
				objSala.setEstado(Integer.parseInt(vestado));
				objSala.setSede(objSede);
			
				
				Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
				SalaDAO dao = fabrica.getSala();
			
				int insertados = dao.actualizaSala(objSala);
				
				
				
				
				//ESTO Q ESTA ACA ES PARA QU1 CUANDO INSERTEMOS O ELIMINEMOS O ACTULIZEMOS SE MUESTRA AUTO EN LA TABL Y NO SEa NESECARIO DAR CLICK 
				// EN EL BOTON FILTRAR osea se actulize inmediato como ajax
				//listamos cliente % osea todo , despues de insertar recordar eso osea el metodo
				List<Sala> lista=dao.listaSala("%");
				
				
				
				Respuesta objRespuesta = new Respuesta();
				if (insertados > 0) {
					objRespuesta.setMensaje("Actulizacion  exitosa");
				}else {
					objRespuesta.setMensaje("Error en el actulizar");
				}
				
				
				//VALORES DE REGRESO AL JSP
				//este valor de json es el valor q se devuelve osea cuando se ejcuta este metod , el q ejecuta este le devuevle este mensaje osea el jsp
				//el mensaje se devuelve al jsp pa comfirmar el registro
				
				
				
				//array de la clase respuesta ? que es incognito le pasamos la data de lista cliente q tiene toda la data de cliente , luego obviamente de
				// registrar , osea le pasamos pa volver actulizar inmediatemente luego de registrar
				objRespuesta.setDatos(lista);
				
				
				
				//todo respuesta q tiene el mensaje y data del array pa listar todo cliente lo convierte en json y le retorna al jsp
				Gson gson = new Gson();
				String json = gson.toJson(objRespuesta);
				
				resp.setContentType("application/json;charset=UTF-8");
				
				PrintWriter out = resp.getWriter();
				out.println(json);
		
		
		
		
		
		
		
		


	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	protected void eliminacionLogica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudSalaServlet >> eliminacionLogica");
		
		
		

		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		SalaDAO dao = fabrica.getSala();
		
		//parametro q nesecita el metodo , escribir en el jsp debe ser igual
		String idSala  =req.getParameter("idSala");
	
		//primero busca cliente
		Sala objSala= dao.buscaSala(Integer.parseInt(idSala));
		
		//de ese cliente cambia solo su estado
		//si es 0 cambia a 1 y si es otro numero en este caso 1 cambia a cero
		int estadoNuevo=objSala.getEstado() == 0 ? 1:0 ;
		
		//y ese estado moficado le volvemos agregar al cliente
		objSala.setEstado(estadoNuevo);
		
		//con ese llamamos al metodo actualiza y le pasamos ese nuevo objeto actulizao con el estado moficiado
		dao.actualizaSala(objSala );
		
		
		
		
		
		//ESTO Q ESTA ACA ES PARA QU1 CUANDO INSERTEMOS O ELIMINEMOS O ACTULIZEMOS SE MUESTRA AUTO EN LA TABL Y NO SEa NESECARIO DAR CLICK 
				// EN EL BOTON FILTRAR osea se actulize inmediato como ajax
				//listamos cliente % osea todo , despues de insertar recordar eso osea el metodo
				List<Sala> lista=dao.listaSala("%");
				
		
		
		Respuesta objRespuesta = new Respuesta();
	
		
		//este valor de json es el valor q se devuelve osea cuando se ejcuta este metod , el q ejecuta este le devuevle este mensaje osea el jsp
		//el mensaje se devuelve al jsp pa comfirmar el registro
		
		
		//array de la clase respuesta ? que es incognito le pasamos la data de lista cliente q tiene toda la data de cliente , luego obviamente de
		// registrar , osea le pasamos pa volver actulizar inmediatemente luego de registrar
		objRespuesta.setDatos(lista);
		
		
		//todo respuesta q tiene el mensaje y data del array pa listar todo cliente lo convierte en json y le retorna al jsp
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
		
		
		


	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	protected void eliminacionFisica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudClienteServlet >> eliminacionFisica");

		
		
	
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		SalaDAO dao = fabrica.getSala();
		
		//parametro q nesecita el metodo , escribir en el jsp debe ser igual
		String idSala  =req.getParameter("idSala");
	
		//convierte a int el id 
		int eliminados = dao.eliminaSala(Integer.parseInt(idSala));
		
		
		//ESTO Q ESTA ACA ES PARA QU1 CUANDO INSERTEMOS O ELIMINEMOS O ACTULIZEMOS SE MUESTRA AUTO EN LA TABL Y NO SEa NESECARIO DAR CLICK 
				// EN EL BOTON FILTRAR osea se actulize inmediato como ajax
				//listamos cliente % osea todo , despues de insertar recordar eso osea el metodo
				List<Sala> lista=dao.listaSala("%");
				
		
		
		Respuesta objRespuesta = new Respuesta();
		if (eliminados > 0) {
			objRespuesta.setMensaje("eliminacion exitoso");
		}else {
			objRespuesta.setMensaje("error al eliminar");
		}
		
		//este valor de json es el valor q se devuelve osea cuando se ejcuta este metod , el q ejecuta este le devuevle este mensaje osea el jsp
		//el mensaje se devuelve al jsp pa comfirmar el registro
		
		
		//array de la clase respuesta ? que es incognito le pasamos la data de lista cliente q tiene toda la data de cliente , luego obviamente de
		// registrar , osea le pasamos pa volver actulizar inmediatemente luego de registrar
		objRespuesta.setDatos(lista);
		
		
		//todo respuesta q tiene el mensaje y data del array pa listar todo cliente lo convierte en json y le retorna al jsp
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
		

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
