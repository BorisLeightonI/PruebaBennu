<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ControlDB.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
  
    <title>Graba</title>
  </head>
  <body>
 <%
//********************************************************************************************************
      request.setCharacterEncoding("UTF-8");
      String actualizacion = "UPDATE socio SET "
                           + "nombre='" + request.getParameter("nombre")
                           + "', estatura=" + Integer.valueOf(request.getParameter("estatura"))
                           + ", edad=" + Integer.valueOf(request.getParameter("edad"))
                           + ", localidad='" + request.getParameter("localidad")
                           + "' WHERE socioID=" + Integer.valueOf(request.getParameter("socioID"));
      
      Conexion conexion = new Conexion();
      Statement s = conexion.conectar().createStatement();
      s.execute(actualizacion);
      out.println("Socio actualizado correctamente.");
      
      conexion.cerrar();
//**********************************************************************************************************
%>
    <br>
    <form action="index.jsp">
    	<button type="submit"> Página principal</button>
    </form>
    
  </body>
</html>