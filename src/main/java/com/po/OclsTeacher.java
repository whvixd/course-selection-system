package com.po;

import lombok.ToString;

import java.util.HashSet;
import java.util.Set;

/**
 * OclsTeacher entity. @author MyEclipse Persistence Tools
 */

public class OclsTeacher implements java.io.Serializable {

	// Fields

	private Integer tid;
	private OclsInfofteacher oclsInfofteacher;
	private String tnum;
	private String tname;
	private String tpwd;
	private Integer tpower;
	private String tphoto;
	private Set oclsReplies = new HashSet(0);
	private Set oclsCourses = new HashSet(0);
	private Set oclsBlacklists = new HashSet(0);

	// Constructors

	/** default constructor */
	public OclsTeacher() {
	}

	/** minimal constructor */
	public OclsTeacher(OclsInfofteacher oclsInfofteacher, String tnum,
			String tname, String tpwd, Integer tpower) {
		this.oclsInfofteacher = oclsInfofteacher;
		this.tnum = tnum;
		this.tname = tname;
		this.tpwd = tpwd;
		this.tpower = tpower;
	}

	/** full constructor */
	public OclsTeacher(OclsInfofteacher oclsInfofteacher, String tnum,
			String tname, String tpwd, Integer tpower, String tphoto,
			Set oclsReplies, Set oclsCourses, Set oclsBlacklists) {
		this.oclsInfofteacher = oclsInfofteacher;
		this.tnum = tnum;
		this.tname = tname;
		this.tpwd = tpwd;
		this.tpower = tpower;
		this.tphoto = tphoto;
		this.oclsReplies = oclsReplies;
		this.oclsCourses = oclsCourses;
		this.oclsBlacklists = oclsBlacklists;
	}

	// Property accessors

	public Integer getTid() {
		return this.tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public OclsInfofteacher getOclsInfofteacher() {
		return this.oclsInfofteacher;
	}

	public void setOclsInfofteacher(OclsInfofteacher oclsInfofteacher) {
		this.oclsInfofteacher = oclsInfofteacher;
	}

	public String getTnum() {
		return this.tnum;
	}

	public void setTnum(String tnum) {
		this.tnum = tnum;
	}

	public String getTname() {
		return this.tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTpwd() {
		return this.tpwd;
	}

	public void setTpwd(String tpwd) {
		this.tpwd = tpwd;
	}

	public Integer getTpower() {
		return this.tpower;
	}

	public void setTpower(Integer tpower) {
		this.tpower = tpower;
	}

	public String getTphoto() {
		return this.tphoto;
	}

	public void setTphoto(String tphoto) {
		this.tphoto = tphoto;
	}

	public Set getOclsReplies() {
		return this.oclsReplies;
	}

	public void setOclsReplies(Set oclsReplies) {
		this.oclsReplies = oclsReplies;
	}

	public Set getOclsCourses() {
		return this.oclsCourses;
	}

	public void setOclsCourses(Set oclsCourses) {
		this.oclsCourses = oclsCourses;
	}

	public Set getOclsBlacklists() {
		return this.oclsBlacklists;
	}

	public void setOclsBlacklists(Set oclsBlacklists) {
		this.oclsBlacklists = oclsBlacklists;
	}

}