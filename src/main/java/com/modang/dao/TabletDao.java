package com.modang.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modang.vo.LoginKeyVo;
import com.modang.vo.TabletUserVo;

@Repository
public class TabletDao {
	
	@Autowired
	private SqlSession session;
	
	public TabletUserVo selectUser(TabletUserVo userVo) {
		System.out.println("TabletDao.selectUser()");
		
		return session.selectOne("tablet.selectUser", userVo);
	}
	
	public LoginKeyVo selectUserKey(TabletUserVo userVo) {
		System.out.println("TabletDao.selectUserKey()");
		
		return session.selectOne("tablet.selectUserKey", userVo);
		
	}
	public int insertKeyNum(TabletUserVo userVo) {
		System.out.println("TabletDao.insertKeyNum()");
		
		return session.insert("tablet.insertKeyNum", userVo);
		
	}
	public LoginKeyVo selectKeyNum(int keyNum) {
		System.out.println("TabletDao.selectKeyNum()");
		
		return session.selectOne("tablet.selectKeyNum", keyNum);		
	}
	
	public int deleteTime(int normalTime) {
		System.out.println("TabletDao.deleteTime()");
				
		return session.delete("tablet.deleteTime", normalTime);
	}

}
