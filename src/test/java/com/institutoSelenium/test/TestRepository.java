package com.institutoSelenium.test;
import com.institutoSelenium.connector.Connector;
import com.institutoSelenium.model.Alumno;
import com.institutoSelenium.repositories.interfaces.I_AlumnoRepository;
import com.institutoSelenium.repositories.jdbc.AlumnoRepository;

public class TestRepository {
    public static void main(String[] args) {
        I_AlumnoRepository ar = new AlumnoRepository(Connector.getConnection());
        
        //Alumno alumno = new Alumno("brian","sparnochia",28,4);
        Alumno alumno = new Alumno("adrian","reinoso",50,10);

        ar.save(alumno);
    }
}
