package bookManager;

import java.sql.*;

import com.mysql.jdbc.exceptions.jdbc4.MySQLDataException;

public class UserDBBean {

	public static Connection getMySQLConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://192.168.0.151:3306/mydb?useSSL=false&useUnicode=true&characterEncoding=euc-kr";
			String user = "root";
			String password = "busanit";
			conn = DriverManager.getConnection(url, user, password);
		}catch (ClassNotFoundException e) {
			System.out.println("MySQL 드라이버가 없습니다.");
		}catch (MySQLDataException e) {
			System.out.println("데이터베이스가 없습니다.");
		}catch (SQLException e) {
			System.out.println("사용자 계정 또는 비밀번호가 일치하지 않습니다.");
		}
		return conn;
	}
	public static void close(Connection conn) {
		try {
			if(conn !=null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt !=null) {
				stmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement pstmt) {
		try {
			if(pstmt !=null) {
				pstmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs !=null) {
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}



