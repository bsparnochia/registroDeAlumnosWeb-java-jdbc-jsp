<%-- 
    Document   : TestHtmlTable
    Created on : May 5, 2021, 8:05:18 PM
    Author     : brian
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.institutoSelenium.model.Alumno" %>
<%@page import="java.util.List" %>
<%@page import="com.institutoSelenium.util.HtmlTable"%>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test de Tabla Html</title>
    </head>
    <body>
        <h1><i>Test de tabla</i></h1>
        
        <%
            Alumno al = new Alumno(12, "pepe", "mujica", 5, 10);
            List<Alumno> lista = new ArrayList();
            lista.add(al);
            lista.add(new Alumno(55,"adrian","lozano",15,3));
            lista.add(new Alumno(33,"joaquin","espineta",22,9));
            String tablita = new HtmlTable(lista, "AlumnosModificacion.jsp","AlumnosBaja.jsp").getHtmlTable();
            out.println(tablita);
            
//allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        %>        
        <iframe width="560" height="315" src="https://www.youtube.com/embed/5K7bdA-O93k"  allowfullscreen></iframe>
            
    </body>
</html>
