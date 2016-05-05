package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserBean;
import db.UserDAO;

/**
 * Servlet implementation class AddUserProServlet
 */
@WebServlet("/AddUserProServlet")
public class AddUserProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 파라미터 데이터 추출
		String user_mail = request.getParameter("user_mail");
		String user_pw = request.getParameter("user_pw");
		String user_nickname = request.getParameter("user_nickname");
		
		// 데이터를 담을 빈 객체 생성
		UserBean bean = new UserBean();
		bean.setUser_mail(user_mail);
		bean.setUser_pw(user_pw);
		bean.setUser_nickname(user_nickname);
		try{
			// 쿼리실행
			UserDAO.add_user_info(bean);
		}catch(Exception e){
			e.printStackTrace();
		}
		String site = "register_result.minji";
		
		response.sendRedirect(site);

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
