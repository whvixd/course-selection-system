package com.po;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * OclsPart entity. @author MyEclipse Persistence Tools
 */

public class OclsPart implements java.io.Serializable {

	// Fields

	private Integer pid;
	private OclsCourse oclsCourse;
	private String pname;
	private String pcontent1;
	private String pcontent2;
	private Timestamp ptime;
	private Set oclsMessages = new HashSet(0);

	// Constructors

	/** default constructor */
	public OclsPart() {
	}

	/** minimal constructor */
	public OclsPart(OclsCourse oclsCourse, String pname, Timestamp ptime) {
		this.oclsCourse = oclsCourse;
		this.pname = pname;
		this.ptime = ptime;
	}

	/** full constructor */
	public OclsPart(OclsCourse oclsCourse, String pname, String pcontent1,
                    String pcontent2, Timestamp ptime, Set oclsMessages) {
		this.oclsCourse = oclsCourse;
		this.pname = pname;
		this.pcontent1 = pcontent1;
		this.pcontent2 = pcontent2;
		this.ptime = ptime;
		this.oclsMessages = oclsMessages;
	}

	// Property accessors

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public OclsCourse getOclsCourse() {
		return this.oclsCourse;
	}

	public void setOclsCourse(OclsCourse oclsCourse) {
		this.oclsCourse = oclsCourse;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPcontent1() {
		return this.pcontent1;
	}

	public void setPcontent1(String pcontent1) {
		this.pcontent1 = pcontent1;
	}

	public String getPcontent2() {
		return this.pcontent2;
	}

	public void setPcontent2(String pcontent2) {
		this.pcontent2 = pcontent2;
	}

	public Timestamp getPtime() {
		return this.ptime;
	}

	public void setPtime(Timestamp ptime) {
		this.ptime = ptime;
	}

	public Set getOclsMessages() {
		return this.oclsMessages;
	}

	public void setOclsMessages(Set oclsMessages) {
		this.oclsMessages = oclsMessages;
	}

}