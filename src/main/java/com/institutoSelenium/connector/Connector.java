package com.institutoSelenium.connector;
import java.sql.Connection;
import java.sql.DriverManager;
        
public class Connector {
    private static final String driver = "com.mysql.cj.jdbc.Driver";
    private static final String vendor = "mysql";
    private static final String server = "localhost";
    private static final String port = "3306";
    private static final String db = "seleniumDB";
    private static final String params = "";
    private static final String user = "root";
    private static final String password = "";
    private static final String url = "jdbc:"+vendor+"://"+server+":"+port+"/"+db+params;
    private static Connection conn = null;
    private Connector(){}
    
    public static synchronized Connection getConnection(){
        if (conn == null){
            try {
                Class.forName(driver);
                conn=DriverManager.getConnection(url, user, password);
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("sigue nulo");
            }
        }
        return conn;
    }
}
