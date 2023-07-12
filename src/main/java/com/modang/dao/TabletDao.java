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
	public int updateKeyNum(TabletUserVo userVo) {
		System.out.println("TabletDao.updateKeyNum()");
		
		return session.update("tablet.updateKeyNum", userVo);		
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
