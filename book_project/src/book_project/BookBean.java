package book_project;

public class BookBean {
	private int b_no;
	private String b_title; 
	private String b_author; 
	private String b_genre; 
	private int b_price; 
	private String b_story;
	private int b_year;
	private String b_list;
	private String b_img;
	
	public static int dataPerPage = 10; //한 페이지에 보일 게시물 수
	public static int totalPage = 1;	//총 페이지 수 (총 데이터 수 / dataPerPage)
	public static int currentPage = 1;	//현재 페이지 
	
	//리스트 하단에 보여질 페이지이동 만들기
	//block : 하단에 보여질 페이지 갯수 (앞으로 블록은 5로 예를 들겠다.)
	public static String pageNumber(int block, String search_word) {
		String str="";
		
		//하단에 보여질 페이지의 첫번째 숫자 구하기
		//1~5페이지에서는 1이, 6~10페이지에서는 2가 나와야한다.
		int temp = (currentPage-1)%block;	//각 페이지마다 (처음페이지를 나오게 할) 뺄 숫자를 구한다. 
		int startPage = currentPage - temp;	//페이징 처음 숫자(1,6,11...)
		
		//시작페이지가 블록보다 클때 [이전]을 표시 (시작페이지가 6부터 [이전]이 나온다.)
		if((startPage - block)>0) {
			str = "<a href='search_result.jsp?search_word="+search_word+"&currentPage="+(startPage-1)+"'><button type='button' value='이전'></a>&nbsp;&nbsp;";
		}
		
		//시작페이지부터 끝페이지까지(1이상 6미만, 6이상 11미만...)
		for(int i=startPage; i<(startPage+block); i++) {
			//현재 페이지에서는 링크를 걸지않고 페이지 번호만 보여준다.
			if(i == currentPage) {
				str += i+"&nbsp;&nbsp;";
			//다른 페이지에서는 링크를 걸어 이동하게 한다.
			}else {
				str += "<a href='search_result.jsp?search_word="+search_word+"&currentPage="+i+"'>"+i+"</a>&nbsp;&nbsp;";
			}
			
			//i가 전체 페이지보다 클 때는 종료한다.(그 이상의 페이지를 만들지 않는다. 어차피 게시물이 없기때문에)
			if(i>=totalPage) break;
		}
		
		//[다음]페이지 표시(마지막페이지에서는 [다음]이 안나와야 함.)
		if((startPage + block)<=totalPage) {
			str += "<a href='search_result.jsp?search_word="+search_word+"&currentPage="+(startPage+block)+"'><input type='button' value='다음'></a>";
		}
		return str;
	}
	
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_genre() {
		return b_genre;
	}
	public void setB_genre(String b_genre) {
		this.b_genre = b_genre;
	}
	public String getB_author() {
		return b_author;
	}
	public void setB_author(String b_author) {
		this.b_author = b_author;
	}
	public String getB_img() {
		return b_img;
	}
	public void setB_img(String b_img) {
		this.b_img = b_img;
	}
	public int getB_price() {
		return b_price;
	}
	public void setB_price(int b_price) {
		this.b_price = b_price;
	}
	public int getB_year() {
		return b_year;
	}
	public void setB_year(int b_year) {
		this.b_year = b_year;
	}
	public String getB_story() {
		return b_story;
	}
	public void setB_story(String b_story) {
		this.b_story = b_story;
	}
	public String getB_list() {
		return b_list;
	}
	public void setB_list(String b_list) {
		this.b_list = b_list;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	
	
	
}
