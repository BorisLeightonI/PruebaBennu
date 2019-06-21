<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
    <title>Modifica</title>
  </head>
  <body>
<% request.setCharacterEncoding("UTF-8"); %>
      
      Modificación de socio
     <form method="get" action="grabaSocioModificado.jsp">
            <label>Nº de socio:&nbsp;</label><input type="text" size="5" name="socioID" value="<%= request.getParameter("socioID") %>" readonly>
            <label>Nombre:&nbsp;</label><input type="text" size="15" name="nombre" value="<%= request.getParameter("nombre") %>">
            <label>Estatura (en cm):&nbsp;</label><input type="text" size="5" name="estatura" value="<%= request.getParameter("estatura") %>">
            <label>Edad:&nbsp;</label><input type="text" size="5" name="edad" value="<%= request.getParameter("edad") %>">
            <label>Localidad:&nbsp;</label><input type="text" name="localidad" size="20" value="<%= request.getParameter("localidad") %>">
            
            <hr>
            
      <a href="index.jsp">Cancelar</a>
            <button type="submit">Aceptar</button><br><br>
     </form>
  </body>
</html>
