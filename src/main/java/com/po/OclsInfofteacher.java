package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * OclsInfofteacher entity. @author MyEclipse Persistence Tools
 */

public class OclsInfofteacher implements java.io.Serializable {

	// Fields

	private Integer infid;
	private String infname;
	private String infsex;
	private String infnation;
	private String infpolitical;
	private String infposition;
	private String infnum;
	private Set oclsTeachers = new HashSet(0);

	// Constructors

	/** default constructor */
	public OclsInfofteacher() {
	}

	/** minimal constructor */
	public OclsInfofteacher(String infname, String infsex, String infnation,
			String infpolitical, String infposition, String infnum) {
		this.infname = infname;
		this.infsex = infsex;
		this.infnation = infnation;
		this.infpolitical = infpolitical;
		this.infposition = infposition;
		this.infnum = infnum;
	}

	/** full constructor */
	public OclsInfofteacher(String infname, String infsex, String infnation,
			String infpolitical, String infposition, String infnum,
			Set oclsTeachers) {
		this.infname = infname;
		this.infsex = infsex;
		this.infnation = infnation;
		this.infpolitical = infpolitical;
		this.infposition = infposition;
		this.infnum = infnum;
		this.oclsTeachers = oclsTeachers;
	}

	// Property accessors

	public Integer getInfid() {
		return this.infid;
	}

	public void setInfid(Integer infid) {
		this.infid = infid;
	}

	public String getInfname() {
		return this.infname;
	}

	public void setInfname(String infname) {
		this.infname = infname;
	}

	public String getInfsex() {
		return this.infsex;
	}

	public void setInfsex(String infsex) {
		this.infsex = infsex;
	}

	public String getInfnation() {
		return this.infnation;
	}

	public void setInfnation(String infnation) {
		this.infnation = infnation;
	}

	public String getInfpolitical() {
		return this.infpolitical;
	}

	public void setInfpolitical(String infpolitical) {
		this.infpolitical = infpolitical;
	}

	public String getInfposition() {
		return this.infposition;
	}

	public void setInfposition(String infposition) {
		this.infposition = infposition;
	}

	public String getInfnum() {
		return this.infnum;
	}

	public void setInfnum(String infnum) {
		this.infnum = infnum;
	}

	public Set getOclsTeachers() {
		return this.oclsTeachers;
	}

	public void setOclsTeachers(Set oclsTeachers) {
		this.oclsTeachers = oclsTeachers;
	}

}