package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	static String dbUrl = "jdbc:mysql://127.0.0.1/studyweb?useSSL=false&useUnicode=true&serverTimezone=GMT&characterEncoding=utf8";
	static String dbUser = "root";
	static String dbPass = "123qwe";
	static String driveName = "com.mysql.cj.jdbc.Driver";
	private static Connection conn=null;
	
	 static{
		try {
			Class.forName(driveName);
		System.out.println("数据库驱动加载成功！");
		conn= DriverManager.getConnection(dbUrl,dbUser,dbPass);
		System.out.println("成功连接到数据库!");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	 //对外提供一个方法来获取数据库连接
	 public static Connection getConnection(){
	return conn;
	 }
	 
	 public static void main(String[] args) throws Exception{
		
	 }
}
