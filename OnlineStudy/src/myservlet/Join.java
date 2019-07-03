package myservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ClassBean;
import model.Student;
import model.StudentBean;

/**
 * Servlet implementation class Join
 */
@WebServlet("/Join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Join() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cid=Integer.parseInt(request.getParameter("cid"));
		int i=Integer.parseInt(request.getParameter("i"));
		System.out.println("cid:"+cid);System.out.println("i:"+i);
		String site ="StuJoin.jsp";
		Student stu=new Student();
		stu.searchclass(cid);
		if(stu.tf==1) {
			ClassBean clabean=new ClassBean();
			HttpSession session=request.getSession(true);
			session.setAttribute("clabean",clabean);
			
			clabean.setCid(i);
			System.out.println("stu.claid:"+stu.claid);
			clabean.setClaid(stu.claid);
			clabean.setClasses(stu.classes);
			clabean.setCpass(stu.cpass);
			
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
		}else{
			ClassBean clabean=new ClassBean();
			HttpSession session=request.getSession(true);
			session.setAttribute("clabean",clabean);
			//没有记录
			clabean.setCid(i);
			
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int o=Integer.parseInt(req.getParameter("classname"));
		String cpass=req.getParameter("classpass");//输入的密码
		HttpSession session=req.getSession(true);
		StudentBean stubean=(StudentBean)session.getAttribute("bean");
		ClassBean clabean=(ClassBean)session.getAttribute("clabean");
		int clai=clabean.getClaid().get(o);
		String pass=clabean.getCpass().get(o);
		
		String suser=stubean.getSuser();
		resp.setCharacterEncoding("UTF-8");
		System.out.println("cpass:"+cpass);
		System.out.println("pass:"+pass);
		
		if(cpass.equals(pass)) {
			System.out.println("cpass==pass");
			Student stu=new Student();
			stu.seclst(suser,clai);
			if (stu.tf==1) {//已经加入了班级
				System.out.println("ok");
				req.setAttribute("message", "ok");
				req.getRequestDispatcher("/StuJoin.jsp").forward(req, resp);
			}else if (stu.tf==0) {
				stu.ceclst(suser,clai);
				if (stu.tf==1) {
					req.setAttribute("message", "no");
					req.getRequestDispatcher("/StuJoin.jsp").forward(req, resp);
				}
			}
		}else{
			req.setAttribute("message", "np");
			req.getRequestDispatcher("/StuJoin.jsp").forward(req, resp);
		}
		
		
	}

	
}
