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

import dao.AutorDAO;
import entity.Autor;
import fabricas.Fabrica;

@WebServlet("/listaAutorComplejo")
public class ListaAutorComplejoServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		    String nombres = req.getParameter("nombres");
			String apellidos = req.getParameter("apellidos");		
			String vfechaInicio = req.getParameter("fechaInicio");
			String vfechaFin = req.getParameter("fechaFin");
			String telefono = req.getParameter("telefono");
	     	String estado = req.getParameter("estado");
			String grado = req.getParameter("grado");
			
			
					
			//Si la fecha de Inicio es vacio		
			if (vfechaInicio.equals("")) { vfechaInicio = "1900-01-01"; }		
			//Si la fecha de Fin es vacio
			if (vfechaFin.equals("")) { vfechaFin = "2999-12-31"; }
			
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			AutorDAO  dao = fabrica.getAutor();
			
			List<Autor> lstAutor = dao.listaAutorComplejo(
							nombres+"%", 
							apellidos+"%",		
							Date.valueOf(vfechaInicio),
							Date.valueOf(vfechaFin),
							telefono,
							Integer.parseInt(estado),
							Integer.parseInt(grado));
			
			Gson gson = new Gson();
			String json = gson.toJson(lstAutor);

			resp.setContentType("application/json;charset=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println(json);
	}
	
}








