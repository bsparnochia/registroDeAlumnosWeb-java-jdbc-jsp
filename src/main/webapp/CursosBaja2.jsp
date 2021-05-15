<%-- 
    Document   : CursosBaja2
    Created on : May 12, 2021, 12:45:52 AM
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Curso Baja 2</title>
    </head>
    <body>
        <h1>Baja de curso</h1>
        <%
            Curso cursoBorrado = cr.getById(Integer.parseInt(request.getParameter("id")));
            List<Alumno> alumnosDelCurso = ar.getByCurso(cursoBorrado);
            if(alumnosDelCurso.isEmpty()){
                cr.remove(cursoBorrado);
                out.print("<h2>El curso fue eliminado con éxito</h2>");
            }
            else{
                out.print("<h2>El curso no puede ser eliminado porque tiene alumnos inscriptos</h2>");
            }
        %>
        <form action="Cursos.jsp" class="form-volver">
            <input type="submit" value="Volver"/>
        </form>
    </body>
</html>
