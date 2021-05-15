<%-- 
    Document   : CursosModificacion2
    Created on : May 12, 2021, 1:37:45 AM
    Author     : brian
--%>

<%@page import="com.institutoSelenium.enums.Turno"%>
<%@page import="com.institutoSelenium.enums.Semana"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.institutoSelenium.repositories.interfaces.I_CursoRepository"%>
<%@page import="com.institutoSelenium.repositories.jdbc.CursoRepository"%>
<%@page import="com.institutoSelenium.model.Curso" %>
<%@page import="com.institutoSelenium.connector.Connector" %>
<% I_CursoRepository cr=new CursoRepository(Connector.getConnection()); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Curso modificacion 2</title>
    </head>
    <body>
        <h1>Cambios en curso</h1>
        <%
            Curso cursoModificado = new Curso(
                    Integer.parseInt(request.getParameter("id")),
                    request.getParameter("titulo"),
                    request.getParameter("profesor"),
                    Semana.valueOf(request.getParameter("dia")),
                    Turno.valueOf(request.getParameter("turno"))
            );
            
            cr.update(cursoModificado);
            out.print("<h2>¡El curso fue modificado con éxito!</h2>");
        %>
        <form action="Cursos.jsp" class="form-volver">
            <input type="submit" value="Volver" />
        </form>
    </body>
</html>
