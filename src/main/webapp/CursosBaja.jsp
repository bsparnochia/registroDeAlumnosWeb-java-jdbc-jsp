<%-- 
    Document   : CursoBaja
    Created on : May 11, 2021, 11:07:11 PM
    Author     : brian
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.institutoSelenium.repositories.interfaces.I_AlumnoRepository" %>
<%@page import="com.institutoSelenium.repositories.interfaces.I_CursoRepository"%>
<%@page import="com.institutoSelenium.repositories.jdbc.CursoRepository"%>
<%@page import="com.institutoSelenium.repositories.jdbc.AlumnoRepository"%>
<%@page import="com.institutoSelenium.model.Curso" %>
<%@page import="com.institutoSelenium.model.Alumno" %>
<%@page import="com.institutoSelenium.connector.Connector" %>
<% I_AlumnoRepository ar=new AlumnoRepository(Connector.getConnection()); %>
<% I_CursoRepository cr=new CursoRepository(Connector.getConnection()); %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Curso Baja</title>
    </head>
    <body>
        <h1>Baja de curso</h1>
        <%
            Curso cursoBorrado = cr.getById(Integer.parseInt(request.getParameter("id")));
            out.print("<h2>¿Desea borrar el curso "+cursoBorrado.getId()+", "+cursoBorrado.getNombre()+", "+
                        cursoBorrado.getProfesor()+", "+cursoBorrado.getDia()+", "+cursoBorrado.getTurno()+" ?</h2>");
        %>
        <form action="CursosBaja2.jsp" method="post" id="form-baja-curso">
            <input type='hidden' name="id" value='<% out.print(cursoBorrado.getId()); %>' />
            <input type='submit' value='Borrar'/>
        </form>
        <form action="Cursos.jsp" class="form-volver">
            <input type="submit" value="Volver" />
        </form>
    </body>
</html>
