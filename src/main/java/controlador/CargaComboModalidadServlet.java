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

import dao.ModalidadDAO;
import entity.Modalidad;
import fabricas.Fabrica;

@WebServlet("/cargaModalidad")
public class CargaComboModalidadServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ModalidadDAO dao = fabrica.getModalidadDAO();
	
		List<Modalidad> lista = dao.listaModalidad();
		
	
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		
		resp.setContentType("application/json;charset=UTF-8");
		
		
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

}


