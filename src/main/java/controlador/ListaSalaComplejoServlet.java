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

import dao.SalaDAO;
import entity.Sala;
import fabricas.Fabrica;



@WebServlet("/listaSalaComplejo")
public class ListaSalaComplejoServlet  extends HttpServlet {

	
	
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
		//declarando las variables donde se almacenan la data envia desde el jsp
	//ademas estos req.getParameter("nombre") : recomendable que sean igual al name del input del jsp o si no poner otro nombre es igual
		//debe ser igual al script de jsp metodo lista abajo estos getParameter
			String numero = req.getParameter("numero");
			String piso = req.getParameter("piso");
			String recursos = req.getParameter("recursos");
			String estado = req.getParameter("estado");
			String sede = req.getParameter("sede");

			
			
			if (piso.equals("")) { piso = "0"; }
			
			
			
			
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			SalaDAO  dao = fabrica.getSala();
			// Date.valueOf : convierte  de string a date
			//lo pongo asi para saber el error 
			List<Sala> lstSala = dao.listaCompleja(
					       numero+"%", 
							Integer.parseInt(piso ) , 
							recursos + "%",
							Integer.parseInt(estado), 
							Integer.parseInt(sede)
							);
			
			
			
			
			//recibe la data y se lo envia al jsp para listar
			//serialiaza los datos 
			Gson gson = new Gson();
			String json = gson.toJson(lstSala);

			resp.setContentType("application/json;charset=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println(json);
		
		
		
		
		
		
		
	}
	
	

}
