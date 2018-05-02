package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * OclsStudent entity. @author MyEclipse Persistence Tools
 */

public class OclsStudent implements java.io.Serializable {

	// Fields

	private Integer sid;
	private OclsNumofstudent oclsNumofstudent;
	private String snum;
	private String sname;
	private String spwd;
	private Integer spower;
	private String sphoto;
	private Set oclsMessages = new HashSet(0);
	private Set oclsBlacklists = new HashSet(0);
	private Set oclsFavorites = new HashSet(0);

	// Constructors

	/** default constructor */
	public OclsStudent() {
	}

	/** minimal constructor */
	public OclsStudent(OclsNumofstudent oclsNumofstudent, String snum,
			String sname, String spwd, Integer spower) {
		this.oclsNumofstudent = oclsNumofstudent;
		this.snum = snum;
		this.sname = sname;
		this.spwd = spwd;
		this.spower = spower;
	}

	/** full constructor */
	public OclsStudent(OclsNumofstudent oclsNumofstudent, String snum,
			String sname, String spwd, Integer spower, String sphoto,
			Set oclsMessages, Set oclsBlacklists, Set oclsFavorites) {
		this.oclsNumofstudent = oclsNumofstudent;
		this.snum = snum;
		this.sname = sname;
		this.spwd = spwd;
		this.spower = spower;
		this.sphoto = sphoto;
		this.oclsMessages = oclsMessages;
		this.oclsBlacklists = oclsBlacklists;
		this.oclsFavorites = oclsFavorites;
	}

	// Property accessors

	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public OclsNumofstudent getOclsNumofstudent() {
		return this.oclsNumofstudent;
	}

	public void setOclsNumofstudent(OclsNumofstudent oclsNumofstudent) {
		this.oclsNumofstudent = oclsNumofstudent;
	}

	public String getSnum() {
		return this.snum;
	}

	public void setSnum(String snum) {
		this.snum = snum;
	}

	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSpwd() {
		return this.spwd;
	}

	public void setSpwd(String spwd) {
		this.spwd = spwd;
	}

	public Integer getSpower() {
		return this.spower;
	}

	public void setSpower(Integer spower) {
		this.spower = spower;
	}

	public String getSphoto() {
		return this.sphoto;
	}

	public void setSphoto(String sphoto) {
		this.sphoto = sphoto;
	}

	public Set getOclsMessages() {
		return this.oclsMessages;
	}

	public void setOclsMessages(Set oclsMessages) {
		this.oclsMessages = oclsMessages;
	}

	public Set getOclsBlacklists() {
		return this.oclsBlacklists;
	}

	public void setOclsBlacklists(Set oclsBlacklists) {
		this.oclsBlacklists = oclsBlacklists;
	}

	public Set getOclsFavorites() {
		return this.oclsFavorites;
	}

	public void setOclsFavorites(Set oclsFavorites) {
		this.oclsFavorites = oclsFavorites;
	}

}