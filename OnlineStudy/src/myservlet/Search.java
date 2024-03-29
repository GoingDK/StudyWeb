package myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SearchBean;
import model.Student;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String searchmess=request.getParameter("search").trim();
		response.setCharacterEncoding("UTF-8");
		
		if(searchmess.length()<1) {
			request.setAttribute("message", "nomess");
			request.getRequestDispatcher("/Stumain.jsp").forward(request, response);
		}else {
			Student stu=new Student();
			stu.sezrchcourse(searchmess);
			if(stu.tf==1) {//�н��
				SearchBean seabean=new SearchBean();
				HttpSession session=request.getSession(true);
				session.setAttribute("seabean",seabean);
				
				seabean.setCid(stu.cid);
				seabean.setCname(stu.cname);
				seabean.setTuserr(stu.tuserr);
				seabean.setCpic(stu.cpic);
				seabean.setCin(stu.cin);
				seabean.setTname(stu.tname);
				request.setAttribute("message", "ok");
				request.getRequestDispatcher("/Stumain.jsp").forward(request, response);
			}else {
				request.setAttribute("message", "no");
				request.getRequestDispatcher("/Stumain.jsp").forward(request, response);
			}
		}
	}

}
