package model;

import java.util.ArrayList;
import java.util.List;

public class SearchBean {
	 List<Integer> cid = new ArrayList<Integer>();
	 List<String> cname = new ArrayList<String>();//�γ�����
	 List<String> tuserr = new ArrayList<String>();
	 List<Integer> cpic = new ArrayList<Integer>();//ͼƬid
	 List<String> cin = new ArrayList<String>();//����
	 List<String> tname = new ArrayList<String>();//��ʦ����
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
	public List<String> getTuserr() {
		return tuserr;
	}
	public void setTuserr(List<String> tuserr) {
		this.tuserr = tuserr;
	}
	public List<Integer> getCpic() {
		return cpic;
	}
	public void setCpic(List<Integer> cpic) {
		this.cpic = cpic;
	}
	public List<String> getCin() {
		return cin;
	}
	public void setCin(List<String> cin) {
		this.cin = cin;
	}
	public List<String> getTname() {
		return tname;
	}
	public void setTname(List<String> tname) {
		this.tname = tname;
	}
	 
}
