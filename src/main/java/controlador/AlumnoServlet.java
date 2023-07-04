package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.AlumnoDAO;
import entity.Pais;
import entity.Alumno;
import entity.Respuesta;
import fabricas.Fabrica;

@WebServlet("/insertaAlumno")
public class AlumnoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String vnombre = req.getParameter("nombre");
			String vapellido = req.getParameter("apellido");
			String vtelefono =  req.getParameter("telefono");
			String vdni = req.getParameter("dni");
			String vcorreo = req.getParameter("correo");
			String vfechaNaci = req.getParameter("fechaNaci");
			String vpais = req.getParameter("pais");

			Pais objPais = new Pais();
			objPais.setIdPais(Integer.parseInt(vpais));
			
			Alumno objAlumno = new Alumno();
			objAlumno.setNombres(vnombre);
			objAlumno.setApellidos(vapellido);
			objAlumno.setTelefono(vtelefono);
			objAlumno.setDni(vdni);
			objAlumno.setCorreo(vcorreo);
			objAlumno.setFechaNacimiento(Date.valueOf(vfechaNaci));
			objAlumno.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
			objAlumno.setEstado(1);
			objAlumno.setPais(objPais);
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			AlumnoDAO dao = fabrica.getAlumnoDAO();
		
			int insertados = dao.insertaAlumno(objAlumno);
			
			
			Respuesta objRespuesta = new Respuesta();
			if (insertados > 0) {
				objRespuesta.setMensaje("Alumno registrado exitosamente");
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
