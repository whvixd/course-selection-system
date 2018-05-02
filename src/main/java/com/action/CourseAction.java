package com.action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.po.*;
import com.result.ResPart;
import com.result.ResProblem;
import com.service.CourseService;
import com.util.Page;
import com.util.PageUtil;
import com.util.UploadPicture;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CourseAction extends ActionSupport{
	@Resource
	private CourseService courseService;

	private File myfile;
	private String myfileFileName;
	private String cname;
	private String cintro;
	private String cfenlei;
	private int currentPage;//当前页
	private int totalCount;//总记录数
	private int totalPage;//总页数
	private int everyPage;//每页显示多少条数据
	private Page page;//page对象
	private List<OclsCourse> allCourseList;
	private int cid;
	private int pid;
	private OclsCourse oclsCourse;
	private OclsPart oclsPart;
	private OclsMessage oclsMessage;
	private OclsReply oclsReply;
	private OclsTeacher oclsTeacher;
	private String pname;
	private String pcontent1;
	private String pcontent2;
	private String rcontent;
	private List<OclsPart> partList;
	private List<OclsCourse> courseList;
	
	private List<ResProblem> problemList;
	private int mid;



	//新增课程
	public String addCourse(){
		Map session = (Map)ActionContext.getContext().getSession();
		
		oclsTeacher = (OclsTeacher) session.get("teacher");
		int tid= (int) session.get("teacherid");
		String cphoto = UploadPicture.getSavePath(myfile, myfileFileName);
		if(cname!=null&&cintro!=null&&cphoto!=null&&cfenlei!=null){
			 courseService.addCourse(tid, cname, cintro, cphoto, cfenlei);
			 return "success";
		}
		 return "error";
	}
	//显示老师的所有课程，并分页
	public String allCourse(){
		Map session = (Map)ActionContext.getContext().getSession();
		oclsTeacher = (OclsTeacher) session.get("teacher");
		int tid= (int) session.get("teacherid");
		//获取总记录数
		totalCount=courseService.getAllCourseNum(tid);
		//生成page对象	
		everyPage=8;
		page = PageUtil.createPage(everyPage,totalCount,currentPage);
		//计算获得总页数
		totalPage = page.getTotalPage();		
		allCourseList=courseService.getAllCourse(tid, page);
		return "success";
	}
	//显示课程详情
	public String showCourseDetail(){
		Map session = (Map)ActionContext.getContext().getSession();
		oclsTeacher = (OclsTeacher) session.get("teacher");
		oclsCourse = courseService.getCourseByCid(cid);
		partList=courseService.getPartList(cid);
		return "success";
	}
	//更新课程信息
	public String updateCourse(){
		Map session = (Map)ActionContext.getContext().getSession();
		oclsTeacher = (OclsTeacher) session.get("teacher");
		
		if(myfile==null){
			boolean b1 = courseService.updateCourse(cid, cname, cintro, cfenlei);
			if(b1){
				return "success";
			}
		}
		String cphoto = UploadPicture.getSavePath(myfile, myfileFileName);
		boolean b2=courseService.updateCourse(cid, cname, cintro, cfenlei, cphoto);
		if(b2){
			return "success";
		}
		return "error";
	}
	//新增章节
	public String addPart(){
		Map session = (Map)ActionContext.getContext().getSession();
		oclsTeacher = (OclsTeacher) session.get("teacher");
		courseService.addPart(cid, pname, pcontent1, pcontent2);
		return "success";
	}
	//显示章节详情
	public String partDetail(){
		Map session = (Map)ActionContext.getContext().getSession();
		oclsTeacher = (OclsTeacher) session.get("teacher");
		//获取章节对象
	    oclsPart = courseService.getPartByPid(pid);
		//在每个章节下显示问题列表
	    problemList=courseService.getProblemListByPid(pid);	 
		return "success";
	}
	//更新章节内容
	public String updatePart(){
		Map session = (Map)ActionContext.getContext().getSession();
		oclsTeacher = (OclsTeacher) session.get("teacher");
		courseService.updatePart(pid, pname, pcontent1, pcontent2);
		return "success";
	}
	//跳转到回答问题页面
	public String jumpAnswer(){
		Map session = (Map)ActionContext.getContext().getSession();
		oclsTeacher = (OclsTeacher) session.get("teacher");
		oclsMessage=courseService.getProblemByMid(mid);
		oclsReply =courseService.getReplyByMid(mid);
		return "success";
	}
	//回答问题
	public String answerProblem(){
		
		Map session = (Map)ActionContext.getContext().getSession();

		oclsTeacher = (OclsTeacher) session.get("teacher");
		int tid= (int) session.get("teacherid");
		System.out.println("tid="+tid);
		System.out.println("mid="+mid);
		System.out.println("rcontent="+rcontent);
		courseService.answerProblem(tid, mid, rcontent);
		return "success";
	}
	//显示最新问题
	public String showNewProblem(){
		Map session = (Map)ActionContext.getContext().getSession();
		oclsTeacher = (OclsTeacher) session.get("teacher");
		int tid= (int) session.get("teacherid");
		problemList=courseService.getNewProblem(tid, 10);
		return "success";
	}
	//跳转到查询问题页面
	public String jumpSelectProblem(){
		Map session = (Map)ActionContext.getContext().getSession();
		oclsTeacher = (OclsTeacher) session.get("teacher");
		int tid= (int) session.get("teacherid");
		courseList = courseService.getNewCourseByTid(tid,100);
		
		return "success";
	}
	//异步传输
		public String execute() throws Exception {
		
			return super.execute();
		}
		public InputStream getInputStream() throws UnsupportedEncodingException{
			partList=courseService.getPartList(cid);
			List<ResPart> list = new ArrayList<ResPart>();
			for(OclsPart p : partList){
				ResPart rp = new ResPart();
				rp.setPid(p.getPid());
				rp.setPname(p.getPname());
				list.add(rp);
			}
			Gson gson = new  Gson();
			String json=gson.toJson(list);
			InputStream inputStream = new ByteArrayInputStream(json.getBytes("utf-8"));
			return inputStream;
			}
	//根据pid查询问题
	public String selectProblem(){
		Map session = (Map)ActionContext.getContext().getSession();
		oclsTeacher = (OclsTeacher) session.get("teacher");
		int tid= (int) session.get("teacherid");
		courseList = courseService.getNewCourseByTid(tid,100);
		problemList = courseService.getProblemListByPid(pid);
	
		return "success";
	}
	//跳转到创建课程
	public String jumpAddCourse(){
		Map session = (Map)ActionContext.getContext().getSession();
		oclsTeacher = (OclsTeacher) session.get("teacher");
		return "success";
	}
	//课程搜索
	public String selectCourse() throws UnsupportedEncodingException{
		Map session = (Map)ActionContext.getContext().getSession();
		int tid= (int) session.get("teacherid");
		oclsTeacher = (OclsTeacher) session.get("teacher");
		String selectcname = new String(cname.getBytes("ISO-8859-1"),"UTF-8");
		allCourseList=courseService.selectCourse(tid, selectcname);
		return "success";	
	}
	//删除课程，如果课程下有章节则，不允许删除
	public String deleteCourse(){
		boolean b = courseService.deleteCourse(cid);
		if(b){
			return "success";
		}
		return "error";
	}
}
