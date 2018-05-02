package com.dao;

import com.po.OclsInfofteacher;
import com.po.OclsTeacher;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

@Repository
public class TeacherDao extends HibernateDaoSupport{

	@Resource
	public void setSessionFactory0(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	
	//讲师登录
	public OclsTeacher teacherlogin(String tnum, String tpwd) {
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		OclsTeacher t = (OclsTeacher) session.createQuery("from OclsTeacher t where t.tnum=? and t.tpwd=?")
				.setString(0, tnum).setString(1,tpwd).uniqueResult();
		session.close();
		if(t==null){
			return null;
		}
		return t;
	}
	//根据tid获得教师对象
	public OclsTeacher getTeacherByTid(int tid){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		OclsTeacher t = (OclsTeacher) session.createQuery("from OclsTeacher t where t.tid =?").setInteger(0, tid).uniqueResult();
		session.close();
		return t;
	}
	//修改教师对象
	public void updateTeacher(OclsTeacher ot){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		Transaction tran = session.beginTransaction();
		session.update(ot);
		tran.commit();
		session.close();
	}

	// 注册
	public void addTeacher(String tnum, String tname, String tpwd) {
		Session session = getHibernateTemplate().getSessionFactory()
				.openSession();
		Transaction tran = session.beginTransaction();
		System.out.println("tnum=="+tnum);
		OclsInfofteacher oif = (OclsInfofteacher) session
				.createQuery("from OclsInfofteacher oif  where oif.infnum=?")
				.setString(0, tnum).uniqueResult();
		if (oif != null) {
			OclsTeacher ot = new OclsTeacher();
			ot.setOclsInfofteacher(oif);
			ot.setTname(tname);
			ot.setTnum(tnum);
			ot.setTphoto("kong");
			ot.setTpwd(tpwd);
			ot.setTpower(1);
			session.save(ot);
		}
		if (oif == null) {
			OclsInfofteacher oif2 = (OclsInfofteacher) session
					.createQuery("from OclsInfofteacher oif  where oif.infid=?")
					.setInteger(0, 7).uniqueResult();

			OclsTeacher ot = new OclsTeacher();
			ot.setOclsInfofteacher(oif2);
			ot.setTname(tname);
			ot.setTnum(tnum);
			ot.setTphoto("kong");
			ot.setTpwd(tpwd);
			ot.setTpower(1);
			session.save(ot);
		}
		tran.commit();
		session.close();
	}
	
}
