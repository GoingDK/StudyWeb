package model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class HomeworkBean {
	int claid;//�༶id
	List<Integer> wid= new ArrayList<Integer>();//��ҵid
	List<String> state= new ArrayList<String>();//��ҵ״̬
	List<String> stitle= new ArrayList<String>();//��ҵ����
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
