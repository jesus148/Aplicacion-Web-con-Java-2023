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

import dao.CategoriaDAO;
import entity.Categoria;
import fabricas.Fabrica;

@WebServlet("/cargaCategoria")
public class CargaComboCategoriaServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//1 Traer todas las categorias de la base de datos
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		CategoriaDAO dao = fabrica.getCategoria();
	
		List<Categoria> lista = dao.listaCategoria();
		
		//2 Convertir las categorias en formato JSON
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		//3 Se notifica al chrome el tipo de archivo
		resp.setContentType("application/json;charset=UTF-8");
		
		//4 Se envía al chrome
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

}
