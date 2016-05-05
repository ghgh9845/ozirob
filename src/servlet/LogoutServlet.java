package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean;
import db.UserDAO;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
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
			
			System.out.println("login_index : "+user_mail);
			// 빈 객체에 담는다.
			HttpSession session = request.getSession();
			
			UserBean bean = (UserBean)session.getAttribute("user_bean");
			session.setAttribute("user_bean", null);
		
			String site = "login_index.jsp";
			//int result = UserDAO.check_login(bean);
			
		
				//site = "login_index.jsp?login_result=" + result;
		
			response.sendRedirect(site);
			// 4. 페이지 이동
			//RequestDispatcher dis 
			//		= request.getRequestDispatcher(site);
			//dis.forward(request, response);
				
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
