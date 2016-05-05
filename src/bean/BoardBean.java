package bean;

public class BoardBean {
	private int board_idx; /*게시판 번호*/
	private String board_kind; /*게시판 종류*/
	private String board_sub_kind;/*게시판 세부종류*/
	private String board_title; /*게시글 제목*/
	private String board_content; /*게시글 내용*/
	private int board_like;/* 게시글 좋아요*/
	private int board_hate;/* 게시글 싫어요*/
	private String board_date;/* 게시글 날짜*/
	private String board_writer; /*게시자*/
	
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_sub_kind() {
		return board_sub_kind;
	}
	public void setBoard_sub_kind(String board_sub_kind) {
		this.board_sub_kind = board_sub_kind;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getBoard_kind() {
		return board_kind;
	}
	public void setBoard_kind(String board_kind) {
		this.board_kind = board_kind;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public int getBoard_like() {
		return board_like;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}
	public int getBoard_hate() {
		return board_hate;
	}
	public void setBoard_hate(int board_hate) {
		this.board_hate = board_hate;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
}
