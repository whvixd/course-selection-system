package com.result;

public class ResPart {
	private int pid;
	private String pname;
	public ResPart(int pid, String pname) {
		super();
		this.pid = pid;
		this.pname = pname;
	}
	public ResPart() {
		super();
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
}
