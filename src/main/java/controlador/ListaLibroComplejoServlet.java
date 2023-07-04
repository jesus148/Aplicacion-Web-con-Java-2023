package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.LibroDAO;
import entity.Libro;
import fabricas.Fabrica;

@WebServlet("/listaLibroComplejo")
public class ListaLibroComplejoServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String titulo = req.getParameter("titulo");
			String anio = req.getParameter("anio");
			String serie = req.getParameter("serie");
			String estado = req.getParameter("estado");
			String categoria = req.getParameter("categoria");
			
			
					
			//Si la fecha de Inicio es vacio
			
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			LibroDAO  dao = fabrica.getLibro();
			
			List<Libro> lstLibro = dao.listaCompleja(
							titulo+"%", 
							anio,
							serie+"%", 
							Integer.parseInt(estado),
							Integer.parseInt(categoria));
			
			Gson gson = new Gson();
			String json = gson.toJson(lstLibro);

			resp.setContentType("application/json;charset=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println(json);
	}
	
}








