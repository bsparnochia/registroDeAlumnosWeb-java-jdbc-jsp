<%-- 
    Document   : bajaAlumnos
    Created on : May 6, 2021, 4:25:58 PM
    Author     : brian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.institutoSelenium.model.Alumno" %>
<%@page import="com.institutoSelenium.repositories.interfaces.I_AlumnoRepository" %>
<%@page import="com.institutoSelenium.repositories.jdbc.AlumnoRepository" %>
<%@page import="com.institutoSelenium.connector.Connector" %>
<% I_AlumnoRepository ar = new AlumnoRepository(Connector.getConnection()); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baja Alumnos</title>
    </head>
    <body>
        <h1>Confirmación de baja</h1>
        <%
            int id= Integer.parseInt(request.getParameter("id"));
            Alumno al= ar.getById(id);
            out.print("<h3>Desea borrar el alumno con Id: "+al.getId()+", "+al.getNombre()+", "+al.getApellido()
                    +", "+al.getEdad()+", "+ al.getIdCurso()+" ?</h3>");
            
        %>
        <form action="AlumnosBaja2.jsp" method="post" id="form-baja-alumno">
            <input type="hidden" name="id" value='<%out.print(id);%>'/>
            <input type="submit" value="borrar"/>
        </form>
            <form action="Alumnos.jsp" class="form-volver">
                <input type="submit" value="volver">
            </form>
    </body>
</html>
