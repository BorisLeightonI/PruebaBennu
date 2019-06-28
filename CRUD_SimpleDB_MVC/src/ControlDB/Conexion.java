package ControlDB;

import java.sql.*;

public class Conexion {
	String db = "baloncesto";
	String url = "jdbc:mysql://localhost/"+ db;
	String usr = "root";
	String pass = "";
	Connection conexion;
	
	public Conexion() {
	}
	
	public Connection conectar() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection(url,usr,pass);
			System.out.println("Conexion con db establecida");
			
			return conexion;
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}		
	}
	
	public void cerrar() {
		
		try {
			System.out.println("Conexion a db: cerrada.");
			conexion.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	

}
