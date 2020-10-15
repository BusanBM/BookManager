package book_project;

import java.sql.*; 
import java.io.*; 
/** * MySql 에 이미지 저장하는 루틴 
 * * CREATE TABLE tbl_test (
 *  * ID INTEGER PRIMARY KEY, 
 *  * FILENAME VARCHAR(50) NOT NULL,
 *   * FILE MEDIUMBLOB NOT NULL 
 *   * ); * */ 
public class TestUpload{ 
	public static void main(String[] args) { 
		System.out.println("Insert Image Example!"); 
		String driverName = "com.mysql.jdbc.Driver"; 
		String url = "jdbc:mysql://192.168.0.151:3306/"; 
		String dbName = "mydb"; 
		String userName = "root"; 
		String password = "busanit"; 
		Connection con = null; 
		
		try{ 
			Class.forName(driverName); 
			con = DriverManager.getConnection(url+dbName,userName,password); 
			Statement stmt = con.createStatement(); 
			File imgfile = new File("d:\\logo.png"); 
			FileInputStream fin = new FileInputStream(imgfile); 
			PreparedStatement pre = con.prepareStatement("insert into tbl_test (ID, FILENAME, FILE) VALUES (?, ?, ?)"); 
			pre.setInt(1,5); 
			pre.setString(2,"Durga"); 
			pre.setBinaryStream(3,fin,(int)imgfile.length());
			//Stream형의 파일 업로드 
			pre.executeUpdate(); 
			System.out.println("Inserting Successfully!"); 
			pre.close(); 
			con.close(); 
			} catch (Exception e){ 
				System.out.println(e.getMessage()); } }
}

