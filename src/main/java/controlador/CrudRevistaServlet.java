package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.RevistaDAO;
import entity.Modalidad;
import entity.Respuesta;
import entity.Revista;
import fabricas.Fabrica;

@WebServlet("/crudRevista")
public class CrudRevistaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static Logger Log = Logger.getLogger(CrudRevistaServlet.class.getName());

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Log.info(">> CrudRevistaServlet >> service");
		String vmetodo = req.getParameter("metodo");
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
			eliminacionActIna(req, resp);
			break;
		case "eFisica":
			eliminacionFisica(req, resp);
			break;

		}
	}

	protected void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Log.info(">> CrudRevistaServlet >> lista");
		
		// 1 Traer todas las categorias de la base de datos
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		RevistaDAO dao = fabrica.getRevistaDAO();

		String filtro = req.getParameter("filtro");
		List<Revista> lista = dao.listaRevistaPorNombre(filtro + "%");

		// 2 Convertir las categorias en formato JSON
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		// 3 Se notifica al chrome el tipo de archivo
		resp.setContentType("application/json;charset=UTF-8");

		// 4 Se envía al chrome
		PrintWriter out = resp.getWriter();
		out.println(json);

	}

	protected void inserta(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Log.info(">> CrudRevistaServlet >> inserta");
		String vnombre = req.getParameter("nombre");
		String vfrecuencia = req.getParameter("frecuencia");
		String vfechaCreacion = req.getParameter("fechaCreacion");
		String vmodalidad = req.getParameter("modalidad");

		Modalidad objModalidad = new Modalidad();
		objModalidad.setIdModalidad(Integer.parseInt(vmodalidad));
		
		Revista objRevista = new Revista();
		objRevista.setNombre(vnombre);
		objRevista.setFrecuencia(vfrecuencia);
		objRevista.setFechaCreacion(Date.valueOf(vfechaCreacion));
		objRevista.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
		objRevista.setEstado(1);
		objRevista.setModalidad(objModalidad);
		
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		RevistaDAO dao = fabrica.getRevistaDAO();
	
		int insertados = dao.insertarRevista(objRevista);
		List<Revista> lista = dao.listaRevistaPorNombre("%");
		
		
		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
			objRespuesta.setMensaje("El registro de revista fue exitosa");
		}else {
			objRespuesta.setMensaje("Error en el registro");
		}
		
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);

	}

	protected void actualiza(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Log.info(">> CrudRevistaServlet >> actualiza");
		String vidRevista = req.getParameter("idRevista");
		String vnombre = req.getParameter("nombre");
		String vfrecuencia = req.getParameter("frecuencia");
		String vfechaCreacion = req.getParameter("fechaCreacion");
		String vmodalidad = req.getParameter("modalidad");

		Modalidad objModalidad = new Modalidad();
		objModalidad.setIdModalidad(Integer.parseInt(vmodalidad));
		
		Revista objRevista = new Revista();
		objRevista.setIdRevista(Integer.parseInt(vidRevista));
		objRevista.setNombre(vnombre);
		objRevista.setFrecuencia(vfrecuencia);
		objRevista.setFechaCreacion(Date.valueOf(vfechaCreacion));
		objRevista.setModalidad(objModalidad);
		
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		RevistaDAO dao = fabrica.getRevistaDAO();
	
		int insertados = dao.actualizaRevista(objRevista);
		List<Revista> lista = dao.listaRevistaPorNombre("%");
		
		
		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
			objRespuesta.setMensaje("La actualización de revista fue exitosa");
		}else {
			objRespuesta.setMensaje("Error en al Actualizar");
		}
		
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);

	}

	protected void eliminacionActIna(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Log.info(">> CrudRevistaServlet >> eliminacionLogica");
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		RevistaDAO dao = fabrica.getRevistaDAO();
	
		String idRevista = req.getParameter("idRevista");
		
		Revista objRevista = dao.buscaRevista(Integer.parseInt(idRevista));
		int estadoNuevo = objRevista.getEstado() == 0 ? 1 : 0;
		objRevista.setEstado(estadoNuevo);
		
		dao.actualizaRevista(objRevista);
		List<Revista> lista = dao.listaRevistaPorNombre("%");
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);

	}

	protected void eliminacionFisica(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Log.info(">> CrudRevistaServlet >> eliminacionFisica");
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		RevistaDAO dao = fabrica.getRevistaDAO();
	
		String idRevista = req.getParameter("idRevista");
		
		int eliminados = dao.eliminaRevista(Integer.parseInt(idRevista));
		
		List<Revista> lista = dao.listaRevistaPorNombre("%");
		
		Respuesta objRespuesta = new Respuesta();
		if (eliminados > 0) {
			objRespuesta.setMensaje("Eliminación exitosa");
		}else {
			objRespuesta.setMensaje("Error al eliminar");
		}
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);

	}

}
