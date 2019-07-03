package model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class HomeworkBean {
	int claid;//班级id
	List<Integer> wid= new ArrayList<Integer>();//作业id
	List<String> state= new ArrayList<String>();//作业状态
	List<String> stitle= new ArrayList<String>();//作业标题
	List<Date> deadtime=new ArrayList<Date>();
	public int getClaid() {
		return claid;
	}
	public void setClaid(int claid) {
		this.claid = claid;
	}
	public List<Integer> getWid() {
		return wid;
	}
	public void setWid(List<Integer> wid) {
		this.wid = wid;
	}
	public List<String> getState() {
		return state;
	}
	public void setState(List<String> state) {
		this.state = state;
	}
	public List<String> getStitle() {
		return stitle;
	}
	public void setStitle(List<String> stitle) {
		this.stitle = stitle;
	}
	public List<Date> getDeadtime() {
		return deadtime;
	}
	public void setDeadtime(List<Date> deadtime) {
		this.deadtime = deadtime;
	}
	
}
