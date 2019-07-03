package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;


import Dao.DBConn;

public class Student {
	Connection conn=DBConn.getConnection();
	public int tf=0;
	public String suser;
	public String spsd;
	public String smailbox;
	public String sschool;
	public String sname;
	public int sid;
	

	public void login(String id,String psd) {//学生登陆
		String sql="select * from student where suser='"+id+"' and spsd='"+psd+"'";
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
		if(rs.next())
		{
			tf=1;
			suser=rs.getString("suser");
			spsd=rs.getString("spsd");
			smailbox=rs.getString("smailbox");
			sschool=rs.getString("sschool");
			sname=rs.getString("sname");
			sid=rs.getInt("sid");
		}else {
			tf=0;
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String tuser;
	public List<Integer> cid = new ArrayList<Integer>();//课程id
	public List<String> cname = new ArrayList<String>();//课程名称
	public List<String> tuserr = new ArrayList<String>();
	public List<Integer> cpic = new ArrayList<Integer>();//图片id
	public List<String> cin = new ArrayList<String>();//介绍
	public List<String> tname = new ArrayList<String>();//老师名字
	
	public void sezrchcourse(String mess) {//搜索课程
		String sql="select * from course where cname LIKE '%"+mess+"%'";
		
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
	  
		while(rs.next())//找course
		{
			tf=1;
			cid.add(rs.getInt("cid"));
			cname.add(rs.getString("cname"));
			tuserr.add(rs.getString("tuser"));
			tuser=rs.getString("tuser");
			cpic.add(rs.getInt("cpic"));
			cin.add(rs.getString("cintroduce"));
			String sql2="select tname from teacher where tuser='"+tuser+"'";
			Statement stmt1 = conn.createStatement();
			ResultSet rs2 =stmt1.executeQuery(sql2);
			rs2.next();
			tname.add(rs2.getString("tname"));
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public List<Integer> claid = new ArrayList<Integer>();//班级id
	public List<String> classes = new ArrayList<String>();//课程班级
	public List<String> cpass = new ArrayList<String>();//密码
	public void searchclass(Integer cidd) {//搜索班级
		String sql="select * from class where cid='"+cidd+"'";
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
	  
		while(rs.next())//找class
		{
			tf=1;
			classes.add(rs.getString("class"));
			claid.add(rs.getInt("claid"));
			cpass.add(rs.getString("cpass"));
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void seclst(String suser,Integer claid) {//查找是否已经加入班级
		String sql="select * from clastu where suser='"+suser+"' and claid='"+claid+"'";
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
	  
		if(rs.next())
		{
			tf=1;
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void ceclst(String suser,Integer claid) {//加入班级
		String sql=
				"insert into clastu(suser,claid) values('"+suser+"','"+claid+"')";
		try {
			Statement stmt = conn.createStatement();
			stmt.execute(sql);
			tf=1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void Register(String user,String psd,String name,String email) {//注册
		String sql1=
				"insert into student(suser,spsd,smailbox,sname) values('"+user+"','"+psd+"','"+email+"','"+name+"')";
		String sql="select * from student where suser='"+user+"'";
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
		if(rs.next())
		{//有相同的
			tf=0;
		}else {//没有相同的
			try {
				Statement stmt1 = conn.createStatement();
				stmt1.execute(sql1);
				tf=1;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public List<Integer> csid = new ArrayList<Integer>();//
	public List<String> classname = new ArrayList<String>();//班级名字
	public void mycourse(String suser) {//查询我的课程
		String sql="select * from clastu where suser='"+suser+"'";
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
	  
		if(rs.next())
		{
			String sql1="SELECT clastu.csid,class.claid,class.class,course.cid,course.cname,teacher.tname,course.cpic "
					+ "FROM clastu,class,course,teacher "
					+ "WHERE clastu.claid=class.claid AND class.cid=course.cid AND "
					+ "clastu.suser='"+suser+"'AND course.tuser=teacher.tuser;";
			try {
				Statement stmt1 = conn.createStatement();
				ResultSet rs1 =stmt1.executeQuery(sql1);
		  
			while(rs1.next())
			{
				csid.add(rs1.getInt("clastu.csid"));
				claid.add(rs1.getInt("class.claid"));
				classname.add(rs1.getString("class.class"));
				cid.add(rs1.getInt("course.cid"));
				cname.add(rs1.getString("course.cname"));
				tname.add(rs1.getString("teacher.tname"));
				cpic.add(rs1.getInt("course.cpic"));
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {
			tf=1;
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}
	

	public List<Integer> wid= new ArrayList<Integer>();//作业id
	public List<String> state= new ArrayList<String>();//作业状态
	public List<String> stitle= new ArrayList<String>();//作业标题
	public List<Date> deadtime=new ArrayList<Date>();
	public void seahomework(int claid,String suser) {//看作业
		String sql="select * from homework where claid='"+claid+"'";
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
	  
		while(rs.next())
		{
			tf=1;
			wid.add(rs.getInt("wid"));
			String sql1="select * from file where wid='"+rs.getInt("wid")+"' and suser='"+suser+"'";
			try {
			Statement stmt1 = conn.createStatement();
		    ResultSet rs1 =stmt1.executeQuery(sql1);
		    if(rs1.next()) {
		    	System.out.println("已提交");
		    	state.add("已提交");
		    }else {
		    	System.out.println("未提交");
		    	state.add("未提交");
		    }}catch (SQLException e2) {
				e2.printStackTrace();
			}		
			stitle.add(rs.getString("stitle"));
			deadtime.add(rs.getDate("deadtime"));
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	public void upload(int wid,String suser,String fname) {//交作业
		String sql1=
				"insert into file(wid,suser,fname) values('"+wid+"','"+suser+"','"+fname+"')";
		String sql="SELECT * FROM file WHERE wid='"+wid+"' AND suser='"+suser+"'";
		String sql2="update file set fname='"+fname+"' where wid='"+wid+"' and suser='"+suser+"'";
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
		if(rs.next())
		{//已经上传过一次
			try {
				Statement stmt2 = conn.createStatement();
				stmt2.execute(sql2);
				tf=0;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {//没有上传过
			try {
				Statement stmt1 = conn.createStatement();
				stmt1.execute(sql1);
				tf=1;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public String fname;
	public void udownload(int wid,String suser) {//下载
		String sql="SELECT fname FROM file WHERE wid='"+wid+"' AND suser='"+suser+"'";
		
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
		if(rs.next())
		{//有作业
			fname=rs.getString("fname");
				tf=1;
		}else {//没有作业
		
				tf=0;
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
}
