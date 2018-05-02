package com.po;

/**
 * OclsBlacklist entity. @author MyEclipse Persistence Tools
 */

public class OclsBlacklist implements java.io.Serializable {

	// Fields

	private Integer bid;
	private OclsTeacher oclsTeacher;
	private OclsStudent oclsStudent;
	private OclsCourse oclsCourse;

	// Constructors

	/** default constructor */
	public OclsBlacklist() {
	}

	/** full constructor */
	public OclsBlacklist(OclsTeacher oclsTeacher, OclsStudent oclsStudent,
                         OclsCourse oclsCourse) {
		this.oclsTeacher = oclsTeacher;
		this.oclsStudent = oclsStudent;
		this.oclsCourse = oclsCourse;
	}

	// Property accessors

	public Integer getBid() {
		return this.bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public OclsTeacher getOclsTeacher() {
		return this.oclsTeacher;
	}

	public void setOclsTeacher(OclsTeacher oclsTeacher) {
		this.oclsTeacher = oclsTeacher;
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

}