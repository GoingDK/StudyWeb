package myservlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Student;
import model.Teacher;

/**
 * Servlet implementation class HandleRegister
 */
@WebServlet("/HandleRegister")
public class HandleRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleRegister() {
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
		request.setCharacterEncoding("UTF-8");
		String username=request.getParameter("user").trim();
		String password=request.getParameter("psd").trim();
		String name=request.getParameter("name").trim();
		String email=request.getParameter("email").trim();
		String man=request.getParameter("man");
		response.setCharacterEncoding("UTF-8");
		
		if (man.equals("teacher")) {//老师注册
			Teacher tea=new Teacher();
			tea.Register(username,password,name,email);
			if (tea.tf==0) {//已存在
				request.setAttribute("message", "no");
				request.getRequestDispatcher("/Register.jsp").forward(request, response);
			}else if (tea.tf==1) {
				request.setAttribute("message", "ok");
				request.getRequestDispatcher("/Register.jsp").forward(request, response);
			}
		}else if (man.equals("student")) {//学生注册
			Student stu=new Student();
			stu.Register(username,password,name,email);
			if (stu.tf==0) {//已存在
				request.setAttribute("message", "no");
				request.getRequestDispatcher("/Register.jsp").forward(request, response);
			}else if (stu.tf==1) {
				request.setAttribute("message", "ok");
				request.getRequestDispatcher("/Register.jsp").forward(request, response);
			}
		}
		
	}

}
