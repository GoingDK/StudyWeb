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
			//�õ�Ҫ���ص��ļ���
	        String fileName = stu.fname;
	        //Ҫ���ص��ļ���Ŀ¼
	        String fileSavePath = "D:\\eclipse\\work\\OnlineStudy\\file\\";
	        //Ҫ���ص��ļ�
	        File file = new File(fileSavePath+fileName);
	 
	        //������Ӧͷ,������������ظ��ļ�
	        resp.setHeader("content-disposition","attachment;filename*=UTF-8''" + URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20"));
	        //��ȡҪ���ص��ļ�,���浽�ļ�������
	        FileInputStream in = new FileInputStream(fileSavePath +fileName);
	        //���������
	        OutputStream out = resp.getOutputStream();
	        //����������
	        byte buffer[] = new byte[1024];
	        int len = 0;
	        //ѭ�����������е����ݶ�ȡ������������
	        while(0<=(len=in.read(buffer))){
	            //��������������ݵ������,ʵ���ļ�����
	            out.write(buffer, 0, len);
	        }
	        //�ر��ļ����������
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
			
			//��ȡ�ϴ����ļ�
			Part part=request.getPart("file");
			//��ȡ�������Ϣ
			String name=part.getHeader("content-disposition");
			System.out.println(name);//����ʹ��
			//System.out.println(desc);//
			             
			//��ȡ�ļ��ĺ�׺
			String str=name.substring(name.lastIndexOf("."), name.length()-1);
			System.out.println("���Ի�ȡ�ļ��ĺ�׺��"+str);
			//����һ���µ��ļ��������ظ������ݿ�洢�ľ�������ļ��������ظ���
			String filename=UUID.randomUUID().toString()+str;
			System.out.println("filename1:"+filename);
			System.out.println("���Բ����µ��ļ�����"+"D:\\eclipse\\work\\OnlineStudy\\file\\"+filename);
			//�ϴ��ļ���ָ��Ŀ¼�������ϴ��ļ��Ͳ��������
			part.write("D:\\eclipse\\work\\OnlineStudy\\file\\"+filename);
			HttpSession session=request.getSession(true);
			StudentBean stubean=(StudentBean)session.getAttribute("bean");
			String suser=stubean.getSuser();
			HomeworkBean hwbean=(HomeworkBean)session.getAttribute("hwbean");
			int wid=hwbean.getWid().get(i);
			Student stu=new Student();
			System.out.println("filename2:"+filename);
			stu.upload(wid,suser,filename);
			if (stu.tf==0) {//�ϴ���
				request.setAttribute("info", "okk");
				request.getRequestDispatcher("/StuHomeWork.jsp").forward(request, response);
			}else if(stu.tf==1){//��һ���ϴ�
				hwbean.getState().set(i,"���ύ");
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
