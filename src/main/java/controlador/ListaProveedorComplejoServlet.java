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

import dao.ProveedorDAO;
import entity.Proveedor;
import fabricas.Fabrica;

@WebServlet("/listaProveedorComplejo")
public class ListaProveedorComplejoServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String razon = req.getParameter("razon");
			String ruc = req.getParameter("ruc");
			String contacto = req.getParameter("contacto");
			String estado = req.getParameter("estado");
			String pais = req.getParameter("pais");
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			ProveedorDAO  dao = fabrica.getProveedorDAO();
			
			List<Proveedor> lista = dao.listaCompleja(
							razon+"%",
							ruc+"%",
							contacto+"%",
							Integer.parseInt(estado),
							Integer.parseInt(pais));
			
			Gson gson = new Gson();
			
			String json = gson.toJson(lista);

			resp.setContentType("application/json;charset=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println(json);
	}
	
}








