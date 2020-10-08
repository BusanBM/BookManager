package bookManager;

import java.sql.*;

public class loginCk {
	public static boolean pass(String id,String password){
		String pass;
		
		Connection conn = UserDBBean.getMySQLConnection();
		
		String sql = "select * from Customer where cs_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pass = rs.getString("cs_pwd");
			UserDBBean.close(rs);
			UserDBBean.close(pstmt);
			UserDBBean.close(conn);
			if(pass.equals(password)) {
				return true;
			}else {
				System.out.println("Acess Denied : Incorrect Password");
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
