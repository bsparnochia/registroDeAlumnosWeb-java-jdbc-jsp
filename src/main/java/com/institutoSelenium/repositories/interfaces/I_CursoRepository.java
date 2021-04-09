package com.institutoSelenium.repositories.interfaces;
import com.institutoSelenium.model.Curso;
import java.util.List;
public interface I_CursoRepository {
    void save(Curso curso);
    void remove(Curso curso);
    void update(Curso curso);
    Curso getById(int id);
    List<Curso>getAll();
    List<Curso>getLikeTitulo(String titulo);
    List<Curso>getLikeTituloAndProfesor(String titulo, String profesor);
}
