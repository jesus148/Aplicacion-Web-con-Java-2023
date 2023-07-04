package controlador;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.LibroDAO;
import entity.Categoria;
import entity.Libro;
import entity.Respuesta;
import fabricas.Fabrica;

@WebServlet("/registraLibro")
public class LibroServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String vtitulo = req.getParameter("titulo");
			String vanio = req.getParameter("anio");
			String vserie = req.getParameter("serie");
			String vcategoria = req.getParameter("categoria");

			Categoria objCategoria = new Categoria();
			objCategoria.setIdCategoria(Integer.parseInt(vcategoria));
			
			Libro objLibro = new Libro();
			objLibro.setTitulo(vtitulo);
			objLibro.setAnio(Integer.parseInt(vanio));
			objLibro.setSerie(vserie);
			objLibro.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
			objLibro.setEstado(1);
			objLibro.setCategoria(objCategoria);
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			LibroDAO dao = fabrica.getLibro();
		
			int insertados = dao.insertaLibro(objLibro);
			
			
			Respuesta objRespuesta = new Respuesta();
			if (insertados > 0) {
				objRespuesta.setMensaje("Registro exitoso");
			}else {
				objRespuesta.setMensaje("Error en el registro");
			}
			
			Gson gson = new Gson();
			String json = gson.toJson(objRespuesta);
			
			resp.setContentType("application/json;charset=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println(json);
	}

}
