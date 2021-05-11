<%-- 
    Document   : modificacionAlumnos
    Created on : May 6, 2021, 4:26:10 PM
    Author     : brian
--%>

<%@page import="com.institutoSelenium.repositories.jdbc.AlumnoRepository"%>
<%@page import="com.institutoSelenium.repositories.interfaces.I_AlumnoRepository"%>
<%@page import="java.util.List"%>
<%@page import="com.institutoSelenium.model.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.institutoSelenium.connector.Connector" %>
<%@page import="com.institutoSelenium.repositories.interfaces.I_CursoRepository" %>
<%@page import="com.institutoSelenium.repositories.jdbc.CursoRepository" %>
<% I_CursoRepository cr=new CursoRepository(Connector.getConnection());%>
<% I_AlumnoRepository ar=new AlumnoRepository(Connector.getConnection());%>
<%@page import="com.institutoSelenium.model.Alumno" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificacion Alumnos</title>
    </head>
    <body>
        <h1>Modificación de datos del Alumno</h1>
        <%
            Alumno alumno = ar.getById(Integer.parseInt(request.getParameter("id")));
        %>
        <form method="post" action="AlumnosModificacion2.jsp">
            <input type="hidden" name="id" value="<% out.print(alumno.getId()); %>"/>
            <table>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre" required minlength="3" maxlength="20" placeholder="<% out.print(alumno.getNombre()); %>"/></td>
                </tr>
                <tr>
                    <td>Apellido</td>
                    <td><input type="text" name="apellido" required minlength="3" maxlength="25" placeholder="<% out.print(alumno.getApellido()); %>"/></td>
                </tr>
                <tr>
                    <td>Edad</td>
                    <td><input type="number" name="edad" value="<% out.print(alumno.getEdad()); %>" min="18" max="70" </></td>
                </tr>
                <tr>
                    <td>Curso</td>
                    <td>
                        <select name="idCurso">
                            <%
                               List<Curso> cursos = cr.getAll();
                               for(Curso c:cursos){
                                   StringBuilder opcion=new StringBuilder("<option value="+c.getId()+" ");
                                   if(c.getId() == alumno.getIdCurso()){
                                       opcion.append("selected");
                                   }
                                   opcion.append(">"+c.getNombre()+", "+c.getProfesor()+
                                                    ", "+c.getDia()+", "+c.getTurno()+"</option>");
                                   out.print(opcion.toString());
                               }
                            %>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="submit" value="Guardar"/>
        </form>
        <form action="Alumnos.jsp">
            <input type="submit" value="Cancelar"/>
        </form>
    </body>
</html>
