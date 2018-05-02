package com.po;

import java.sql.Timestamp;

/**
 * OclsReply entity. @author MyEclipse Persistence Tools
 */

public class OclsReply implements java.io.Serializable {

	// Fields

	private Integer rid;
	private OclsTeacher oclsTeacher;
	private OclsMessage oclsMessage;
	private String rcontent;
	private Timestamp rtime;

	// Constructors

	/** default constructor */
	public OclsReply() {
	}

	/** full constructor */
	public OclsReply(OclsTeacher oclsTeacher, OclsMessage oclsMessage,
                     String rcontent, Timestamp rtime) {
		this.oclsTeacher = oclsTeacher;
		this.oclsMessage = oclsMessage;
		this.rcontent = rcontent;
		this.rtime = rtime;
	}

	// Property accessors

	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public OclsTeacher getOclsTeacher() {
		return this.oclsTeacher;
	}

	public void setOclsTeacher(OclsTeacher oclsTeacher) {
		this.oclsTeacher = oclsTeacher;
	}

	public OclsMessage getOclsMessage() {
		return this.oclsMessage;
	}

	public void setOclsMessage(OclsMessage oclsMessage) {
		this.oclsMessage = oclsMessage;
	}

	public String getRcontent() {
		return this.rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Timestamp getRtime() {
		return this.rtime;
	}

	public void setRtime(Timestamp rtime) {
		this.rtime = rtime;
	}

}