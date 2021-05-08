package com.institutoSelenium.repositories.jdbc;

import com.institutoSelenium.model.Alumno;
import com.institutoSelenium.model.Curso;
import com.institutoSelenium.repositories.interfaces.I_AlumnoRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AlumnoRepository implements  I_AlumnoRepository {
    private Connection conn;

    public AlumnoRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void save(Alumno alumno) {
        try ( PreparedStatement ps = conn.prepareStatement(
                "insert into ALUMNOS(NOMBRE,APELLIDO,EDAD,IDCURSO) values (?,?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS
        ) ){
            ps.setString(1, alumno.getNombre());
            ps.setString(2, alumno.getApellido());
            ps.setInt(3, alumno.getEdad());
            ps.setInt(4, alumno.getIdCurso());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()){
                alumno.setId(rs.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void remove(Alumno alumno) {
        if (alumno==null) return;
        try (PreparedStatement ps = conn.prepareStatement(
                "delete from ALUMNOS where id=?")){
            ps.setInt(1, alumno.getId());
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Alumno alumno) {
        if(alumno==null) return;
        try (PreparedStatement ps = conn.prepareStatement(
                "update ALUMNOS set NOMBRE=?, APELLIDO=?, EDAD=?, IDCURSO=? where ID=?"
        )){
            ps.setString(1, alumno.getNombre());
            ps.setString(2, alumno.getApellido());
            ps.setInt(3, alumno.getEdad());
            ps.setInt(4, alumno.getIdCurso());
            ps.setInt(5, alumno.getId());
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Alumno getById(int id) {
        Alumno alumno = new Alumno();
        try ( PreparedStatement ps = conn.prepareStatement(
                "select * from ALUMNOS where id=?"
        )){
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                alumno.setId(rs.getInt("id"));
                alumno.setNombre(rs.getString("nombre"));
                alumno.setApellido(rs.getString("apellido"));
                alumno.setEdad(rs.getInt("edad"));
                alumno.setIdCurso(rs.getInt("idcurso"));
            };
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return alumno;
    }

    @Override
    public List<Alumno> getAll() {
        List<Alumno> lista = new ArrayList();
        try ( ResultSet rs = conn.createStatement().executeQuery(
                "select * from ALUMNOS"
        )){
            while(rs.next()){
                Alumno alumno = new Alumno(
                rs.getInt("id"),
                rs.getString("nombre"),
                rs.getString("apellido"),
                rs.getInt("edad"),
                rs.getInt("idcurso"));
                lista.add(alumno);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public List<Alumno> getLikeApellido(String apellido) {
        List<Alumno> lista = new ArrayList();
        try (PreparedStatement ps = conn.prepareStatement(
            "select * from Alumnos where apellido like ?"
        )){
            ps.setString(1, apellido+"%");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                lista.add(new Alumno(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getInt("edad"),
                        rs.getInt("idcurso")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
    
    @Override
    public List<Alumno>getLikeNombreApellido(String nombre, String apellido){
        List<Alumno> lista = new ArrayList();
        try (PreparedStatement ps = conn.prepareStatement(
                "select * from ALUMNOS where nombre like ?% and apellido like ?%"
        )){
            ps.setString(1, nombre+"%");
            ps.setString(2, apellido+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                lista.add(new Alumno(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getInt("edad"),
                        rs.getInt("idcurso")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public List<Alumno> getByCurso(Curso curso) {
        List<Alumno> listado = new ArrayList();
        try (PreparedStatement ps = conn.prepareStatement(
                "select * from ALUMNOS where idcurso=?"
        )){
            ps.setInt(1, curso.getId());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                listado.add(new Alumno(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getInt("edad"),
                        rs.getInt("idcurso")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listado;
    }
}