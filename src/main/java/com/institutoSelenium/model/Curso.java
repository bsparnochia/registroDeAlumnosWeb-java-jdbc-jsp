package com.institutoSelenium.model;
import com.institutoSelenium.enums.Semana;
import com.institutoSelenium.enums.Turno;

public class Curso {
    private int id;
    private String nombre;
    private String profesor;
    private Semana dia;
    private Turno turno;

    public Curso() {
    }
    
    public Curso(int id, String nombre, String profesor, Semana dia, Turno turno) {
        this.id = id;
        this.nombre = nombre;
        this.profesor = profesor;
        this.dia = dia;
        this.turno = turno;
    }

    public Curso(String nombre, String profesor, Semana dia, Turno turno) {
        this.nombre = nombre;
        this.profesor = profesor;
        this.dia = dia;
        this.turno = turno;
    }

    @Override
    public String toString() {
        return "Curso{" + "id=" + id + ", nombre=" + nombre + ", profesor=" + profesor + ", dia=" + dia + ", turno=" + turno + '}';
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getProfesor() {
        return profesor;
    }

    public Semana getDia() {
        return dia;
    }

    public Turno getTurno() {
        return turno;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setProfesor(String profesor) {
        this.profesor = profesor;
    }

    public void setDia(Semana dia) {
        this.dia = dia;
    }

    public void setTurno(Turno turno) {
        this.turno = turno;
    }
}