package com.result;

public class ResProblem {
	private int mid;
	private int sid;
	private String mcontent;
	private int pid;
	private int rid;
	private String rcontent;
	

	public ResProblem(int mid, int sid, String mcontent, int pid, int rid,
			String rcontent) {
		super();
		this.mid = mid;
		this.sid = sid;
		this.mcontent = mcontent;
		this.pid = pid;
		this.rid = rid;
		this.rcontent = rcontent;
	}
	public ResProblem(int mid, int sid, String mcontent, int pid,
			String rcontent) {
		super();
		this.mid = mid;
		this.sid = sid;
		this.mcontent = mcontent;
		this.pid = pid;
		this.rcontent = rcontent;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getMcontent() {
		return mcontent;
	}
	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	
}
