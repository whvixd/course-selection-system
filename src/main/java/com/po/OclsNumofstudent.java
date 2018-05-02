package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * OclsNumofstudent entity. @author MyEclipse Persistence Tools
 */

public class OclsNumofstudent implements java.io.Serializable {

	// Fields

	private Integer nid;
	private String nname;
	private String nsex;
	private String nnum;
	private String ndepartment;
	private String nclass;
	private Set oclsStudents = new HashSet(0);

	// Constructors

	/** default constructor */
	public OclsNumofstudent() {
	}

	/** minimal constructor */
	public OclsNumofstudent(String nname, String nsex, String nnum,
			String ndepartment, String nclass) {
		this.nname = nname;
		this.nsex = nsex;
		this.nnum = nnum;
		this.ndepartment = ndepartment;
		this.nclass = nclass;
	}

	/** full constructor */
	public OclsNumofstudent(String nname, String nsex, String nnum,
			String ndepartment, String nclass, Set oclsStudents) {
		this.nname = nname;
		this.nsex = nsex;
		this.nnum = nnum;
		this.ndepartment = ndepartment;
		this.nclass = nclass;
		this.oclsStudents = oclsStudents;
	}

	// Property accessors

	public Integer getNid() {
		return this.nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}

	public String getNname() {
		return this.nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public String getNsex() {
		return this.nsex;
	}

	public void setNsex(String nsex) {
		this.nsex = nsex;
	}

	public String getNnum() {
		return this.nnum;
	}

	public void setNnum(String nnum) {
		this.nnum = nnum;
	}

	public String getNdepartment() {
		return this.ndepartment;
	}

	public void setNdepartment(String ndepartment) {
		this.ndepartment = ndepartment;
	}

	public String getNclass() {
		return this.nclass;
	}

	public void setNclass(String nclass) {
		this.nclass = nclass;
	}

	public Set getOclsStudents() {
		return this.oclsStudents;
	}

	public void setOclsStudents(Set oclsStudents) {
		this.oclsStudents = oclsStudents;
	}

}