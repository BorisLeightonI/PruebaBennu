<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ControlDB.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
    <title>Club de socios</title>
  </head>

  <body>
		   
        <h2>Club de socios</h2>

        <table>
        <tr><th>Nº de socio</th><th>Nombre</th><th>Estatura</th><th>Edad</th><th>Localidad</th></tr>
        <form method="get" action="grabaSocio.jsp">
          <tr><td><input type="text" name="socioID" size="5"></td>
              <td><input type="text" name="nombre" size="30"></td>
              <td><input type="text" name="estatura" size="5"></td>
              <td><input type="text" name="edad" size="5"></td>
              <td><input type="text" name="localidad" size="20"></td>
              <td><button type="submit" value="Añadir">Añadir</button></td>
              
          </tr>           
        </form>
        <% //****************************************************************         
          Conexion conexion = new Conexion(); 
          Statement s = conexion.conectar().createStatement();
          ResultSet listado = s.executeQuery ("SELECT * FROM socio");
        
          while (listado.next()) {
            out.println("<tr><td>");
            out.println(listado.getString("socioID") + "</td>");
            out.println("<td>" + listado.getString("nombre") + "</td>");
            out.println("<td>" + listado.getString("estatura") + "</td>");
            out.println("<td>" + listado.getString("edad") + "</td>");
            out.println("<td>" + listado.getString("localidad") + "</td>");
          //******************************************************************  
        %>
        <td>
        <form method="get" action="modificaSocio.jsp">
		  <input type="hidden" name="socioID" value="<%=listado.getString("socioID") %>">
          <input type="hidden" name="nombre" value="<%=listado.getString("nombre") %>">
          <input type="hidden" name="estatura" value="<%=listado.getString("estatura") %>">
          <input type="hidden" name="edad" value="<%=listado.getString("edad") %>">
          <input type="hidden" name="localidad" value="<%=listado.getString("localidad") %>">
					<button type="submit">Modificar</button>
				</form>
				</td>
				<td>
        <form method="get" action="borraSocio.jsp">
          <input type="hidden" name="socioID" value="<%=listado.getString("socioID") %>"/>
          <button type="submit">Eliminar</button>
        </form>
        </td>
        <%
          } // end-while   

          conexion.cerrar();
        %>

        </table>    
  </body>
</html>