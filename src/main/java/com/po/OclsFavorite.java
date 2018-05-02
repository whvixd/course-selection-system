package com.po;

/**
 * OclsFavorite entity. @author MyEclipse Persistence Tools
 */

public class OclsFavorite implements java.io.Serializable {

	// Fields

	private Integer fid;
	private OclsStudent oclsStudent;
	private OclsCourse oclsCourse;
	private String cname;

	// Constructors

	/** default constructor */
	public OclsFavorite() {
	}

	/** full constructor */
	public OclsFavorite(OclsStudent oclsStudent, OclsCourse oclsCourse,
                        String cname) {
		this.oclsStudent = oclsStudent;
		this.oclsCourse = oclsCourse;
		this.cname = cname;
	}

	// Property accessors

	public Integer getFid() {
		return this.fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public OclsStudent getOclsStudent() {
		return this.oclsStudent;
	}

	public void setOclsStudent(OclsStudent oclsStudent) {
		this.oclsStudent = oclsStudent;
	}

	public OclsCourse getOclsCourse() {
		return this.oclsCourse;
	}

	public void setOclsCourse(OclsCourse oclsCourse) {
		this.oclsCourse = oclsCourse;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

}