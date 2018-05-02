package com.service;

import com.dao.StudentDao;
import com.po.OclsBlacklist;
import com.po.OclsStudent;
import com.util.Page;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StudentService {

	@Resource
	private StudentDao studentDao;

	//根据教师tid获得关注此老师的所有学生列表
	public List<OclsStudent> getStudentByTid(int tid, Page page){
			return studentDao.getStudentByTid(tid, page);
	}
	//获取关注此老师的所有学生的总记录数
	public int getStudentNum( int tid){
			return studentDao.getStudentNum(tid);
	}
	//加入黑名单
		public void addBlacklist(int tid,int sid){
			studentDao.addBlacklist(tid, sid);
		}
		//获取黑名单
		public List<OclsBlacklist> getBlacklistByTid(int tid, Page page){
			return studentDao.getBlacklistByTid(tid, page);
		}
		//获取黑名单的数据记录数
		public int getBlacklistNum(int tid){
			return studentDao.getBlacklistNum(tid);
		}
		//移除黑名单
		public void deleteBlacklist(int bid){
			studentDao.deleteBlacklist(bid);
		}
}
