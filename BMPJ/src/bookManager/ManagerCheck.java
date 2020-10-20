package bookManager;

import java.sql.*;

public class ManagerCheck {
	String grade;
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
}
