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
	

	public void login(String id,String psd) {//ѧ����½
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
	public List<Integer> cid = new ArrayList<Integer>();//�γ�id
	public List<String> cname = new ArrayList<String>();//�γ�����
	public List<String> tuserr = new ArrayList<String>();
	public List<Integer> cpic = new ArrayList<Integer>();//ͼƬid
	public List<String> cin = new ArrayList<String>();//����
	public List<String> tname = new ArrayList<String>();//��ʦ����
	
	public void sezrchcourse(String mess) {//�����γ�
		String sql="select * from course where cname LIKE '%"+mess+"%'";
		
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
	  
		while(rs.next())//��course
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

	public List<Integer> claid = new ArrayList<Integer>();//�༶id
	public List<String> classes = new ArrayList<String>();//�γ̰༶
	public List<String> cpass = new ArrayList<String>();//����
	public void searchclass(Integer cidd) {//�����༶
		String sql="select * from class where cid='"+cidd+"'";
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
	  
		while(rs.next())//��class
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

	public void seclst(String suser,Integer claid) {//�����Ƿ��Ѿ�����༶
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
	
	public void ceclst(String suser,Integer claid) {//����༶
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
	
	public void Register(String user,String psd,String name,String email) {//ע��
		String sql1=
				"insert into student(suser,spsd,smailbox,sname) values('"+user+"','"+psd+"','"+email+"','"+name+"')";
		String sql="select * from student where suser='"+user+"'";
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
		if(rs.next())
		{//����ͬ��
			tf=0;
		}else {//û����ͬ��
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
	public List<String> classname = new ArrayList<String>();//�༶����
	public void mycourse(String suser) {//��ѯ�ҵĿγ�
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
	

	public List<Integer> wid= new ArrayList<Integer>();//��ҵid
	public List<String> state= new ArrayList<String>();//��ҵ״̬
	public List<String> stitle= new ArrayList<String>();//��ҵ����
	public List<Date> deadtime=new ArrayList<Date>();
	public void seahomework(int claid,String suser) {//����ҵ
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
		    	System.out.println("���ύ");
		    	state.add("���ύ");
		    }else {
		    	System.out.println("δ�ύ");
		    	state.add("δ�ύ");
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
	
	public void upload(int wid,String suser,String fname) {//����ҵ
		String sql1=
				"insert into file(wid,suser,fname) values('"+wid+"','"+suser+"','"+fname+"')";
		String sql="SELECT * FROM file WHERE wid='"+wid+"' AND suser='"+suser+"'";
		String sql2="update file set fname='"+fname+"' where wid='"+wid+"' and suser='"+suser+"'";
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
		if(rs.next())
		{//�Ѿ��ϴ���һ��
			try {
				Statement stmt2 = conn.createStatement();
				stmt2.execute(sql2);
				tf=0;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {//û���ϴ���
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
	public void udownload(int wid,String suser) {//����
		String sql="SELECT fname FROM file WHERE wid='"+wid+"' AND suser='"+suser+"'";
		
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
		if(rs.next())
		{//����ҵ
			fname=rs.getString("fname");
				tf=1;
		}else {//û����ҵ
		
				tf=0;
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
}
