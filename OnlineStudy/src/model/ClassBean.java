package model;

import java.util.ArrayList;
import java.util.List;

public class ClassBean {
	List<Integer> claid = new ArrayList<Integer>();//�༶id
	 List<String> classes = new ArrayList<String>();//�γ̰༶
	 int cid;//�γ�id���
	 List<String> cpass = new ArrayList<String>();//����
	public List<Integer> getClaid() {
		return claid;
	}
	public void setClaid(List<Integer> claid) {
		this.claid = claid;
	}
	public List<String> getClasses() {
		return classes;
	}
	public void setClasses(List<String> classes) {
		this.classes = classes;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public List<String> getCpass() {
		return cpass;
	}
	public void setCpass(List<String> cpass) {
		this.cpass = cpass;
	}
	
	 
}
