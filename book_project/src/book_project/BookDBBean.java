package book_project;

import java.sql.*;

import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.jdbc.exceptions.jdbc4.MySQLDataException;

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
	
	//mysql에 접속
	public static Connection getMySQLConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://192.168.0.156:3306/mydb?useSSL=false&useUnicode=true&characterEncoding=utf-8";
			String user = "busan";
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
	
	//커넥션 풀로 mysql접속
	public Connection getMySQLConnection1() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	//insert_book.jsp에서 받은 정보를 insert_book_ok.jsp에서 데이터베이스 입력
	public int insertBook(BookBean book) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql="";
		int num = 0; //B_NO
		
		try {
			con = getMySQLConnection1();
			
			//B_NO 부여(추후 장르별로 B_NO부여 할 예정)//
			sql = "SELECT MAX(B_NO) FROM BookList";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			//B_NO의 초기값을 100000으로 주고 추가되는 책들은 1씩 더한다.
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}else{
				num = 100000;
			}
			
			//DB에 데이터를 입력
			sql = "INSERT INTO BookList(B_NO, B_TITLE, B_AUTHOR, B_GENRE, B_PRICE"
					+ ", B_STORY, B_YEAR, B_LIST) VALUES(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, book.getB_title());
			pstmt.setString(3, book.getB_author());
			pstmt.setString(4, book.getB_genre());
			pstmt.setInt(5, book.getB_price());
			pstmt.setString(6, book.getB_story());
			pstmt.setInt(7, book.getB_year());
			pstmt.setString(8, book.getB_list());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();				
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return 1; //완료시에 1을 반환한다.	
	}
	
	//검색어를 입력받아 결과를 보여줄 목록
	public ArrayList<BookBean> listBoard(String search_word) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="SELECT * FROM BookList WHERE b_title LIKE ? "
				+ "OR b_author LIKE ?";
		ArrayList<BookBean> bookList = new ArrayList<BookBean>();
		
		try {
			con = getMySQLConnection1();
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
	
	//상세보기를 눌렀을때 BookBean을 반환
	public BookBean getBook(int b_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="SELECT * FROM BookList WHERE B_NO = ?"; //해당 책의 번호
		BookBean book = null;
		
		try {
			con = getMySQLConnection1();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				book = new BookBean();
				book.setB_title(rs.getString(2));
				book.setB_author(rs.getString(3));
				book.setB_genre(rs.getString(4));
				book.setB_price(rs.getInt(5));
				book.setB_story(rs.getString(6));
				book.setB_year(rs.getInt(7));
				book.setB_list(rs.getString(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return book;
	}
	
	
}
