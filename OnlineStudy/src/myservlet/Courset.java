package myservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MyCourseBean;
import model.Teacher;
import model.TeacherBean;

/**
 * Servlet implementation class Courset
 */
@WebServlet("/Courset")
public class Courset extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Courset() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(true);
		TeacherBean teabean=(TeacherBean)session.getAttribute("teabean");
		String tuser=teabean.getTuser();
		String site ="TeaCourse.jsp";
		Teacher Tea=new Teacher();
		Tea.mycourse(tuser);
		if(Tea.tf==1) {
			MyCourseBean mybean=new MyCourseBean();
			session.setAttribute("mybean",mybean);
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
		}else {
			MyCourseBean mybean=new MyCourseBean();
			session.setAttribute("mybean",mybean);

			mybean.setCid(Tea.cid);
			mybean.setCname(Tea.cname);
			mybean.setTname(Tea.tnamee);
			mybean.setCpic(Tea.cpic);
			
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
		}
	}

}
