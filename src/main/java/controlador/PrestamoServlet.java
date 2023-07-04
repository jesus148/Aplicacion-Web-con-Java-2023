package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.PrestamoDAO;
import entity.Libro;
import entity.Prestamo;
import entity.Respuesta;
import entity.Usuario;
import fabricas.Fabrica;
import entity.PrestamoHasLibroPK;



@WebServlet("/boleta")
public class PrestamoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(PrestamoServlet.class.getName());
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String metodo = request.getParameter("metodo");
		if(metodo.equals("agregaSeleccion")){
			agregar(request, response);
		}else if(metodo.equals("eliminaSeleccion")){
			eliminar(request, response);
		}else if(metodo.equals("registraBoleta")){
			registra(request, response);
		}
	}

	@SuppressWarnings("unchecked")
	protected void agregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.info("En agregar seleccion");
		
		String idLibro = request.getParameter("idLibro");
		String titulo = request.getParameter("titulo");
		String anio = request.getParameter("anio");
		String serie = request.getParameter("serie");
		
		int idLib = Integer.parseInt(idLibro);
		int ani = Integer.parseInt(anio);
		
				
		ArrayList<Libro> prestamo  ;
		
		//Se verifica si existe en sesion
		HttpSession session = request.getSession();
		if(session.getAttribute("dataDeGrilla") == null){
			prestamo = new ArrayList<Libro>();
		}else{
			prestamo = (ArrayList<Libro>)session.getAttribute("dataDeGrilla");
		}
		
		//Se crear el objeto
		Libro p = new Libro();
		p.setIdLibro(idLib);
		p.setTitulo(titulo);
		p.setAnio(ani);
		p.setSerie(serie);

		
		boolean noExiste = true;
		//se verifica los repetidos
		for (int i = 0; i < prestamo.size(); i++) {
			if(prestamo.get(i).getIdLibro() == idLib){
				prestamo.set(i, p);
				noExiste = false;
				break;
			}
		}
		
		//Si no existe se agrega
		if(noExiste){
			prestamo.add(p);
		}
		
		//la lista se agrega a sesion
		session.setAttribute("dataDeGrilla", prestamo);
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setMensaje("Se abgregó el Libro >>  " + idLib +" >>> " + titulo);
		objRespuesta.setDatos(prestamo);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		
			
	}
	
	@SuppressWarnings("unchecked")
	protected void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.info("En eliminar seleccion");
		
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		
		ArrayList<Libro> prestamo = (ArrayList<Libro>)session.getAttribute("dataDeGrilla");

		//Se elimina
		for (Libro p : prestamo) {
			if(p.getIdLibro() == Integer.parseInt(id)){
				prestamo.remove(p);
				break;
			}
		}
		//la lista se agrega a sesion
		session.setAttribute("dataDeGrilla", prestamo);
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setMensaje("Se eliminó el producto  " + id);
		objRespuesta.setDatos(prestamo);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(json);
	}
	
	@SuppressWarnings("unchecked")
	protected void registra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.info("En registra boleta");
		
		HttpSession session = request.getSession();

		//Boleta que esta en sesion
		ArrayList<Libro> boleta = (ArrayList<Libro>)session.getAttribute("dataDeGrilla");
		
		//Cliente
		String alumno = request.getParameter("idAlumno");
		int idAlumno = Integer.parseInt(alumno);
		
		//Usuario
		Usuario objusuario = (Usuario) session.getAttribute("objUsuario");
		
		//Creamos la Boleta
		Prestamo b = new Prestamo();
		b.setIdAlumno(idAlumno);
		b.setIdUsuario(objusuario.getIdUsuario());
		
		
		//Creamos el detalle
			ArrayList<PrestamoHasLibroPK> detalles = new ArrayList<PrestamoHasLibroPK>();
			for (Libro x : boleta) {
			PrestamoHasLibroPK det = new PrestamoHasLibroPK();
			det.setIdLibro(x.getIdLibro());
			detalles.add(det);
				}
	
		
		//Se inserta la boleta
		Fabrica mysql = Fabrica.getFabrica(Fabrica.MYSQL);
		PrestamoDAO dao = mysql.getPrestamoDAO();
		
		dao.inserta(b, detalles);
		
		//limpiamos la sesion
		session.removeAttribute("dataDeGrilla");
		boleta.clear();
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setMensaje("Se registró préstamo ");
		objRespuesta.setDatos(boleta);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		
	}

}
