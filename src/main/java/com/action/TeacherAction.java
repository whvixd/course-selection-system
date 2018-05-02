package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.po.OclsCourse;
import com.po.OclsTeacher;
import com.service.CourseService;
import com.service.TeacherService;
import com.util.UploadPicture;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.File;
import java.util.List;
import java.util.Map;

@Service
@Data
/**
 * tomcat启动时，bean注入不进去:单独在单元测试中注册bean可以?
 * 原因是stuts有自己的容器，注册了action，但是Spring也有自己的容器，没有和struts的action依赖注入
 * 少了struts2-spring-plugin.jar
 */
public class TeacherAction extends ActionSupport {
    @Autowired
    private TeacherService teacherService;
    @Resource
    private CourseService courseService;

    private String teacher_tnum;
    private String teacher_tpwd;
    private String oldpwd;
    private String newpwd;
    private String rnewpwd;
    private String tnum;
    private String tname;
    private String tpwd;
    private String rtpwd;
    private List<OclsCourse> courselistnew;
    private List<OclsCourse> popularCourseList;
    private OclsTeacher oclsTeacher;
    private File myfile;
    private String myfileFileName;

    //登录
    public String teacherlogin() {
        oclsTeacher = teacherService.teacherlogin(teacher_tnum, teacher_tpwd);
        if (oclsTeacher != null) {
            Map session = ActionContext.getContext().getSession();
            courselistnew = courseService.getNewCourseByTid(oclsTeacher.getTid());
            popularCourseList = courseService.getPopularCourse(oclsTeacher.getTid());

            session.put("teacher", oclsTeacher);
            session.put("teacherid", oclsTeacher.getTid());
            session.put("tpwd", oclsTeacher.getTpwd());
            session.put("courselistnew", courselistnew);
            session.put("popularCourseList", popularCourseList);
            return "success";
        }
        return "error";
    }

    //跳转到首页
    public String jumpIndex() {
        Map session = (Map) ActionContext.getContext().getSession();
        oclsTeacher = (OclsTeacher) session.get("teacher");
        int tid = (int) session.get("teacherid");
        courselistnew = courseService.getNewCourseByTid(tid);
        popularCourseList = courseService.getPopularCourse(tid);

        return "success";
    }

    //跳转到个人中心
    public String jumpPersonCenter() {
        Map session = (Map) ActionContext.getContext().getSession();
        oclsTeacher = (OclsTeacher) session.get("teacher");
        int tid = (int) session.get("teacherid");
        oclsTeacher = teacherService.getTeacherByTid(tid);
        return "success";
    }

    //修改密码
    public String updatepwd() {
        Map session = (Map) ActionContext.getContext().getSession();
        oclsTeacher = (OclsTeacher) session.get("teacher");
        int tid = (int) session.get("teacherid");
        teacherService.updatepwd(tid, newpwd);
        session.put("tpwd", newpwd);
        return "success";
    }

    //跳转到修改密码
    public String jumpUpdatePwd() {
        Map session = (Map) ActionContext.getContext().getSession();
        oclsTeacher = (OclsTeacher) session.get("teacher");
        return "success";
    }

    //跳转到修改头像
    public String jumpUpdatePhoto() {
        Map session = (Map) ActionContext.getContext().getSession();
        oclsTeacher = (OclsTeacher) session.get("teacher");
        return "success";

    }

    //修改头像
    public String updatePhoto() {
        String tphoto = UploadPicture.getSavePath(myfile, myfileFileName);
        Map session = (Map) ActionContext.getContext().getSession();
        int tid = (int) session.get("teacherid");
        teacherService.updatephoto(tid, tphoto);
        oclsTeacher = teacherService.getTeacherByTid(tid);
        session.put("teacher", oclsTeacher);
        return "success";
    }

    //注册
    public String addTeacher() {
        teacherService.addTeacher(tnum, tname, tpwd);
        return "success";
    }

    //退出
    public String logout() {
        Map session = (Map) ActionContext.getContext().getSession();

        session.remove("teacher");
        session.remove("teacherid");
        session.remove("tpwd");
        return "success";
    }

}
