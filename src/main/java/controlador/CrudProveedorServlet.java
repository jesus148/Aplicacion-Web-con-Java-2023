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

import dao.ProveedorDAO;
import entity.Pais;
import entity.Proveedor;
import entity.Respuesta;
import fabricas.Fabrica;

@WebServlet("/crudProveedor")
public class CrudProveedorServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(CrudProveedorServlet.class.getName());
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudProveedorServlet >> service");
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
			eliminacionLogica(req, resp);
			break;
		case "eFisica":
			eliminacionFisica(req, resp);
			break;
		}
	}
		protected void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			log.info(">> CrudProveedorServlet >> lista");
	
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			ProveedorDAO dao = fabrica.getProveedorDAO();
	
			String filtro = req.getParameter("filtro");
			List<Proveedor> lista = dao.listaProveedor(filtro + "%");
	
			Gson gson = new Gson();
			String json = gson.toJson(lista);
	
			resp.setContentType("application/json;charset=UTF-8");
	
			PrintWriter out = resp.getWriter();
			out.println(json);
		}

		protected void actualiza(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			log.info(">>> crudProveedor >>> actualiza");
			
			String vidProveedor = req.getParameter("idProveedor");
			String vrazon = req.getParameter("razon");
			String vruc = req.getParameter("ruc");
			String vdireccion = req.getParameter("direccion");
			String vcelular = req.getParameter("celular");
			String vcontacto = req.getParameter("contacto");
			String vpais = req.getParameter("pais");
			String vestado = req.getParameter("estado");
			
			Pais objPais = new Pais();
			objPais.setIdPais(Integer.parseInt(vpais));
			
			Proveedor objProveedor = new Proveedor();
			objProveedor.setIdProveedor(Integer.parseInt(vidProveedor));
			objProveedor.setRazonsocial(vrazon);
			objProveedor.setRuc(vruc);
			objProveedor.setDireccion(vdireccion);
			objProveedor.setCelular(vcelular);
			objProveedor.setContacto(vcontacto);
			objProveedor.setPais(objPais);
			objProveedor.setEstado(Integer.parseInt(vestado));
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			ProveedorDAO dao = fabrica.getProveedorDAO();
		
			int insertados = dao.actualizaProveedor(objProveedor);
			List<Proveedor> lista = dao.listaProveedor("%");
			
			Respuesta objRespuesta = new Respuesta();
			if (insertados > 0) {
				objRespuesta.setMensaje("Actualización exitosa");
			}else {
				objRespuesta.setMensaje("Error al actualizar");
			}
			objRespuesta.setDatos(lista);
			
			Gson gson = new Gson();
			String json = gson.toJson(objRespuesta);
			
			resp.setContentType("application/json;charset=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println(json);
		}
		
		protected void inserta(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			log.info(">>> crudProveedor >>> inserta");
			
			String vrazon = req.getParameter("razon");
			String vruc = req.getParameter("ruc");
			String vdireccion = req.getParameter("direccion");
			String vcelular = req.getParameter("celular");
			String vcontacto = req.getParameter("contacto");
			String vpais = req.getParameter("pais");
			
			Pais objPais = new Pais();
			objPais.setIdPais(Integer.parseInt(vpais));
			
			Proveedor objProveedor = new Proveedor();
			objProveedor.setRazonsocial(vrazon);
			objProveedor.setRuc(vruc);
			objProveedor.setDireccion(vdireccion);
			objProveedor.setCelular(vcelular);
			objProveedor.setContacto(vcontacto);
			objProveedor.setPais(objPais);
			objProveedor.setEstado(1);
			objProveedor.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			ProveedorDAO dao = fabrica.getProveedorDAO();
		
			int insertados = dao.insertaProveedor(objProveedor);
			List<Proveedor> lista = dao.listaProveedor("%");
			
			Respuesta objRespuesta = new Respuesta();
			if (insertados > 0) {
				objRespuesta.setMensaje("Registro exitoso");
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
		protected void eliminacionLogica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			log.info(">>> crudProveedor >>> eliminacionLogica");
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			ProveedorDAO dao = fabrica.getProveedorDAO();
		
			String idProveedor = req.getParameter("idProveedor");
			
			Proveedor objProveedor = dao.buscaProveedor(Integer.parseInt(idProveedor));
			int estadoNuevo = objProveedor.getEstado() == 0 ? 1 : 0;
			objProveedor.setEstado(estadoNuevo);
			
			dao.actualizaProveedor(objProveedor);
			List<Proveedor> lista = dao.listaProveedor("%");
			
			Respuesta objRespuesta = new Respuesta();
			objRespuesta.setDatos(lista);
			
			Gson gson = new Gson();
			String json = gson.toJson(objRespuesta);
			resp.setContentType("application/json;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println(json);
		}
		protected void eliminacionFisica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			log.info(">>> crudProveedor >>> eliminacionFisica");
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			ProveedorDAO dao = fabrica.getProveedorDAO();
		
			String idProveedor = req.getParameter("idProveedor");
			
			int eliminados = dao.eliminaProveedor(Integer.parseInt(idProveedor));
			List<Proveedor> lista = dao.listaProveedor("%");
			
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

