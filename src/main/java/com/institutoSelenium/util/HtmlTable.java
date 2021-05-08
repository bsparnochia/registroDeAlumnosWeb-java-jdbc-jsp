package com.institutoSelenium.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

public class HtmlTable<E> {
    private String linkUpdate;
    private String linkRemove;
    private List<E> listado;

    public HtmlTable(List<E> listado, String linkUpdate, String linkRemove) {
        this.linkUpdate = linkUpdate;
        this.linkRemove = linkRemove;
        this.listado = listado;
    }

    public HtmlTable(List<E> listado) {
        this.listado = listado;
    }
    
    public String getHtmlTable() throws NoSuchMethodException{
        if(listado==null || listado.isEmpty() ) return "<table></table>";
        String table = "<table>";
        try {
            table += "<tr>";
            Field[] campos = listado.get(0).getClass().getDeclaredFields();
            for (Field c : campos) {
                table += "<th>" + c.getName() + "</th>";
            }
            table +="</tr>";
            for (E objeto : listado) {//revisar String metodo
                table+="<tr>";
                for (Field campo : campos) {
                    table+="<td>";
                    table+= getValorDeCampo(objeto, campo);
                    table+="</td>";
                }
                Object id = objeto.getClass().getMethod("getId", null).invoke(objeto, null);
                table+="<td><a href='"+this.linkUpdate+"?id="+id+"'>Modificar</a></td>";
                table+="<td><a href='"+this.linkRemove+"?id="+id+"'>Eliminar</a></td>";
                table+="</tr>";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        table += "</table>";
        return table;
    }
    
    public boolean estaVacia(){
        return this.listado.isEmpty();
    }
    
    private String getValorDeCampo(E objeto, Field campo) throws NoSuchMethodException, 
            IllegalAccessException, IllegalArgumentException, InvocationTargetException{
        String nombreMetodo = "get" + campo.getName()
                .substring(0, 1)
                .toUpperCase() + 
                campo.getName()
                        .substring(1);
        return objeto.getClass().getMethod(nombreMetodo, null).invoke(objeto, null).toString();
    }
}
