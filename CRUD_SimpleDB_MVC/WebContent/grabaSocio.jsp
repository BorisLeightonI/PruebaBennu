<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ControlDB.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <title>Socios</title>
  </head>
  <body>
    <br>
    <form action="index.jsp">
    <button type="submit">Volver al home</button>>
    </form>
<%//********************************************************************************************************
            
      Conexion conexion = new Conexion(); 
      Statement s = conexion.conectar().createStatement();
      

      request.setCharacterEncoding("UTF-8");
      String consultaNumSocio = "SELECT * FROM socio WHERE socioID="
                                + Integer.valueOf(request.getParameter("socioID"));      
      
      ResultSet numeroDeSocios = s.executeQuery (consultaNumSocio);
      numeroDeSocios.last();
//******************** Comprueba la existencia del número de socio introducido*******************************      
      if (numeroDeSocios.getRow() != 0) {
        out.println("Ya existe un socio con el número " + request.getParameter("socioID") + ".");
      } 
      else {
        	String insercion = "INSERT INTO socio VALUES (" + Integer.valueOf(request.getParameter("socioID"))
                           + ", '" + request.getParameter("nombre")
                           + "', " + Integer.valueOf(request.getParameter("estatura"))
                           + ", " + Integer.valueOf(request.getParameter("edad"))
                           + ", '" + request.getParameter("localidad") + "')";
        	s.execute(insercion);
        out.println("Socio ingresado correctamente.");
      }
      
      conexion.cerrar();
//****************************************************************************************************************
%>

  </body>
</html>