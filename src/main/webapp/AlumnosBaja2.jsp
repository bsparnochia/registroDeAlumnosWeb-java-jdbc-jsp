<%-- 
    Document   : BajaAlumnos2
    Created on : May 6, 2021, 10:46:33 PM
    Author     : brian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.institutoSelenium.connector.Connector" %>
<%@page import="com.institutoSelenium.repositories.interfaces.I_AlumnoRepository" %>
<%@page import="com.institutoSelenium.repositories.jdbc.AlumnoRepository" %>
<% I_AlumnoRepository ar= new AlumnoRepository(Connector.getConnection()); %>
<%@page import="com.institutoSelenium.model.Alumno"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baja Alumnos 2</title>
    </head>
    <body>
        <%
            try {
                Alumno alumnoBorrado = ar.getById(Integer.parseInt(request.getParameter("id")));
                ar.remove(alumnoBorrado);
                out.println("<h1>El alumno fue dado de baja con éxito</h1>");
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <form method="GET" action="Alumnos.jsp">
            <input type="submit" value="Volver a Alumnos"/>
        </form>
    </body>
</html>
