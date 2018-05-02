package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import lombok.Data;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

@Service
public class CheckPwdAction extends ActionSupport{
	private String oldpwd;
	private String newpwd;
	private String rnewpwd;
	//检验修改密码表单
	public String execute() throws Exception{
		
		return super.execute();
	}
	public InputStream getInputStream() throws UnsupportedEncodingException{
		Map session = (Map)ActionContext.getContext().getSession();
		String tpwd=(String) session.get("tpwd");
		
		if(!tpwd.equals(oldpwd)){
			InputStream inputStream = new ByteArrayInputStream("oldpwdfalse".getBytes("utf-8"));
			return inputStream;
		}
		if(!newpwd.equals(rnewpwd)){
			InputStream inputStream = new ByteArrayInputStream("doublefalse".getBytes("utf-8"));
			return inputStream;
		}
		InputStream inputStream = new ByteArrayInputStream("success".getBytes("utf-8"));
		return inputStream;
	}
}
