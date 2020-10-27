package bookManager;

import java.sql.*;

public class ManagerCheck {
	String grade;
	String no;
	
	public  boolean check() {
		if("A".equals(grade)) { 
			return true;
		}else {
			return false;
		}
	}
	public String getGrade() {
		return grade;
	}
	public String getNo() {
		return no;
	}
	public void setGrade(String id) {
		String grade;
		Connection conn =UserDBBean.getMySQLConnection();
		String sql = "select * from Customer where cs_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			grade = rs.getString("cs_grade");
			UserDBBean.close(rs);
			UserDBBean.close(pstmt);
			UserDBBean.close(conn);
			this.grade= grade;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void setNo(String id) {
		String no;
		Connection conn =UserDBBean.getMySQLConnection();
		String sql = "select * from Customer where cs_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			no = rs.getString("cs_no");
			UserDBBean.close(rs);
			UserDBBean.close(pstmt);
			UserDBBean.close(conn);
			this.no= no;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
