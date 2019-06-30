<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
    <title>Modifica</title>
  </head>
  <body>
<% request.setCharacterEncoding("UTF-8"); %>
      
     <h2>Modificación de socio</h2><br>
     <form method="get" action="Control">
     <input type="hidden" name="clave" value="gravaModificado">
            <label>Nº de socio:&nbsp;</label><input type="text" size="5" name="socioID" value="<%= request.getParameter("socioID") %>" readonly>
            <label>Nombre:&nbsp;</label><input type="text" size="15" name="nombre" value="<%= request.getParameter("nombre") %>">
            <label>Estatura (en cm):&nbsp;</label><input type="text" size="5" name="estatura" value="<%= request.getParameter("estatura") %>">
            <label>Edad:&nbsp;</label><input type="text" size="5" name="edad" value="<%= request.getParameter("edad") %>">
            <label>Localidad:&nbsp;</label><input type="text" name="localidad" size="20" value="<%= request.getParameter("localidad") %>">
            
            <hr>
      <form method="get" action="Control">      
      <button type="submit">Cancelar</button><br><br>
      <input type="hidden" name="clave" value="listar">
      </form>
      
       <button type="submit">Aceptar</button>
     </form>
  </body>
</html>
