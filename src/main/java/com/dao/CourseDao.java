package com.dao;

import com.po.*;
import com.result.ResProblem;
import com.util.Page;
import org.hibernate.*;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class CourseDao extends HibernateDaoSupport{


	@Resource
	public void setSessionFactory0(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}

	//根据教师id和返回数据条数返回此教师下最近更新的课程列表
	public List<OclsCourse> getNewCourseByTobj(int tid, int page){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		OclsTeacher t = (OclsTeacher) session.createQuery("from OclsTeacher t where t.tid=?").setInteger(0, tid).uniqueResult();
		List<OclsCourse> data = new ArrayList<OclsCourse>();
		String sql=" from OclsCourse c where c.oclsTeacher=? order by c.cid desc";
		Query query = session.createQuery(sql);
		query.setEntity(0, t);
		query.setFirstResult(0);
		query.setMaxResults(page);
		data = query.list();
		session.close();
		if(data.size()>0){
			return data;
		}
		return null;
	}
	//根据教师id和数据返回条数返回受欢迎的课程列表
	public List<OclsCourse> getPopularCourse(int tid, int page){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		OclsTeacher t = (OclsTeacher) session.createQuery("from OclsTeacher t where t.tid=?").setInteger(0, tid).uniqueResult();
		List<OclsCourse> data = new ArrayList<OclsCourse>();
		String sql=" from OclsCourse c where c.oclsTeacher=? order by c.chot desc";
		Query query = session.createQuery(sql);
		query.setEntity(0, t);
		query.setFirstResult(0);
		query.setMaxResults(page);
		data = query.list();
		session.close();
		if(data.size()>0){
			return data;
		}
		return null;
	}
	//新增一个课程
	public void addCourse(int tid,String cname,String cintro,String cphoto,String cfenlei){

		Session session = getHibernateTemplate().getSessionFactory().openSession();
		Transaction tran = session.beginTransaction();
		OclsTeacher t = (OclsTeacher) session.createQuery("from OclsTeacher t where t.tid=?").setInteger(0, tid).uniqueResult();
		OclsCourse oc= new OclsCourse(t,cname, t.getTname(),cintro,cphoto,0,cfenlei);
		session.save(oc);
		tran.commit();
		session.close();

	}
	//根据老师tid获取老师所有课程的记录数
	public int getAllCourseNum(int tid){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		OclsTeacher t = (OclsTeacher) session.createQuery("from OclsTeacher t where t.tid=?").setInteger(0, tid).uniqueResult();
		String sql = "select count(*) from OclsCourse c where c.oclsTeacher=?";
		long totalCount = (long) session.createQuery(sql).setEntity(0, t).uniqueResult();
		int data = (int) totalCount;
		session.close();
		return data;
	}
	//获取老师的全部课程
	public List<OclsCourse> getAllCourse(int tid, Page page){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		OclsTeacher t = (OclsTeacher) session.createQuery("from OclsTeacher t where t.tid=?").setInteger(0, tid).uniqueResult();
		String sql="from OclsCourse c where c.oclsTeacher = ? order by c.ctime desc";
		Query query = session.createQuery(sql);
		query.setEntity(0, t);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getEveryPage());
		List<OclsCourse> data = query.list();
		session.close();
		return data;
	}
	//根据课程cid获取一个课程
	public OclsCourse getCourseByCid(int cid){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		OclsCourse oc = (OclsCourse) session.createQuery("from OclsCourse c where c.cid=?").setInteger(0, cid).uniqueResult();
		session.close();
		return oc;
	}
	//更新一个课程
	public boolean updateCourse(OclsCourse oc){
		try {
			Session session = getHibernateTemplate().getSessionFactory().openSession();
			Transaction tran = session.beginTransaction();
			session.update(oc);
			tran.commit();
			session.close();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	//新增章节
	public void addPart(int cid,String pname,String pcontent1,String pcontent2){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		Transaction tran = session.beginTransaction();
		OclsCourse oc = (OclsCourse) session.createQuery("from OclsCourse c where c.cid=?").setInteger(0, cid).uniqueResult();
		OclsPart op = new OclsPart();
		op.setPcontent1(pcontent1);
		op.setPcontent2(pcontent2);
		op.setPname(pname);
		op.setOclsCourse(oc);
		session.save(op);
		tran.commit();
		session.close();
	}
	//根据课程cid获取课程下面的章节列表
	public List<OclsPart> getPartList( int cid){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		OclsCourse oc = (OclsCourse) session.createQuery("from OclsCourse c where c.cid=?").setInteger(0, cid).uniqueResult();
		List<OclsPart> data = session.createQuery("from OclsPart p where p.oclsCourse=?").setEntity(0, oc).list();
		session.close();
		return data;
	}
	//根据章节pid获得一个章节对象
	public OclsPart getPartByPid(int pid){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		OclsPart op = (OclsPart) session.createQuery("from OclsPart p where p.pid=?").setInteger(0, pid).uniqueResult();
		session.close();
		return op;
	}
	//根据章节pid，pname，pcontent1，pcontent2更新章节
	public void updatePart(int pid,String pname,String pcontent1,String pcontent2){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		Transaction tran = session.beginTransaction();
		OclsPart op = (OclsPart) session.createQuery("from OclsPart p where p.pid=?").setInteger(0, pid).uniqueResult();
		op.setPcontent1(pcontent1);
		op.setPcontent2(pcontent2);
		op.setPname(pname);
		session.update(op);
		tran.commit();
		session.close();
	}
	//根据章节pid获取下面的问题列表
	public List<ResProblem> getProblemListByPid(int pid){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		List<ResProblem> problemList= new ArrayList<ResProblem>();
		OclsPart op = (OclsPart) session.createQuery("from OclsPart p where p.pid=?").setInteger(0, pid).uniqueResult();
		//找到章节下的问题列表
		List<OclsMessage> mlist = session.createQuery("from OclsMessage m where m.oclsPart=? order by m.mtime desc").setEntity(0, op).list();
		//循环这个列表，将问题和回答整到一块去
		for(OclsMessage m:mlist){
			OclsReply r =(OclsReply) session.createQuery("from OclsReply r where r.oclsMessage=?").setEntity(0, m).uniqueResult();
			if(r==null){
				ResProblem rp = new ResProblem(m.getMid(), m.getOclsStudent().getSid(), m.getMcontent(), pid, "等待回答");
				problemList.add(rp);
			}
			if(r!=null){
				ResProblem rp = new ResProblem(m.getMid(), m.getOclsStudent().getSid(), m.getMcontent(), pid, r.getRid(), r.getRcontent());
				problemList.add(rp);
			}
		}
		session.close();
		return problemList;
	}
	//由问题的mid获得问题对象
	public OclsMessage getProblemByMid(int mid){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		OclsMessage m = (OclsMessage) session.createQuery("from OclsMessage m where m.mid=?").setInteger(0, mid).uniqueResult();
		session.close();
		return m;
	}
	//由问题mid获得回复对象
	public OclsReply getReplyByMid(int mid){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		OclsMessage m = (OclsMessage) session.createQuery("from OclsMessage m where m.mid=?").setInteger(0, mid).uniqueResult();
		OclsReply r = (OclsReply) session.createQuery("from OclsReply r where r.oclsMessage=?").setEntity(0, m).uniqueResult();
		session.close();
		return r;
	}
	//回答问题
	public void answerProblem(int tid,int mid,String rcontent){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		Transaction tran = session.beginTransaction();
		OclsMessage m = (OclsMessage) session.createQuery("from OclsMessage m where m.mid=?").setInteger(0, mid).uniqueResult();
		OclsTeacher t = (OclsTeacher) session.createQuery("from OclsTeacher t where t.tid=?").setInteger(0, tid).uniqueResult();
		OclsReply r = (OclsReply) session.createQuery("from OclsReply r where r.oclsMessage=?").setEntity(0, m).uniqueResult();
		System.out.println("r为空吗="+r);
		if(r==null){
			OclsReply rnew = new OclsReply();
			rnew.setOclsMessage(m);
			rnew.setOclsTeacher(t);
			rnew.setRcontent(rcontent);
			session.save(rnew);
		}
		if(r!=null){
			r.setRcontent(rcontent);
			session.update(r);
		}
		tran.commit();
		session.close();
	}
	//根据老师tid获取最新几条问题
	public List<ResProblem> getNewProblem(int tid,int num){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		List<ResProblem> problemList= new ArrayList<ResProblem>();
		OclsTeacher t = (OclsTeacher) session.createQuery("from OclsTeacher t where t.tid=?").setInteger(0, tid).uniqueResult();
		List<OclsCourse> clist=session.createQuery("from OclsCourse c where c.oclsTeacher=?").setEntity(0, t).list();
		for(int i=0;i<clist.size();i++){
			List<OclsPart> plist= session.createQuery("from OclsPart p where p.oclsCourse=?").setEntity(0, clist.get(i)).list();
			for(int j=0;j<plist.size();j++){
				List<OclsMessage> mlist=session.createQuery("from OclsMessage m where m.oclsPart=? order by m.mtime desc").setEntity(0, plist.get(j)).setFirstResult(0).setMaxResults(num).list();
				//循环这个列表，将问题和回答整到一块去
				for(OclsMessage m:mlist){
					OclsReply r =(OclsReply) session.createQuery("from OclsReply r where r.oclsMessage=?").setEntity(0, m).uniqueResult();
					if(r==null){
						ResProblem rp = new ResProblem(m.getMid(), m.getOclsStudent().getSid(), m.getMcontent(), plist.get(j).getPid(), "等待回答");
						problemList.add(rp);
					}
					if(r!=null){
						ResProblem rp = new ResProblem(m.getMid(), m.getOclsStudent().getSid(), m.getMcontent(),  plist.get(j).getPid(), r.getRid(), r.getRcontent());
						problemList.add(rp);
					}
				}
			}
		}
		session.close();
		return problemList;
	}
	//搜索课程，模糊搜索
	public List<OclsCourse> selectCourse(int tid, String cname){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		OclsTeacher t = (OclsTeacher) session.createQuery("from OclsTeacher t where t.tid=?").setInteger(0, tid).uniqueResult();
		String sql="from OclsCourse c where c.oclsTeacher=? and c.cname like '%"+cname+"%'";
		Query query = session.createQuery(sql);
		query.setEntity(0, t);

		List<OclsCourse> data = query.list();
		session.close();
		return data;
	}
	//删除课程，如果课程下有章节则不允许删除
	public boolean deleteCourse(int cid){
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		Transaction tran = session.beginTransaction();
		OclsCourse oc = (OclsCourse) session.createQuery("from OclsCourse c where c.cid=?").setInteger(0, cid).uniqueResult();
		List<OclsPart> plist = session.createQuery("from OclsPart p where p.oclsCourse=?").setEntity(0, oc).list();
		if(plist.size()>0){
			return false;
		}
		session.delete(oc);

		tran.commit();
		session.close();
		return true;
	}
	//检查课程下是否有章节
	public boolean checkCourse(int cid){
		System.out.println("执行到这里：checkCourseDao");
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		OclsCourse oc = (OclsCourse) session.createQuery("from OclsCourse c where c.cid=?").setInteger(0, cid).uniqueResult();
		List<OclsPart> plist = session.createQuery("from OclsPart p where p.oclsCourse=?").setEntity(0, oc).list();
		System.out.println("plist.size()="+plist.size());
		if(plist.size()>0){
			return false;
		}
		session.close();
		return true;
	}
}
