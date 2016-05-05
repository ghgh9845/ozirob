package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.BoardBean;

public class BoardDAO {

	// 데이터베이스 글 내용을 저장하는 메서드
	public static int add_board_data(BoardBean bean)
					throws Exception {
		Connection conn = DBConnector.getConnection();
		
		String sql = "insert into BOARD_TABLE "
				   + "(BOARD_IDX, BOARD_TITLE, BOARD_CONTENT, BOARD_WRITER,"
				   + "BOARD_KIND, BOARD_SUB_KIND) "
				   + "values (BOARD_TABLE_SEQ.nextval, ?, ?, ?,1,1)";
		
		PreparedStatement pstmt
					= conn.prepareStatement(sql);
		pstmt.setString(1, bean.getBoard_title());
		pstmt.setString(2, bean.getBoard_content());
		pstmt.setString(3, bean.getBoard_writer());
		
		pstmt.execute();
		
		sql = "select MAX(BOARD_IDX) "
			+ "from BOARD_TABLE";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		
		int max = rs.getInt(1);
		
		conn.close();
		
		return max;
	}
	// 글 데이터 하나를 가지고 오는 메서드
	public static BoardBean getBoardInfo(int board_idx)
								throws Exception{
		Connection conn = DBConnector.getConnection();
		
		String sql = "select u.USER_NICKNAME, b.BOARD_WRITER, b.BOARD_TITLE, "
				   +        "b.BOARD_CONTENT "
				   + "from USER_TABLE u, BOARD_TABLE b "
				   + "where u.USER_MAIL = b.BOARD_WRITER "
				   +        "and b.BOARD_IDX=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, board_idx);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		BoardBean bean = new BoardBean();
		bean.setBoard_title(rs.getString("BOARD_TITLE"));
		bean.setBoard_content(rs.getString("BOARD_CONTENT"));
		bean.setBoard_writer(rs.getString("BOARD_WRITER"));
		
		conn.close();
		
		return bean;
	}
	// 글 목록 데이터를 가져오는 메서드
	public static ArrayList<BoardBean> 
					get_board_all_info(int page_num)
						throws Exception {
		Connection conn = DBConnector.getConnection();
		
		String sql = "select * from "
				   + "(select ROWNUM as rnum, a1.* from "
				   + "(select b.BOARD_IDX, b.BOARD_TITLE, u.USER_MAIL "
				   + "from USER_TABLE u, BOARD_TABLE b "
				   + "where u.USER_MAIL = b.BOARD_WRITER order by b.BOARD_IDX desc) a1) a2 "
				   + "where a2.rnum >= ? and a2.rnum <= ?";
		int min = 1 + ((page_num - 1) * 10);
		int max = min + 9;
		
		PreparedStatement pstmt 
					= conn.prepareStatement(sql);
		pstmt.setInt(1, min);
		pstmt.setInt(2, max);
		
		ResultSet rs = pstmt.executeQuery();
		// 데이터를 추출해서 담는다.
		ArrayList<BoardBean> list
						= new ArrayList<BoardBean>();
		while(rs.next()){
			// 데이터 추출
			int board_idx = rs.getInt("BOARD_IDX");
			String board_title = rs.getString("BOARD_TITLE");
//			String board_writer = rs.getString("USER_NAME");
			String board_writer = rs.getString("USER_MAIL");
			// 데이터를 담는다.
			BoardBean bean = new BoardBean();
			bean.setBoard_idx(board_idx);
			bean.setBoard_title(board_title);
			bean.setBoard_writer(board_writer);
			// 리스트에 담는다.
			list.add(bean);
		}
		
		conn.close();
		
		return list;
	}
	// 전체 페이지의 개수를 구한다.
	public static int getPageCnt() throws Exception{
		Connection conn = DBConnector.getConnection();
		
		String sql = "select COUNT(*) from BOARD_TABLE";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		
		int cnt = rs.getInt(1);
		int page_cnt = cnt / 10;
		if(cnt % 10 > 0){
			page_cnt++;
		}
		
		conn.close();
		
		return page_cnt;
	}
	//글을 삭제하는 메소드
	public static void remove_board(int board_idx) throws Exception{
		Connection conn = DBConnector.getConnection();
		String sql = "delete from BOARD_TABLE"
					+"where BOARD_IDX=?";
		PreparedStatement pstmt = 
					conn.prepareStatement(sql);
		pstmt.setInt(1, board_idx);
		pstmt.execute();
		conn.close();
	}
	public static void modify_board(BoardBean bean, int remove_flag) throws Exception{
		Connection conn = DBConnector.getConnection();
		//쿼리문
		String sql = "update BOARD_TABLE "
				   + "set BOARD_TITLE=?, "
				   + "BOARD_CONTENT=? ";
		boolean isAddQuery = false;
		/*//사용자가 이미지를 새로 지정했을 경우
		if(bean.getBoard_file_name() != null){
			sql += ", BOARD_FILE_NAME=? ";
			isAddQuery = true;
		}
		//사용자가 이미지를 지정하지 않고 삭제 버튼을 눌렀을 경우
		if(bean.getBoard_file_name()==null
					&& remove_flag==1){
			sql+=", BOARD_FILE_NAME=?";
			isAddQuery = true;
		}*/
		
		sql += "where BOARD_IDX=?";
		PreparedStatement pstmt 
			= conn.prepareStatement(sql);
		pstmt.setString(1, bean.getBoard_title());
		pstmt.setString(2, bean.getBoard_content());
		//if(isAddQuery == true){
		//	pstmt.setString(3, bean.getBoard_file_name());
			pstmt.setInt(3, bean.getBoard_idx());
		//} else {
		//	pstmt.setInt(3, bean.getBoard_idx());
		//}
		pstmt.execute();
		
		conn.close();
	}

}
