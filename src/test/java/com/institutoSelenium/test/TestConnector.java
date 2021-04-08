package com.institutoSelenium.test;
import com.institutoSelenium.connector.Connector;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestConnector {
    public static void main(String[] args) {
        try ( Connection conn=Connector.getConnection()){
            conn
                .createStatement()
                .execute(
                        "insert into cursos (titulo,profesor,dia,turno) values "
                        + "('java','Torres','LUNES','TARDE')"
            );
            
            String query="insert into cursos (titulo,profesor,dia,turno) values "
                        + "('html','Gomez','MARTES','TARDE')";
            Statement st=conn.createStatement();
            st.execute(query);
            
            ResultSet rs =conn.createStatement().executeQuery("select * from cursos");
            while ( rs.next()){
                System.out.println(
                    rs.getInt("id")+"\t"+
                    rs.getString("titulo")+"\t"+
                    rs.getString("profesor")+"\t"+
                    rs.getString("dia")+"\t"+
                    rs.getString("turno")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
