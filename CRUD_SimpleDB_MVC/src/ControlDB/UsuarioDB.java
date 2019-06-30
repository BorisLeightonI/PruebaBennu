package ControlDB;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modelo.Usuario;

public class UsuarioDB {
	
	
	/*Constructor vacío*/
	public UsuarioDB() {}
	
	public List<Usuario> listaSocio() {
        Conexion conexion = new Conexion(); 
        Statement s;
        ResultSet listado;
        List<Usuario> lista = new ArrayList<>();
        Usuario usuario;

		try {
			s = conexion.conectar().createStatement();
			listado = s.executeQuery ("SELECT * FROM socio");
			
			while(listado.next()) {
				usuario = new Usuario();
				usuario.setSocioId(listado.getInt("socioID"));
				usuario.setNombre(listado.getString("nombre"));
				usuario.setEstatura(listado.getInt("estatura"));
				usuario.setEdad(listado.getInt("edad"));
				usuario.setLocalidad(listado.getString("localidad"));
				System.out.println("Número de ID" + usuario.getSocioId());
				lista.add(usuario);
				
			}
			conexion.cerrar();
			return lista;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return lista;
		}
		
        
	}
	
	public void grabaSocio(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
			if(request.getParameter("socioID")!="") {
				  request.setCharacterEncoding("UTF-8");
			   	  Conexion conexion = new Conexion(); 
			      Statement s = null;
				try {
					s = conexion.conectar().createStatement();
			      
			      String consultaNumSocio = "SELECT * FROM socio WHERE socioID="
			                                + Integer.valueOf(request.getParameter("socioID")); 
			      
			      System.out.println("ver si está el socioID: "+consultaNumSocio);
			      
			      ResultSet numeroDeSocios = s.executeQuery (consultaNumSocio);
			      numeroDeSocios.last();
			//******************** Comprueba la existencia del número de socio introducido*******************************      
			      if (numeroDeSocios.getRow() != 0) {
			        System.out.println("Ya existe un socio con el número " + request.getParameter("socioID") + ".");
			      } 
			      else {
			        	String insercion = "INSERT INTO socio VALUES (" + Integer.valueOf(request.getParameter("socioID"))
			                           + ", '" + request.getParameter("nombre")
			                           + "', " + Integer.valueOf(request.getParameter("estatura"))
			                           + ", " + Integer.valueOf(request.getParameter("edad"))
			                           + ", '" + request.getParameter("localidad") + "')";
			        	s.execute(insercion);
			        System.out.println("Socio ingresado correctamente.");
			      }
			      
			      conexion.cerrar();
			      listaSocios(request, response); //Mantiene la página principal con la lista actualizada
			      
				} catch (SQLException | ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				System.out.println("No se puede ingrsar un código ID: '' ");
				response.sendRedirect("index.jsp");
				
			}
	
	}
	
	/**
	 * @param request
	 * @param response
	 */
	public void grabaSocioModificado(HttpServletRequest request, HttpServletResponse response) {
	      try {
			request.setCharacterEncoding("UTF-8");
		      Conexion conexion = new Conexion();
		      Statement s;
		      String actualizacion = "UPDATE socio SET "
                      + "nombre='" + request.getParameter("nombre")
                      + "', estatura=" + Integer.valueOf(request.getParameter("estatura"))
                      + ", edad=" + Integer.valueOf(request.getParameter("edad"))
                      + ", localidad='" + request.getParameter("localidad")
                      + "' WHERE socioID=" + Integer.valueOf(request.getParameter("socioID"));
			
			s = conexion.conectar().createStatement();
			s.execute(actualizacion);
			conexion.cerrar();
			listaSocios(request, response);
			/*RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);*/ 
		    
		    System.out.println("Socio actualizado correctamente.");
		    
		} catch (SQLException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	      


	}
	
	public void modificaSocio(HttpServletRequest request, HttpServletResponse response) {
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("modificaSocio.jsp");
		try {
			dispatcher.forward(request, response);
			
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void borraSocio(HttpServletRequest request, HttpServletResponse response) {
		String socioId = request.getParameter("socioId");
		System.out.println("Socio ID: " + socioId);
		
	      Conexion conexion = new Conexion();
	      Statement s;
		try {
			s = conexion.conectar().createStatement();
			 s.execute ("DELETE FROM socio WHERE socioID=" + socioId);
		      s.close();
		      
		   listaSocios(request, response);
		      
		      System.out.println("Se ha borrado el socio con ID: " + socioId);
		} catch (SQLException | IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

	     
	}
	
	public void listaSocios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getContentLength()!=0) {
			List<Usuario> lista ;
			lista = listaSocio();
			
			request.setAttribute("lista_Usuarios", lista);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}else {
			System.out.println("longitud del request:" + request.getContentLength());
		}

	}

}
