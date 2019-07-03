package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Dao.DBConn;

public class Teacher {
	Connection conn=DBConn.getConnection();
	public int tf=0;
	public String tuser;
	public String tpsd;
	public String tmailbox;
	public String tschool;
	public String tname;
	public int tid;
	
	public void Register(String user,String psd,String name,String email) {//ע��
		String sql1=
				"insert into teacher(tuser,tpsd,tmailbox,tname) values('"+user+"','"+psd+"','"+email+"','"+name+"')";
		String sql="select * from teacher where tuser='"+user+"'";
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
	
	public void login(String id,String psd) {//��ʦ��½
		String sql="select * from teacher where tuser='"+id+"' and tpsd='"+psd+"'";
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
		if(rs.next())
		{
			tf=1;
			tuser=rs.getString("tuser");
			tpsd=rs.getString("tpsd");
			tmailbox=rs.getString("tmailbox");
			tschool=rs.getString("tschool");
			tname=rs.getString("tname");
			tid=rs.getInt("tid");
		}else {
			tf=0;
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	public List<Integer> cid = new ArrayList<Integer>();//�γ�id
	public List<String> cname = new ArrayList<String>();//�γ�����
	public List<Integer> cpic = new ArrayList<Integer>();//ͼƬid
	public List<String> tnamee = new ArrayList<String>();//��ʦ����
	public void mycourse(String tuser) {//��ѯ�ҵĿγ�
		String sql="select * from course where tuser='"+tuser+"'";
		try {
			Statement stmt = conn.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
	  
		if(rs.next())
		{
			String sql1="SELECT course.cid,course.cname,course.cpic,teacher.tname "
					+ "FROM course,teacher "
					+ "WHERE teacher.tuser=course.tuser "
					+ "AND course.tuser='"+tuser+"';";
			try {
				Statement stmt1 = conn.createStatement();
				ResultSet rs1 =stmt1.executeQuery(sql1);
		  
			while(rs1.next())
			{
				cid.add(rs1.getInt("course.cid"));
				cname.add(rs1.getString("course.cname"));
				tnamee.add(rs1.getString("teacher.tname"));
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
}
