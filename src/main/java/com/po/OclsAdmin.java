package com.po;

/**
 * OclsAdmin entity. @author MyEclipse Persistence Tools
 */

public class OclsAdmin implements java.io.Serializable {

	// Fields

	private Integer aid;
	private String aname;
	private String anum;
	private String apwd;
	private String aemail;
	private String aother;
	private String aphoto;
	private Integer apower;

	// Constructors

	/** default constructor */
	public OclsAdmin() {
	}

	/** minimal constructor */
	public OclsAdmin(String aname, String anum, String apwd, Integer apower) {
		this.aname = aname;
		this.anum = anum;
		this.apwd = apwd;
		this.apower = apower;
	}

	/** full constructor */
	public OclsAdmin(String aname, String anum, String apwd, String aemail,
			String aother, String aphoto, Integer apower) {
		this.aname = aname;
		this.anum = anum;
		this.apwd = apwd;
		this.aemail = aemail;
		this.aother = aother;
		this.aphoto = aphoto;
		this.apower = apower;
	}

	// Property accessors

	public Integer getAid() {
		return this.aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getAname() {
		return this.aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getAnum() {
		return this.anum;
	}

	public void setAnum(String anum) {
		this.anum = anum;
	}

	public String getApwd() {
		return this.apwd;
	}

	public void setApwd(String apwd) {
		this.apwd = apwd;
	}

	public String getAemail() {
		return this.aemail;
	}

	public void setAemail(String aemail) {
		this.aemail = aemail;
	}

	public String getAother() {
		return this.aother;
	}

	public void setAother(String aother) {
		this.aother = aother;
	}

	public String getAphoto() {
		return this.aphoto;
	}

	public void setAphoto(String aphoto) {
		this.aphoto = aphoto;
	}

	public Integer getApower() {
		return this.apower;
	}

	public void setApower(Integer apower) {
		this.apower = apower;
	}

}