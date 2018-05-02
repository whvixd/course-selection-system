package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.po.OclsBlacklist;
import com.po.OclsStudent;
import com.po.OclsTeacher;
import com.service.CourseService;
import com.service.StudentService;
import com.util.Page;
import com.util.PageUtil;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
@Data
public class StudentAction extends ActionSupport {
    @Resource
    private StudentService studentService;

    private List<OclsStudent> allStudentList;
    private List<OclsBlacklist> blacklist;
    private int currentPage;//当前页
    private int totalCount;//总记录数
    private int totalPage;//总页数
    private int everyPage;//每页显示多少条数据
    private Page page;//page对象
    private int sid;
    private int bid;
    private OclsTeacher oclsTeacher;

	/*@PostConstruct
    public void init(){
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		this.studentService = context.getBean(StudentService.class);
	}*/

    //获得关注此老师的所有学生
    public String showAllStudent() {
        Map session = (Map) ActionContext.getContext().getSession();
        oclsTeacher = (OclsTeacher) session.get("teacher");
        int tid = (int) session.get("teacherid");
        //获取总记录数
        totalCount = studentService.getStudentNum(tid);
        //生成page对象
        everyPage = 8;
        page = PageUtil.createPage(13, totalCount, currentPage);
        //计算获得总页数
        totalPage = page.getTotalPage();
        List<OclsStudent> list = studentService.getStudentByTid(tid, page);
        for (int i = 0; i < list.size() - 1; i++) {
            for (int j = list.size() - 1; j > i; j--) {
                if (list.get(j).getOclsNumofstudent().getNname().equals(list.get(i).getOclsNumofstudent().getNname())) {
                    list.remove(j);
                }
            }
        }
        allStudentList = list;
        return "success";
    }

    //加入黑名单
    public String addBlacklist() {
        Map session = (Map) ActionContext.getContext().getSession();
        oclsTeacher = (OclsTeacher) session.get("teacher");
        int tid = (int) session.get("teacherid");
        studentService.addBlacklist(tid, sid);
        return "success";
    }

    //获取黑名单,并分页
    public String showBlacklist() {
        Map session = (Map) ActionContext.getContext().getSession();
        oclsTeacher = (OclsTeacher) session.get("teacher");
        int tid = (int) session.get("teacherid");
        //获取总记录数
        totalCount = studentService.getBlacklistNum(tid);
        //生成page对象
        everyPage = 8;
        page = PageUtil.createPage(everyPage, totalCount, currentPage);
        //计算获得总页数
        totalPage = page.getTotalPage();
        blacklist = studentService.getBlacklistByTid(tid, page);
        return "success";

    }

    //移除黑名单
    public String deleteBlacklist() {
        Map session = (Map) ActionContext.getContext().getSession();
        oclsTeacher = (OclsTeacher) session.get("teacher");
        studentService.deleteBlacklist(bid);
        return "success";

    }
}
