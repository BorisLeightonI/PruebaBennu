<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ControlDB.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
<%
//**************************************************************************************      
      Conexion conexion = new Conexion();
      Statement s = conexion.conectar().createStatement();

      s.execute ("DELETE FROM socio WHERE socioID=" + request.getParameter("socioID"));
      s.close();
//**************************************************************************************
%>	
    <script>
    	document.location = "index.jsp"
    </script> 
  </body>
</html>
