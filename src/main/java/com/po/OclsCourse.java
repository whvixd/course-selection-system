package com.po;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * OclsCourse entity. @author MyEclipse Persistence Tools
 */

public class OclsCourse implements java.io.Serializable {

	// Fields

	private Integer cid;
	private OclsTeacher oclsTeacher;
	private String cname;
	private String tname;
	private String cintro;
	private Timestamp ctime;
	private String cphoto;
	private Integer chot;
	private String cfenlei;
	private Set oclsBlacklists = new HashSet(0);
	private Set oclsFavorites = new HashSet(0);
	private Set oclsParts = new HashSet(0);

	// Constructors

	/** default constructor */
	public OclsCourse() {
	}

	/** minimal constructor */
	public OclsCourse(OclsTeacher oclsTeacher, String cname, String tname,
			Timestamp ctime) {
		this.oclsTeacher = oclsTeacher;
		this.cname = cname;
		this.tname = tname;
		this.ctime = ctime;
	}

	public OclsCourse(OclsTeacher oclsTeacher, String cname, String tname,
			String cintro, String cphoto, Integer chot, String cfenlei) {
		super();
		this.oclsTeacher = oclsTeacher;
		this.cname = cname;
		this.tname = tname;
		this.cintro = cintro;
		this.cphoto = cphoto;
		this.chot = chot;
		this.cfenlei = cfenlei;
	}

	/** full constructor */
	public OclsCourse(OclsTeacher oclsTeacher, String cname, String tname,
			String cintro, Timestamp ctime, String cphoto, Integer chot,
			String cfenlei, Set oclsBlacklists, Set oclsFavorites, Set oclsParts) {
		this.oclsTeacher = oclsTeacher;
		this.cname = cname;
		this.tname = tname;
		this.cintro = cintro;
		this.ctime = ctime;
		this.cphoto = cphoto;
		this.chot = chot;
		this.cfenlei = cfenlei;
		this.oclsBlacklists = oclsBlacklists;
		this.oclsFavorites = oclsFavorites;
		this.oclsParts = oclsParts;
	}

	// Property accessors

	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public OclsTeacher getOclsTeacher() {
		return this.oclsTeacher;
	}

	public void setOclsTeacher(OclsTeacher oclsTeacher) {
		this.oclsTeacher = oclsTeacher;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getTname() {
		return this.tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getCintro() {
		return this.cintro;
	}

	public void setCintro(String cintro) {
		this.cintro = cintro;
	}

	public Timestamp getCtime() {
		return this.ctime;
	}

	public void setCtime(Timestamp ctime) {
		this.ctime = ctime;
	}

	public String getCphoto() {
		return this.cphoto;
	}

	public void setCphoto(String cphoto) {
		this.cphoto = cphoto;
	}

	public Integer getChot() {
		return this.chot;
	}

	public void setChot(Integer chot) {
		this.chot = chot;
	}

	public String getCfenlei() {
		return this.cfenlei;
	}

	public void setCfenlei(String cfenlei) {
		this.cfenlei = cfenlei;
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

	public Set getOclsParts() {
		return this.oclsParts;
	}

	public void setOclsParts(Set oclsParts) {
		this.oclsParts = oclsParts;
	}

}