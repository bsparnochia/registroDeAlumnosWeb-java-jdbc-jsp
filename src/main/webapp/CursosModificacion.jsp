<%-- 
    Document   : CursosModificacion
    Created on : May 12, 2021, 12:55:06 AM
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
        <title>Cursos modificacion</title>
    </head>
    <body>
        <h1>Cambios en cursos</h1>
        <%
            Curso curso = cr.getById(Integer.parseInt(request.getParameter("id")));
            out.print(curso);
        %>
        <form action="CursosModificacion2.jsp" method="post">
            <input type="hidden" name="id" value="<% out.print(request.getParameter("id")); %>"/>
            <table>
                <tr>
                    <td>Curso</td>
                    <td><input type="text" name="titulo" required minlength="5" maxlength="20"  value="<% out.print(curso.getNombre()); %>" /></td>
                </tr>
                <tr>
                    <td>Profesor</td>
                    <td><input type="text" name="profesor" required minlength="10" maxlength="20" value="<% out.print(curso.getProfesor()); %>"/></td>
                </tr>
                <tr>
                    <td>Dia</td>
                    <td>
                        <select name="dia" class="select-dia">
                            <%
                                for(Semana s:Semana.values()){
                                    StringBuilder opcion = new StringBuilder("<option value="+s.toString());
                                    if(s.equals(curso.getDia())){
                                        opcion.append(" selected");
                                    }
                                    opcion.append(">"+s.toString()+"</option>");
                                    out.print(opcion);
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Turno</td>
                    <td>
                        <select name="turno" class="select-turno">
                            <%
                                for(Turno t:Turno.values()){
                                    StringBuilder opcion = new StringBuilder("<option value="+t.toString());
                                    if(t.equals(curso.getTurno())){
                                        opcion.append(" selected");
                                    }
                                    opcion.append(">"+t.toString()+"</opcion>");
                                    out.print(opcion);
                                }
                            %>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="submit" value="Modificar"/>
            <input type="reset" value="Limpiar "/>
        </form>
        <form action="Cursos.jsp" class="form-volver">
            <input type="submit" value="Volver"/>
        </form>
    </body>
</html>
