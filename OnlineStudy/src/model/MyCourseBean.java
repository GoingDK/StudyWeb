package model;

import java.util.ArrayList;
import java.util.List;

public class MyCourseBean {
	List<Integer> csid= new ArrayList<Integer>();//
	List<Integer> claid= new ArrayList<Integer>();//班级id
	List<String> classname= new ArrayList<String>();//班级名字
	List<Integer> cid= new ArrayList<Integer>();//课程id
	List<String> cname= new ArrayList<String>();//课程名字
	List<String> tname= new ArrayList<String>();//课程老师
	List<Integer> cpic= new ArrayList<Integer>();//课程图片
	public List<Integer> getCsid() {
		return csid;
	}
	public void setCsid(List<Integer> csid) {
		this.csid = csid;
	}
	public List<Integer> getClaid() {
		return claid;
	}
	public void setClaid(List<Integer> claid) {
		this.claid = claid;
	}
	public List<String> getClassname() {
		return classname;
	}
	public void setClassname(List<String> classname) {
		this.classname = classname;
	}
	public List<Integer> getCid() {
		return cid;
	}
	public void setCid(List<Integer> cid) {
		this.cid = cid;
	}
	public List<String> getCname() {
		return cname;
	}
	public void setCname(List<String> cname) {
		this.cname = cname;
	}
	public List<String> getTname() {
		return tname;
	}
	public void setTname(List<String> tname) {
		this.tname = tname;
	}
	public List<Integer> getCpic() {
		return cpic;
	}
	public void setCpic(List<Integer> cpic) {
		this.cpic = cpic;
	}
	
}
