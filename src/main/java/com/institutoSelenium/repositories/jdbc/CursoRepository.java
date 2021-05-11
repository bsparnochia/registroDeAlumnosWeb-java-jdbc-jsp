package com.institutoSelenium.repositories.jdbc;
import com.institutoSelenium.enums.Semana;
import com.institutoSelenium.enums.Turno;
import com.institutoSelenium.model.Curso;
import com.institutoSelenium.repositories.interfaces.I_CursoRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class CursoRepository implements I_CursoRepository{
    private Connection conn;

    public CursoRepository(Connection conn) {
        this.conn = conn;
    }
    
    @Override
    public void save(Curso curso) {
        if (curso==null)return;
        try (PreparedStatement ps = conn.prepareStatement(
        "insert into CURSOS(titulo,profesor,dia,turno) values (?,?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS
        );){
            ps.setString(1, curso.getNombre());
            ps.setString(2, curso.getProfesor());
            ps.setString(3, curso.getDia().toString());
            ps.setString(4, curso.getTurno().toString());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if(rs.next()){
                curso.setId(rs.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void remove(Curso curso) {
        if(curso==null)return;
        try (PreparedStatement ps=conn.prepareStatement(
        "delete from CURSOS where id=?"
        )){
            ps.setInt(1, curso.getId());
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Curso curso) {
        if(curso==null)return;
        try (PreparedStatement ps=conn.prepareStatement(
                "update CURSOS set titulo=?, profesor=?, dia=?, turno=? where id=?"
        )){
            ps.setString(1, curso.getNombre());
            ps.setString(2, curso.getProfesor());
            ps.setString(3, curso.getDia().toString());
            ps.setString(4, curso.getTurno().toString());
            ps.setInt(5, curso.getId());
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Curso getById(int id) {
        Curso curso = new Curso();
        try (PreparedStatement ps=conn.prepareStatement(
                "select titulo, profesor, dia, turno from CURSOS where id=?"
        )){
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                curso.setId(id);
                curso.setNombre(rs.getString("titulo"));
                curso.setProfesor(rs.getString("profesor"));
                curso.setDia(Semana.valueOf(rs.getString("dia")));
                curso.setTurno(Turno.valueOf(rs.getString("turno")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return curso;
    }

    @Override
    public List<Curso> getAll() {
        List<Curso> resultados= new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery(
                "select id, titulo, profesor, dia, turno from CURSOS"
        )){
            while(rs.next()){
                resultados.add( new Curso(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getString("profesor"),
                        Semana.valueOf(rs.getString("dia")),
                        Turno.valueOf(rs.getString("turno"))
                ));
            }
        } catch (Exception e) {
        }
        return resultados;
    }

    @Override
    public List<Curso> getLikeTitulo(String titulo) {
        List<Curso> resultados = new ArrayList();
        try (PreparedStatement ps=conn.prepareStatement(
                "select * from CURSOS where titulo like ?"
        )){
            ps.setString(1, titulo+"%");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                resultados.add(new Curso(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getString("profesor"),
                        Semana.valueOf(rs.getString("dia")),
                        Turno.valueOf(rs.getString("turno"))
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultados;
    }

    @Override
    public List<Curso> getLikeTituloAndProfesor(String titulo, String profesor) {
        List<Curso> resultados = new ArrayList();
        try (PreparedStatement ps=conn.prepareStatement(
                "select * from CURSOS where titulo like ? && profesor like ?"
        )){
            ps.setString(1, titulo+"%");
            ps.setString(2, profesor+"%");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                resultados.add(new Curso(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getString("profesor"),
                        Semana.valueOf(rs.getString("dia")),
                        Turno.valueOf(rs.getString("turno"))
                ));
            }
        } catch (Exception e) {
        }
        return resultados;
    }

}
