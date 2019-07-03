package myservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.HomeworkBean;
import model.MyCourseBean;
import model.Student;
import model.StudentBean;

/**
 * Servlet implementation class Homeworks
 */
@WebServlet("/Homeworks")
public class Homeworks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Homeworks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int i=Integer.parseInt(request.getParameter("i"));
		HttpSession session=request.getSession(true);
		MyCourseBean mybean=(MyCourseBean)session.getAttribute("mybean");
		StudentBean stubean=(StudentBean)session.getAttribute("bean");
		String suser=stubean.getSuser();
		List<Integer> claid=mybean.getClaid();//班级id
		int claidd=claid.get(i);
		String site ="StuHomeWork.jsp";
		Student stu=new Student();
		stu.seahomework(claidd,suser);
		if(stu.tf==1) {//有作业
			HomeworkBean hwbean=new HomeworkBean();
			session.setAttribute("hwbean",hwbean);
			hwbean.setClaid(claidd);
			hwbean.setWid(stu.wid);
			hwbean.setState(stu.state);
			hwbean.setStitle(stu.stitle);
			hwbean.setDeadtime(stu.deadtime);
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
			
		}else if (stu.tf==0) {//没作业
			HomeworkBean hwbean=new HomeworkBean();
			session.setAttribute("hwbean",hwbean);
			hwbean.setClaid(claidd);
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
		}
	}

}
