package ControlDB;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ControlDB.Conexion;
import Modelo.Usuario;

/**
 * Servlet implementation class Control
 */
@WebServlet("/Control")
public class Control extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		UsuarioDB usuarioDB = new UsuarioDB();
		String clave = request.getParameter("clave");
		System.out.println("Parámetro: " + clave);
		
		try {
			switch (clave) {
			case "listar":				
				usuarioDB.listaSocios(request, response);
				break;
				
			case "agregar":
				
				usuarioDB.grabaSocio(request, response);				
				break;
				
			case "modificar":
				
				usuarioDB.modificaSocio(request, response);				
				break;
				
			case "gravaModificado":
				
				usuarioDB.grabaSocioModificado(request, response);
				break;
				
			case "eliminar":				
				usuarioDB.borraSocio(request, response);
				break;
				
			default:
				System.out.println("Se ha ingrsado clave: ");
				break;

			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//response.sendRedirect("index.jsp");
		
				
		
		
	}
	

	

	

}
