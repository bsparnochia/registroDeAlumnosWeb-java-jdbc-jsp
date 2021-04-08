package com.institutoSelenium.model;

public class Alumno {
    private int id;
    private String nombre;
    private String apellido;
    private int edad;
    private int idCurso;

    public Alumno() {
    }

    public Alumno(int id, String nombre, String apellido, int edad, int idCurso) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.idCurso = idCurso;
    }

    public Alumno(String nombre, String apellido, int edad, int idCurso) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.idCurso = idCurso;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public int getEdad() {
        return edad;
    }

    public int getIdCurso() {
        return idCurso;
    }

    @Override
    public String toString() {
        return "Alumno{" + "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", edad=" + edad + ", idCurso=" + idCurso + '}';
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }
}
