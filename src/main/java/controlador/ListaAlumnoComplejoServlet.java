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

import dao.AlumnoDAO;
import entity.Alumno;
import fabricas.Fabrica;

@WebServlet("/listaAlumnoComplejo")
public class ListaAlumnoComplejoServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String nombre = req.getParameter("nombre");
			String dni = req.getParameter("dni");
			String estado = req.getParameter("estado");
			String pais = req.getParameter("pais");

			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			AlumnoDAO dao = fabrica.getAlumnoDAO();
			
			List<Alumno> listAlumno = dao.listaAlumnoComplejo(
							nombre+"%",
							dni,
							Integer.parseInt(estado), 
							Integer.parseInt(pais));
			
			Gson gson = new Gson();
			String json = gson.toJson(listAlumno);

			resp.setContentType("application/json;charset=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println(json);
	}
	
}






