package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.UserBean;

public class UserDAO {
	// 아이디가 존재하는 확인하는 메서드
		// 아이디가 있으면 true, 없으면 false
		public static boolean is_exist_user_id(String user_mail)
										throws Exception{
			// 쿼리문
			String sql = "select * from USER_TABLE "
					   + "where USER_MAIL=?";
			// 디비 접속
			// import java.sql
			Connection conn = DBConnector.getConnection();
			
			PreparedStatement pstmt
						= conn.prepareStatement(sql);
			
			pstmt.setString(1, user_mail);
			
			ResultSet rs = pstmt.executeQuery();
			
			// 가져온 데이터가 있는지 확인
			boolean check = rs.next();
			
			conn.close();
			
			return check;
		}
		// 사용자 정보를 저장하는 메서드
		public static void add_user_info(UserBean bean)
										throws Exception {
			Connection conn = DBConnector.getConnection();
			
			// 쿼리문
			String sql = "insert into USER_TABLE "
					   + "(USER_MAIL, USER_PW, USER_NICKNAME) "
					   + "values (?, ?, ?)";
			
			PreparedStatement pstmt
						= conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getUser_mail());
			pstmt.setString(2, bean.getUser_pw());
			pstmt.setString(3, bean.getUser_nickname());
			
			pstmt.execute();
					
			conn.close();
		}
		// 로그인 확인하는 메서드
		// 반환 0 : 로그인 성공
		// 반환 1 : 아이디가 잘못된 경우
		// 반환 2 : 비밀번호가 잘못된 경우
		public static int check_login(UserBean bean)
									throws Exception {
			Connection conn = DBConnector.getConnection();
			
			String sql = "select USER_PW "
					   + "from USER_TABLE "
					   + "where USER_MAIL=?";
			
			PreparedStatement pstmt
						= conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getUser_mail());
			
			ResultSet rs = pstmt.executeQuery();
			
			int result = 0;
			
			if(rs.next()){		// 아이디가 있는 경우
				// 비밀번호를 추출한다.
				String user_pw = rs.getString("USER_PW");
				// 비교한다.
				if(user_pw.equals(bean.getUser_pw()) == false){
					result = 2;
				}
			} else {			// 아이디가 없는 경우
				result = 1;
			}
			
			conn.close();
			
			return result;
		}
		// 사용자 정보를 가지고 오는 메서드
		public static UserBean getUserInfo(String user_mail)
							throws Exception{
			Connection db = DBConnector.getConnection();
			// System.out.println("야");
			
			String sql = "select USER_NICKNAME "
					   + "from USER_TABLE "
					   + "where USER_MAIL=?";
			PreparedStatement pstmt
							= db.prepareStatement(sql);
			pstmt.setString(1, user_mail);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			UserBean bean = new UserBean();
			bean.setUser_nickname(rs.getString("USER_NICKNAME"));
			System.out.println("야");
			
			db.close();
			
			return bean;
		}
	
}
