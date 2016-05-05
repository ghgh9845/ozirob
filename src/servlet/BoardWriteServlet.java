package servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import bean.BoardBean;
import bean.UserBean;
import db.BoardDAO;

/**
 * Servlet implementation class BoardWriteServlet
 */
@WebServlet("/BoardWriteServlet")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 파일 업로드될 물리적인 경로를 파악한다.
				ServletContext context = getServletContext();
				/*String path = context.getRealPath("/upload");
				// 파일 용량
				int max2 = 1024 * 1024 * 100;	//100MB
				// 인코딩 타입
				String enc = "utf-8";
				// 파일 업로드 처리
				DefaultFileRenamePolicy dfr
							= new DefaultFileRenamePolicy();
				MultipartRequest mr
					= new MultipartRequest(request, path, 
												max2, enc, dfr);
				*/
			
			
				// 파라미터 데이터 추출
				String board_title 
						= request.getParameter("board_title");
				String board_content
						= request.getParameter("board_content");
				System.out.println(board_title);
				// 파일 이름 추출
/*				String board_file_name
						= request.getFilesystemName("board_file_name");
*/				// 세션으로부터 사용자 아이디를 추출
				HttpSession session = request.getSession();
				UserBean user_bean 
					= (UserBean)session.getAttribute("user_bean");
				String board_writer = user_bean.getUser_mail();
				// 빈 객체에 담는다.
				BoardBean bean = new BoardBean();
				bean.setBoard_title(board_title);
				bean.setBoard_content(board_content);
				bean.setBoard_writer(board_writer);
				// 데이터 베이스에 저장한다.
				int max = 0;
				try{
					max = BoardDAO.add_board_data(bean);
				}catch(Exception e){
					e.printStackTrace();
				}
				// 글을 읽는 페이지로 이동한다.
				String site = "mj_board_read.minji?board_idx=" + max;
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
