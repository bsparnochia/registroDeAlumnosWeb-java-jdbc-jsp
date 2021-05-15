<%@page import="com.institutoSelenium.util.HtmlTable"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.institutoSelenium.model.Alumno" %>
<%@page import="com.institutoSelenium.model.Curso" %>
<%@page import="com.institutoSelenium.repositories.interfaces.I_CursoRepository" %>
<%@page import="com.institutoSelenium.repositories.jdbc.CursoRepository" %>
<%@page import="com.institutoSelenium.repositories.interfaces.I_AlumnoRepository" %>
<%@page import="com.institutoSelenium.repositories.jdbc.AlumnoRepository"%>
<%@page import="com.institutoSelenium.connector.Connector" %>
<% I_AlumnoRepository ar = new AlumnoRepository(Connector.getConnection()); %>
<% I_CursoRepository cr = new CursoRepository(Connector.getConnection());%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="styleshet" href="css/styles.css">
        <title>Alumnos</title>
    </head>
    <body>
        <a href="index.html" class="link-inicio">Inicio</a>
        <a href="Cursos.jsp" class="link-cursos">Cursos</a>
        <h1>Registro de Alumnos</h2>
        <h2>Inscripción</h2>
        <div id="alumnos-principal">
            <form method="post" id="form-alta-alumno">
                <table>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre" required minlength="3" maxlength="20"/></td>
                    </tr>
                    <tr>
                        <td>Apellido</td>
                        <td><input type="text" name="apellido" required minlength="3" maxlength="25"/></td>
                    </tr>
                    <td>Edad</td>
                    <td><input type="number" name="edad" min="18" max="70" value="18"/></td>
                    <tr>
                        <td>Cursos</td>
                        <td>
                            <select name="idCurso" class="select-curso">
                                <%
                                    List<Curso> cursos = cr.getAll();
                                    for (Curso c : cursos) {
                                        out.print("<option value=" + c.getId() + ">" + c.getNombre() + ", " + c.getProfesor()
                                                + ", " + c.getDia().toString() + ", " + c.getTurno().toString() + "</option>");
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                </table> 
                <input type="submit" value="inscribirse">
                <input type="reset" value="limpiar">
            </form>
        </div>
        
        <%
            try {
                request.setCharacterEncoding("utf-8");
                String nombre=request.getParameter("nombre");
                String apellido=request.getParameter("apellido");
                int edad=Integer.parseInt(request.getParameter("edad"));
                int idCurso=Integer.parseInt(request.getParameter("idCurso"));
                Alumno alumnoNuevo=new Alumno(nombre,apellido,edad,idCurso);
                if( nombre!=null && apellido!=null){
                    ar.save(alumnoNuevo);
                    out.print("Se ha inscripto el alumno : "+alumnoNuevo.getNombre()+" "+alumnoNuevo.getApellido()+
                                   " en el curso de "+cr.getById(idCurso).getNombre());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <h2>Búsqueda de Alumnos</h2>
        <form id="form-busqueda-alumnos" method="get">
            <label>Apellido</label>
            <input name="buscador" type="text" class="input-text">
            <input type="reset" value="limpiar" class="input-button">
            <input type="submit" value="Enviar" class="input-button">
        </form>

        <%
            try {
                String buscado = request.getParameter("buscador");
                List<Alumno> alumnos = null;
                if (buscado!=null){
                    alumnos=ar.getLikeApellido(buscado);
                }else{
                    alumnos=ar.getAll();
                }
                HtmlTable tabla = new HtmlTable(alumnos,"AlumnosModificacion.jsp","AlumnosBaja.jsp");
                if(tabla.estaVacia()){
                    out.print("<p>¡No se han encontrado resultados!</p>");
                }else{
                    out.print(tabla.getHtmlTable());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
