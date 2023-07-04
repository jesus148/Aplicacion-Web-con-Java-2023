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

import com.google.gson.Gson;


import dao.PrestamoDAO;
import entity.Libro;
import fabricas.Fabrica;

@WebServlet("/buscaLibro")
public class BuscaLibroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static Logger log = Logger.getLogger(BuscaLibroServlet.class.getName());
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.info("En ServletBuscaLibro");
		
		String filtro = request.getParameter("filtro");
		log.info("Filtro -> " + filtro);

		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		PrestamoDAO dao = fabrica.getPrestamoDAO();
		
		ArrayList<Libro> lista = dao.consultaCliente("%" + filtro + "%");
		
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		response.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println(json);
	}

}
