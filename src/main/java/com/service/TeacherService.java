package com.service;

import com.dao.TeacherDao;
import com.po.OclsTeacher;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class TeacherService {
    @Resource
    private TeacherDao teacherDao;

    // 教师登录
    public OclsTeacher teacherlogin(String tnum, String tpwd) {
        return teacherDao.teacherlogin(tnum, tpwd);
    }

    // 根据tid获得教师对象
    public OclsTeacher getTeacherByTid(int tid) {
        return teacherDao.getTeacherByTid(tid);
    }

    // 修改密码
    public void updatepwd(int tid, String pwd) {
        OclsTeacher ot = teacherDao.getTeacherByTid(tid);
        ot.setTpwd(pwd);
        teacherDao.updateTeacher(ot);
    }

    // 修改头像
    public void updatephoto(int tid, String tphoto) {
        OclsTeacher ot = teacherDao.getTeacherByTid(tid);
        ot.setTphoto(tphoto);
        teacherDao.updateTeacher(ot);
    }

    // 注册
    public void addTeacher(String tnum, String tname, String tpwd) {

        teacherDao.addTeacher(tnum, tname, tpwd);
    }

}
