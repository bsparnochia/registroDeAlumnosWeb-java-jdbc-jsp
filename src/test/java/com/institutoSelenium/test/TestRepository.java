package com.institutoSelenium.test;
import com.institutoSelenium.connector.Connector;
import com.institutoSelenium.model.Alumno;
import com.institutoSelenium.repositories.interfaces.I_AlumnoRepository;
import com.institutoSelenium.repositories.jdbc.AlumnoRepository;

public class TestRepository {
    public static void main(String[] args) {
        I_AlumnoRepository ar = new AlumnoRepository(Connector.getConnection());
        
        Alumno alumno1 = new Alumno("brian","sparnochia",28,4);
        Alumno alumno2 = new Alumno("adrian","reinoso",50,10);
        Alumno buscado = ar.getById(7);
        
        //ar.save(alumno1);
        //alumno.setApellido("AMSTRONG");
        //ar.update(alumno);
        //ar.remove(alumno);
        
        if (buscado.getId() == 0){
            System.out.println("El alumno no existe en la base de datos");
        }else{
            System.out.println(buscado.toString());
        }
    }
}
