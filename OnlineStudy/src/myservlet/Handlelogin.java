package myservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Student;
import model.StudentBean;
import model.Teacher;
import model.TeacherBean;

/**
 * Servlet implementation class Handlelogin
 */
@WebServlet("/Handlelogin")
public class Handlelogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Handlelogin() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username").trim();
		String password=request.getParameter("password").trim();
		String man=request.getParameter("man");
		response.setCharacterEncoding("UTF-8");

		if(man.equals("tea")) {//老师登陆
			Teacher tea=new Teacher();
			tea.login(username,password);
			if(tea.tf==1) {
				TeacherBean teabean=new TeacherBean();
				HttpSession session=request.getSession(true);
				session.setAttribute("teabean",teabean);
				
				teabean.setTuser(tea.tuser);
				teabean.setTpsd(tea.tpsd);
				teabean.setTmailbox(tea.tmailbox);
				teabean.setTschool(tea.tschool);
				teabean.setTname(tea.tname);
				System.out.println("Tname"+tea.tuser);
				teabean.setTid(tea.tid);
				
				request.setAttribute("message", "okk");
				request.getRequestDispatcher("/Login.jsp").forward(request, response);
			}else if(tea.tf==0) {
				request.setAttribute("message", "no");
				request.getRequestDispatcher("/Login.jsp").forward(request, response);
			}
		}else if(man.equals("stu")) {//学生登陆
			Student stu=new Student();
			stu.login(username,password);
			if(stu.tf==1) {
				StudentBean stubean=new StudentBean();
				HttpSession session=request.getSession(true);
				session.setAttribute("bean",stubean);
				
				stubean.setSuser(stu.suser);
				stubean.setSpsd(stu.spsd);
				stubean.setSmailbox(stu.smailbox);
				stubean.setSschool(stu.sschool);
				stubean.setSname(stu.sname);
				System.out.println("Sname"+stu.suser);
				stubean.setSid(stu.sid);
				
				request.setAttribute("message", "ok");
				request.getRequestDispatcher("/Login.jsp").forward(request, response);
			}else if(stu.tf==0) {
				request.setAttribute("message", "no");
				request.getRequestDispatcher("/Login.jsp").forward(request, response);
			}
		}
	}

}
