package myservlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.HomeworkBean;
import model.Student;
import model.StudentBean;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
@MultipartConfig
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int widd=Integer.parseInt(req.getParameter("wid")); 
		HttpSession session=req.getSession(true);
		StudentBean stubean=(StudentBean)session.getAttribute("bean");
		String suser=stubean.getSuser();
		Student stu=new Student();
		stu.udownload(widd,suser);
		if (stu.tf==1) {
			//得到要下载的文件名
	        String fileName = stu.fname;
	        //要下载的文件的目录
	        String fileSavePath = "D:\\eclipse\\work\\OnlineStudy\\file\\";
	        //要下载的文件
	        File file = new File(fileSavePath+fileName);
	 
	        //设置响应头,控制浏览器下载该文件
	        resp.setHeader("content-disposition","attachment;filename*=UTF-8''" + URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20"));
	        //读取要下载的文件,保存到文件输入流
	        FileInputStream in = new FileInputStream(fileSavePath +fileName);
	        //创建输出流
	        OutputStream out = resp.getOutputStream();
	        //创建缓冲区
	        byte buffer[] = new byte[1024];
	        int len = 0;
	        //循环将输入流中的内容读取到缓冲区当中
	        while(0<=(len=in.read(buffer))){
	            //输出缓冲区的内容到浏览器,实现文件下载
	            out.write(buffer, 0, len);
	        }
	        //关闭文件输入输出流
	        out.close();
	        in.close();

		}else if (stu.tf==0) {
			req.setAttribute("info", "upno");
			req.getRequestDispatcher("/StuHomeWork.jsp").forward(req, resp);
		}
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		int i=Integer.parseInt(request.getParameter("i"));

		try {
			
			//获取上传的文件
			Part part=request.getPart("file");
			//获取请求的信息
			String name=part.getHeader("content-disposition");
			System.out.println(name);//测试使用
			//System.out.println(desc);//
			             
			//获取文件的后缀
			String str=name.substring(name.lastIndexOf("."), name.length()-1);
			System.out.println("测试获取文件的后缀："+str);
			//生成一个新的文件名，不重复，数据库存储的就是这个文件名，不重复的
			String filename=UUID.randomUUID().toString()+str;
			System.out.println("filename1:"+filename);
			System.out.println("测试产生新的文件名："+"D:\\eclipse\\work\\OnlineStudy\\file\\"+filename);
			//上传文件到指定目录，不想上传文件就不调用这个
			part.write("D:\\eclipse\\work\\OnlineStudy\\file\\"+filename);
			HttpSession session=request.getSession(true);
			StudentBean stubean=(StudentBean)session.getAttribute("bean");
			String suser=stubean.getSuser();
			HomeworkBean hwbean=(HomeworkBean)session.getAttribute("hwbean");
			int wid=hwbean.getWid().get(i);
			Student stu=new Student();
			System.out.println("filename2:"+filename);
			stu.upload(wid,suser,filename);
			if (stu.tf==0) {//上传过
				request.setAttribute("info", "okk");
				request.getRequestDispatcher("/StuHomeWork.jsp").forward(request, response);
			}else if(stu.tf==1){//第一次上传
				hwbean.getState().set(i,"已提交");
				session.setAttribute("hwbean",hwbean);
				request.setAttribute("info", "ok");
				request.getRequestDispatcher("/StuHomeWork.jsp").forward(request, response);
			}
			} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("info", "no");
			request.getRequestDispatcher("/StuHomeWork.jsp").forward(request, response);
			}
			
	}

}
