package book_project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookDBBean {
	private static BookDBBean instance = new BookDBBean();
	
	public static BookDBBean getinstance() {
		return instance;
	}
	
	//오라클 DB에 접속
	public Connection getConnection() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//검색어를 입력받아 결과를 보여줄 목록
	public ArrayList<BookBean> listBoard(String search_word) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="SELECT * FROM BOOK_LIST WHERE b_title LIKE ? "
				+ "OR b_author LIKE ?";
		ArrayList<BookBean> bookList = new ArrayList<BookBean>();
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search_word+"%");
			pstmt.setString(2, "%"+search_word+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookBean book = new BookBean();
				book.setB_no(rs.getInt(1));
				book.setB_title(rs.getString(2));
				book.setB_author(rs.getString(3));
				book.setB_genre(rs.getString(4));
				book.setB_price(rs.getInt(5));
				book.setB_story(rs.getString(6));
				book.setB_year(rs.getInt(7));
				book.setB_list(rs.getString(8));
				
				bookList.add(book);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bookList;
	}
}
