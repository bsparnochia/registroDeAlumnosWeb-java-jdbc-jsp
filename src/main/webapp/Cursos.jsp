<%@page import="com.institutoSelenium.util.HtmlTable"%>
<%@page import="java.util.List"%>
<%@page import="com.institutoSelenium.repositories.interfaces.I_CursoRepository"%>
<%@page import="com.institutoSelenium.repositories.jdbc.CursoRepository"%>
<%@page import="com.institutoSelenium.connector.Connector"%>
<%@page import="com.institutoSelenium.model.Curso"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.institutoSelenium.enums.Semana"%>
<%@page import="com.institutoSelenium.enums.Turno" %>
<% I_CursoRepository cr= new CursoRepository(Connector.getConnection());%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cursos</title>
    </head>
    <body>
        <h1>Mantenimiento de cursos</h1>
        <h2>Alta de curso</h2>
        <form id="form-alta">
            <table>
                <tr>
                    <td>Nombre del curso</td>
                    <td><input type=text name="nombre" required minlength="7" maxlength="20"/></td>
                </tr>
                <tr>
                    <td>Profesor</td>
                    <td><input type="text" name="profesor" required minlength="10" maxlength="20"/></td>
                </tr>
                <tr>
                    <td>Dia</td>
                    <td>
                        <select name="dia">
                            <%
                                for(Semana s:Semana.values()){
                                    out.print("<option value="+s.name()+">"+s.toString().toLowerCase()+"</option>");
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Turno</td>
                    <td>
                        <select name="turno">
                            <%
                                for(Turno t:Turno.values()){
                                    out.print("<option value="+t.name()+">"+t.toString().toLowerCase()+"</option>");
                                }
                            %>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="submit" value="Enviar"/>
            <input type="reset" value="Limpiar"/>
        </form>
        <%
            try {
                String nombre = request.getParameter("nombre");
                String profesor = request.getParameter("profesor");
                if( nombre!=null && profesor!=null){
                    Curso curso = new Curso(
                            nombre,
                            profesor,
                            Semana.valueOf(request.getParameter("dia")),
                            Turno.valueOf(request.getParameter("turno"))
                    );
                    cr.save(curso);
                    out.print("Se ha agregado el curso Nº "+curso.getId()+" de "+curso.getNombre()+
                            " del profesor "+curso.getProfesor()+" los dìas "+curso.getDia()+" a la "+curso.getTurno());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <h2>Busqueda de Cursos</h2>
        <form id="form-busqueda-cursos" method="get" >
            <label>Nombre de curso </label>
            <input type="text" name="busqueda"/>
            <input type="submit" value="Buscar"/>
        </form>
        <%
            try {
                String busqueda = request.getParameter("busqueda");
                List<Curso> cursos=null;
                if (busqueda != null) {
                    cursos = cr.getLikeTitulo(busqueda);   
                }else{
                    cursos = cr.getAll();
                }
                out.print(new HtmlTable(cursos, "CursosModificacion.jsp", "CursosBaja.jsp").getHtmlTable());
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
