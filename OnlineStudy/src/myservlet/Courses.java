package myservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MyCourseBean;
import model.Student;
import model.StudentBean;

/**
 * Servlet implementation class Courses
 */
@WebServlet("/Courses")
public class Courses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Courses() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(true);
		StudentBean stubean=(StudentBean)session.getAttribute("bean");
		String suser=stubean.getSuser();
		String site ="StuCourse.jsp";
		Student stu=new Student();
		stu.mycourse(suser);
		if(stu.tf==1) {
			MyCourseBean mybean=new MyCourseBean();
			session.setAttribute("mybean",mybean);
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
		}else {
			MyCourseBean mybean=new MyCourseBean();
			session.setAttribute("mybean",mybean);
			mybean.setCsid(stu.csid);
			mybean.setClaid(stu.claid);
			mybean.setClassname(stu.classname);
			mybean.setCid(stu.cid);
			mybean.setCname(stu.cname);
			mybean.setTname(stu.tname);
			mybean.setCpic(stu.cpic);
			
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
		}
	}

}
