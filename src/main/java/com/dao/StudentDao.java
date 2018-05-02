package com.dao;

import com.po.*;
import com.util.Page;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class StudentDao extends HibernateDaoSupport {

    @Resource
    public void setSessionFactory0(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }


    //根据教师tid获得关注此老师的所有学生列表
    public List<OclsStudent> getStudentByTid(int tid, Page page) {
        Session session = getHibernateTemplate().getSessionFactory().openSession();
        List<OclsStudent> slist = new ArrayList<OclsStudent>();
        List<OclsFavorite> flist = session.createQuery("from OclsFavorite").list();
        List<OclsBlacklist> blist = session.createQuery("from OclsBlacklist ").list();
        //去掉黑名单中的学生
        for (int i = 0; i < flist.size() - 1; i++) {
            for (int j = 0; j < blist.size() - 1; j++) {
                if (flist.get(i).getOclsStudent() == blist.get(j).getOclsStudent()) {
                    flist.remove(flist.get(i));
                }
            }
        }
        for (OclsFavorite f : flist) {
            OclsStudent s = f.getOclsStudent();
            slist.add(s);
        }
        List<OclsStudent> slist2 = new ArrayList<OclsStudent>();


        for (int i = page.getBeginIndex(); i < page.getBeginIndex() + page.getEveryPage(); i++) {
            if (i > slist.size() - 1) {
                return slist2;
            }
            slist2.add(slist.get(i));
        }
        session.close();
        return slist2;
    }

    //获取关注此老师的所有学生的总记录数
    public int getStudentNum(int tid) {
        Session session = getHibernateTemplate().getSessionFactory().openSession();
        List<OclsStudent> slist = new ArrayList<OclsStudent>();
        List<OclsFavorite> flist = session.createQuery("from OclsFavorite").list();
        List<OclsBlacklist> blist = session.createQuery("from OclsBlacklist").list();
        for (int i = 0; i < flist.size() - 1; i++) {
            for (int j = 0; j < blist.size() - 1; j++) {
                if (flist.get(i).getOclsStudent() == blist.get(j).getOclsStudent()) {
                    flist.remove(flist.get(i));
                }
            }
        }
        for (OclsFavorite f : flist) {
            OclsStudent s = f.getOclsStudent();
            slist.add(s);
        }
        session.close();
        return slist.size();
    }

    //加入黑名单
    public void addBlacklist(int tid, int sid) {
        Session session = getHibernateTemplate().getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        OclsTeacher t = (OclsTeacher) session.createQuery("from OclsTeacher t where t.tid=?").setInteger(0, tid).uniqueResult();
        OclsStudent s = (OclsStudent) session.createQuery("from OclsStudent s where s.sid=?").setInteger(0, sid).uniqueResult();
        OclsCourse c = (OclsCourse) session.createQuery("from OclsCourse c where c.cid=?").setInteger(0, 2).uniqueResult();
        OclsBlacklist b = new OclsBlacklist();
        b.setOclsCourse(c);
        b.setOclsStudent(s);
        b.setOclsTeacher(t);
        session.save(b);
        tran.commit();
        session.close();
    }

    //获取黑名单
    public List<OclsBlacklist> getBlacklistByTid(int tid, Page page) {
        Session session = getHibernateTemplate().getSessionFactory().openSession();
        OclsTeacher t = (OclsTeacher) session.createQuery("from OclsTeacher t where t.tid=?").setInteger(0, tid).uniqueResult();
        List<OclsBlacklist> list = session.createQuery("from OclsBlacklist b where b.oclsTeacher=?").setEntity(0, t).setFirstResult(page.getBeginIndex()).setMaxResults(page.getEveryPage()).list();
        session.close();
        return list;
    }

    //获取黑名单的数据记录数
    public int getBlacklistNum(int tid) {
        Session session = getHibernateTemplate().getSessionFactory().openSession();
        OclsTeacher t = (OclsTeacher) session.createQuery("from OclsTeacher t where t.tid=?").setInteger(0, tid).uniqueResult();
        String sql = "select count(*) from OclsBlacklist b where b.oclsTeacher=?";
        long totalCount = (long) session.createQuery(sql).setEntity(0, t).uniqueResult();
        int data = (int) totalCount;
        session.close();
        return data;
    }

    //移除黑名单
    public void deleteBlacklist(int bid) {
        Session session = getHibernateTemplate().getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        OclsBlacklist ob = (OclsBlacklist) session.createQuery("from OclsBlacklist b where b.bid=?").setInteger(0, bid).uniqueResult();
        session.delete(ob);
        tran.commit();
        session.close();
    }
}