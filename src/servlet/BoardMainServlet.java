package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardBean;
//import db.BoardDAO;
import db.BoardDAO;

/**
 * Servlet implementation class BoardMainServlet
 */
@WebServlet("/BoardMainServlet")
public class BoardMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardMainServlet() {
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
			String page_num_str = request.getParameter("page_num");
			if(page_num_str == null){
				page_num_str = "1";
			}
			int page_num = Integer.parseInt(page_num_str);
			// 글 목록 데이터를 가지고 온다.
			ArrayList<BoardBean> list
				= BoardDAO.get_board_all_info(page_num);
			request.setAttribute("board_list", list);
			// 페이지의 개수를 가지고 온다.
			int page_cnt = BoardDAO.getPageCnt();
			request.setAttribute("page_cnt", page_cnt);
			// 페이지 번호 셋팅
			request.setAttribute("page_num", page_num);
			
			// 이동한다.
			String site = "/mj_board_main.jsp";
			//String site = "/oz_index.jsp";
			RequestDispatcher dis 
					= request.getRequestDispatcher(site);
			dis.forward(request, response);
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
