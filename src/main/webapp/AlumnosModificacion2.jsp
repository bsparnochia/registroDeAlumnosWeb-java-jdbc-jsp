<%-- 
    Document   : AlumnosModificacion2
    Created on : May 8, 2021, 3:52:04 AM
    Author     : brian
--%>

<%@page import="com.institutoSelenium.model.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.institutoSelenium.connector.Connector" %>
<%@page import="com.institutoSelenium.repositories.interfaces.I_AlumnoRepository" %>
<%@page import="com.institutoSelenium.repositories.jdbc.AlumnoRepository" %>
<% I_AlumnoRepository ar=new AlumnoRepository(Connector.getConnection()); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Alumno alumnoModificado = new Alumno(
                    Integer.parseInt(request.getParameter("id")),
                    request.getParameter("nombre"),
                    request.getParameter("apellido"),
                    Integer.parseInt(request.getParameter("edad")),
                    Integer.parseInt(request.getParameter("idCurso"))
            );
            ar.update(alumnoModificado);
        %>
        <h1>Los cambios se han realizado correctamente</h1>
        <form action="Alumnos.jsp" class="form-volver">
            <input type="submit" value="Volver"/>
        </form>
    </body>
</html>
