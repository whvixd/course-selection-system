package com.action;

import com.opensymphony.xwork2.ActionSupport;
import com.service.CourseService;
import com.service.TeacherService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

@Service
@Data
public class CheckCourseAction extends ActionSupport {
    @Resource
    private CourseService courseService;

    private int cid;
    private String result;

    public String execute() throws Exception {
//        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
//        this.courseService = context.getBean(CourseService.class);

        System.out.println("传来的cid=" + cid);
        boolean b = courseService.checkCourse(cid);
        System.out.println("b=" + b);
        result = "测试";
        return SUCCESS;
    }
}
