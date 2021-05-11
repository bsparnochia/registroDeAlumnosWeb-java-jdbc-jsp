package com.institutoSelenium.test;
import com.institutoSelenium.connector.Connector;
import com.institutoSelenium.model.Alumno;
import com.institutoSelenium.repositories.interfaces.I_AlumnoRepository;
import com.institutoSelenium.repositories.jdbc.AlumnoRepository;
import java.util.List;

public class TestAlumnoRepository {
    public static void main(String[] args) {
        I_AlumnoRepository ar = new AlumnoRepository(Connector.getConnection());
        
        Alumno alumno1 = new Alumno("brian","sparnochia",29,4);
        Alumno alumno2 = new Alumno("adrian","reinoso",50,10);
        /* 1) */
        List<Alumno> inscripciones = ar.getAll();
        /* 2) */
        Alumno buscado = ar.getById(7);
        /* 2) */
        List<Alumno> listadoApellidos = ar.getLikeApellido("rojas");
        /* 3) */
        List<Alumno> listadoNombreApellido = ar.getLikeNombreApellido("tamara", "rojas");
        
        /* Pruebas de guardado, actualización y eliminación en tabla ALUMNOS */
        //ar.save(alumno2);
        ar.update(alumno1);
        ar.remove(alumno1);
        
        System.out.println("1)\nLista de inscriptos actuales de todos los cursos");
        for(Alumno alumno:inscripciones){
            System.out.println(alumno.toString());
        }
        
        System.out.println("2)\nBusqueda de Alumno por id ("+buscado.getId()+")");
        if (buscado.getId() == 0){
            System.out.println("El alumno no existe en la base de datos");
        }else{
            System.out.println(buscado.toString());
        }
        
        System.out.println("3)\nLista de coincidencias con el mismo apellido");
        for(Alumno alumno:listadoApellidos){
            System.out.println(alumno.toString());
        }
        
        System.out.println("4)\nLista de coincidencias con el mismo nombre y apellido");
        for (Alumno alumno : listadoNombreApellido) {
            System.out.println(alumno.toString());
        }   
    }
}
