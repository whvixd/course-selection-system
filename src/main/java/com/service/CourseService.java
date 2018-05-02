package com.service;

import com.dao.CourseDao;
import com.po.OclsCourse;
import com.po.OclsMessage;
import com.po.OclsPart;
import com.po.OclsReply;
import com.result.ResProblem;
import com.util.Page;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CourseService {

	@Resource
	private CourseDao courseDao;

	//根据教师tid获取教师最新开设的课程，最新更新的5个
	public List<OclsCourse> getNewCourseByTid(int tid){
		return courseDao.getNewCourseByTobj(tid,5);
	}
	//根据教师tid获取教师最新开设的课程，根据传来的参数决定查几个
	public List<OclsCourse> getNewCourseByTid(int tid, int num){
		return courseDao.getNewCourseByTobj(tid,num);
	}
	//根据教师tid获取教师下受欢迎的课程，返回5条数据
	public List<OclsCourse> getPopularCourse(int tid){
		return courseDao.getPopularCourse(tid, 5);
	}
	//新增一个课程
	public void addCourse(int tid,String cname,String cintro,String cphoto,String cfenlei){
		 courseDao.addCourse(tid, cname, cintro, cphoto, cfenlei);
	}
	//获取老师所有课程的数量
	public int getAllCourseNum(int tid){
		return courseDao.getAllCourseNum(tid);
	}
	//获取该老师的所有课程
	public List<OclsCourse> getAllCourse(int tid, Page page){
		return courseDao.getAllCourse(tid, page);
	}
	//根据课程cid获取一个课程对象
	public OclsCourse getCourseByCid(int cid){
		return courseDao.getCourseByCid(cid);
	}
	//更新一个课程,不包括图片
	public boolean updateCourse(int cid,String cname,String cintro,String cfenlei){
		OclsCourse oc = courseDao.getCourseByCid(cid);
		oc.setCfenlei(cfenlei);
		oc.setCintro(cintro);
		oc.setCname(cname);
		return courseDao.updateCourse(oc);
	}
	//更新一个课程，包括图片
	public boolean updateCourse(int cid,String cname,String cintro,String cfenlei,String cphoto){
		OclsCourse oc = courseDao.getCourseByCid(cid);
		oc.setCfenlei(cfenlei);
		oc.setCintro(cintro);
		oc.setCname(cname);
		oc.setCphoto(cphoto);
		return courseDao.updateCourse(oc);
	}
	//新增章节
	public void addPart(int cid ,String pname,String pcontent1,String pcontent2 ){
		courseDao.addPart(cid, pname, pcontent1, pcontent2);
	}
	//根据课程cid获取课程下面的章节列表
	public List<OclsPart> getPartList(int cid){
		return courseDao.getPartList(cid);
	}
	//根据章节pid获得一个章节对象
	public OclsPart getPartByPid(int pid){
			return courseDao.getPartByPid(pid);
	}
	//根据章节pid，pname，pcontent1，pcontent2更新章节
	public void updatePart(int pid,String pname,String pcontent1,String pcontent2){
			courseDao.updatePart(pid, pname, pcontent1, pcontent2);
	}
	//根据章节pid获取下面的问题列表
	public List<ResProblem> getProblemListByPid(int pid){
		return courseDao.getProblemListByPid(pid);
	}
	//由问题的mid获得问题对象
	public OclsMessage getProblemByMid(int mid){
		return courseDao.getProblemByMid(mid);
	}
	//由问题mid获得回复对象
	public OclsReply getReplyByMid(int mid){
		return courseDao.getReplyByMid(mid);
	}
	//回答问题
	public void answerProblem(int tid,int mid,String rcontent){
			courseDao.answerProblem(tid, mid, rcontent);
	}
	//根据老师tid获取最新几条问题
	public List<ResProblem> getNewProblem(int tid,int num){
		return courseDao.getNewProblem(tid, num);
	}
	//搜索课程，模糊搜索
	public List<OclsCourse> selectCourse(int tid, String cname){
		return courseDao.selectCourse(tid, cname);
	}
	//删除课程，如果课程下有章节则不允许删除
	public boolean deleteCourse(int cid){
		return courseDao.deleteCourse(cid);
	}
	//检查课程下是否有章节
		public boolean checkCourse(int cid){
			System.out.println("执行到这里--CourseService--checkCourse()");
			return courseDao.checkCourse(cid);
		}
}
