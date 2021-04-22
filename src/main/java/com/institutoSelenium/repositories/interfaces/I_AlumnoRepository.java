package com.institutoSelenium.repositories.interfaces;
import com.institutoSelenium.model.Alumno;
import com.institutoSelenium.model.Curso;
import java.util.List;
public interface I_AlumnoRepository {
    void save(Alumno alumno);
    void remove(Alumno alumno);
    void update(Alumno alumno);
    Alumno getById(int id);
    List<Alumno>getAll();
    List<Alumno>getLikeApellido(String apellido);
    List<Alumno>getLikeNombreApellido(String nombre, String apellido);
    List<Alumno>getByCurso(Curso curso);
}
