package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


import dao.RevistaDAO;
import fabricas.Fabrica;
import entity.Revista;

@WebServlet("/listaRevistaComplejo")
public class ListaRevistaComplejoServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1 Traer todas las categorias de la base de datos
				Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
				RevistaDAO  dao = fabrica.getRevistaDAO();
			
				String nombre = req.getParameter("nombre");
				String frecuencia =req.getParameter("frecuencia");
				String modalidad = req.getParameter("modalidad");
				String estado = req.getParameter("estado");
				String fechaInicio = req.getParameter("fechaInicio");
				String fechaFin = req.getParameter("fechaFin");  
				//llenado de datos
				
				
			
				//Si la fecha de Inicio es vacio
				if (fechaInicio.equals("")) { fechaInicio = "1900-01-01"; }
				
				//Si la fecha de Fin es vacio
				if (fechaFin.equals("")) { fechaFin = "2999-12-31"; }
				
				List<Revista> lista = dao.listaRevistaComplejo(nombre+"%",frecuencia +"%",
																Integer.parseInt(modalidad),
																Integer.parseInt(estado),
																Date.valueOf(fechaInicio),
																Date.valueOf(fechaFin));
																
				
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
