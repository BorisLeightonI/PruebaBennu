<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<!--    <meta http-equiv="Refresh" content="5; url=https://localhost:8080/CRUD_SimpleDB/Control?clave=listar">--> 
  
    <title>Club de socios</title>
  </head>
  
  

  <body>
		   
        <h2>Club de socios</h2>
 
        <table>
        <tr><th>Nº de socio</th><th>Nombre</th><th>Estatura</th><th>Edad</th><th>Localidad</th></tr>
        
        
        <form method="get" action="Control">
        <input type="hidden" name="clave" value="agregar">
          <tr><td><input type="text" name="socioID" size="5"></td>
              <td><input type="text" name="nombre" size="10"></td>
              <td><input type="text" name="estatura" size="5"></td>
              <td><input type="text" name="edad" size="5"></td>
              <td><input type="text" name="localidad" size="20"></td>
              <td><button type="submit" value="Añadir">Añadir</button></td>
              
           
              
          </tr>           
        </form>
        
        <form method="get" action="Control">
          <input type="hidden" name="clave" value="listar"/>
          <button type="submit">Listar</button>
        </form>
        <br>
    <c:forEach var = "tempUsuarios" items="${lista_Usuarios}">    
    	<tr>
    		<td>${tempUsuarios.socioId }</td>
    		<td>${tempUsuarios.nombre }</td>
    		<td>${tempUsuarios.estatura }</td>
    		<td>${tempUsuarios.edad }</td>
    		<td>${tempUsuarios.localidad }</td>
    	
    	<td>
        <form method="get" action="Control">
       	  <input type="hidden" name="clave" value="modificar">

          <input type="hidden" name="socioID" value="${tempUsuarios.socioId }">
          <input type="hidden" name="nombre" value="${tempUsuarios.nombre }">
          <input type="hidden" name="estatura" value="${tempUsuarios.estatura }">
          <input type="hidden" name="edad" value="${tempUsuarios.edad }">
          <input type="hidden" name="localidad" value="${tempUsuarios.localidad }">
          <button type="submit">Modificar</button>
		    </form>
				</td>
				<td>
        <form method="get" action="Control">
          <input type="hidden" name="clave" value="eliminar"/>
          <input type="hidden" name="socioId" value="${tempUsuarios.socioId }">
          <button type="submit">Eliminar</button>
        </form>
        </td>  
        
    </c:forEach>

        </table>
        
        
 <!-- <script type="text/javascript">window.location.replace("http://localhost:8080/CRUD_SimpleDB/Control?clave=listar");</script>-->
          
        <% //response.sendRedirect("http://localhost:8080/CRUD_SimpleDB/Control?clave=listar"); %>
 <!-- <script type="text/javascript">Control?clave="listar";</script>-->  
  </body>
</html>