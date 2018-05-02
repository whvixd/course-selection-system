package com.po;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * OclsMessage entity. @author MyEclipse Persistence Tools
 */

public class OclsMessage implements java.io.Serializable {

	// Fields

	private Integer mid;
	private OclsStudent oclsStudent;
	private OclsPart oclsPart;
	private String sname;
	private String mcontent;
	private Timestamp mtime;
	private Set oclsReplies = new HashSet(0);

	// Constructors

	/** default constructor */
	public OclsMessage() {
	}

	/** minimal constructor */
	public OclsMessage(OclsStudent oclsStudent, OclsPart oclsPart,
			String sname, String mcontent, Timestamp mtime) {
		this.oclsStudent = oclsStudent;
		this.oclsPart = oclsPart;
		this.sname = sname;
		this.mcontent = mcontent;
		this.mtime = mtime;
	}

	/** full constructor */
	public OclsMessage(OclsStudent oclsStudent, OclsPart oclsPart,
			String sname, String mcontent, Timestamp mtime, Set oclsReplies) {
		this.oclsStudent = oclsStudent;
		this.oclsPart = oclsPart;
		this.sname = sname;
		this.mcontent = mcontent;
		this.mtime = mtime;
		this.oclsReplies = oclsReplies;
	}

	// Property accessors

	public Integer getMid() {
		return this.mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public OclsStudent getOclsStudent() {
		return this.oclsStudent;
	}

	public void setOclsStudent(OclsStudent oclsStudent) {
		this.oclsStudent = oclsStudent;
	}

	public OclsPart getOclsPart() {
		return this.oclsPart;
	}

	public void setOclsPart(OclsPart oclsPart) {
		this.oclsPart = oclsPart;
	}

	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getMcontent() {
		return this.mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public Timestamp getMtime() {
		return this.mtime;
	}

	public void setMtime(Timestamp mtime) {
		this.mtime = mtime;
	}

	public Set getOclsReplies() {
		return this.oclsReplies;
	}

	public void setOclsReplies(Set oclsReplies) {
		this.oclsReplies = oclsReplies;
	}

}