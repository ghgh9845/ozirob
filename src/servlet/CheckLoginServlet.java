package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean;
import db.UserDAO;

/**
 * Servlet implementation class CheckLoginServlet
 */
@WebServlet("/CheckLoginServlet")
public class CheckLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try{
			// 파라미터 데이터 추출
			String user_mail = request.getParameter("user_mail");
			String user_pw = request.getParameter("user_pw");
			
			System.out.println(user_mail);
			
			// 빈 객체에 담는다.
			UserBean bean = new UserBean();
			bean.setUser_mail(user_mail);
			bean.setUser_pw(user_pw);
			// 로그인 결과를 가져온다.
			int result = UserDAO.check_login(bean);
			// 로그인 결과에 따라 처리한다.
			String site = null;
			if(result == 0){	// 로그인 성공
				site = "board_main.minji";
				// 사용자 정보를 가지고 온다.
				UserBean user_bean = UserDAO.getUserInfo(user_mail);
				System.out.println("야");
				
				// 사용자 아이디 셋팅
				user_bean.setUser_mail(user_mail);
				// 로그인 여부값 셋팅
				user_bean.setLogin(true);
				// 세션에 담는다.
				HttpSession session = request.getSession();
				session.setAttribute("user_bean", user_bean);
			} else {			// 로그인 실패
				site = "login_index.jsp?login_result=" + result;
			}
			
				response.sendRedirect(site);
				
		}catch(Exception e){
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
