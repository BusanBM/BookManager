package book_project;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookDB {
	private static BookDB instance = new BookDB();
	
	public static BookDB getinstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context envctx = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)envctx.lookup("jdbc/MySQLDB");
		return ds.getConnection();
	}
	
	public Connection getConnection1() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//검색 결과를 보여주는 리스트
	public ArrayList<BookBean> listBook(String search_word){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select * from Book_List where title like '%?%' ";
		ArrayList<BookBean> bookList = new ArrayList<BookBean>();
		
		try {
			con = getConnection1();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search_word);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookBean book = new BookBean();
				book.setBook_no(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setBook_genre(rs.getString(4));
				book.setPrice(rs.getInt(5));
				book.setBook_year(rs.getString(6));
				book.setStory(rs.getString(7));
				book.setList(rs.getString(8));
				
				bookList.add(book);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bookList;
	}
}
