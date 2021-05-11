package com.institutoSelenium.test;
import com.institutoSelenium.connector.Connector;
import com.institutoSelenium.enums.Semana;
import com.institutoSelenium.enums.Turno;
import com.institutoSelenium.repositories.interfaces.I_CursoRepository;
import com.institutoSelenium.repositories.jdbc.CursoRepository;
import com.institutoSelenium.model.Curso;
import java.util.List;


public class TestCursoRepository {
    public static void main(String[] args) {
        Curso cursoNuevo = new Curso("pvc","riquelme",Semana.MIERCOLES,Turno.TARDE);
        I_CursoRepository cr = new CursoRepository(Connector.getConnection());
        
        /* Alta */
        
        //System.out.println("---INSERT----");
        //cr.save(curso);
        System.out.println(cursoNuevo);
        
        /* Consulta de todos los elementos de la base de datos */
        System.out.println("----------Consulta general-----------");
        List<Curso> resultados = cr.getAll();
        resultados.forEach(System.out::println);
        
        /* Consulta segùn id*/
        System.out.println("---------getId()-------");
        Curso cursoSegunId=cr.getById(8);
        System.out.println(cursoSegunId);
        
        /* Modificaciòn de Curso */
//        System.out.println("-----UPDATE------");
//        cursoSegunId.setDia(Semana.VIERNES);
//        cr.update(cursoSegunId);

        /* Borrado de Curso */
//        System.out.println("---REMOVE----");
//        int id=44;
//        Curso cursoRemovido = cr.getById(id);
//        cr.remove(cursoRemovido);
        
        /*Listado segun titulo del curso */
        System.out.println("----getLikeTitulo(..)----");
        List<Curso> cursoTitulo = cr.getLikeTitulo("JAVA");
        cursoTitulo.forEach(System.out::println);
        
        /*Listado segun titulo y profesor del curso*/
        System.out.println("----getLikeTituloAndProfesor(...)");
        List<Curso> cursoTituloProfesor=cr.getLikeTituloAndProfesor("Spring", "jorge Ra");
        cursoTituloProfesor.forEach(System.out::println);
    }
}
