package com.modang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.TabletDao;
import com.modang.vo.LoginKeyVo;
import com.modang.vo.StaticVo;
import com.modang.vo.TabletUserVo;

@Service
public class TabletService {
	
	@Autowired
	private TabletDao tabletDao;
	
	public TabletUserVo loginGetKey(TabletUserVo userVo) {
		System.out.println("TabletService.loginGetKey()");
		
		// 30분 넘는 번호 삭제
		tabletDao.deleteTime(StaticVo.NORMAL_TIME);
		
		//본인키 검색(있다/없다 분개)
		TabletUserVo selectVo = tabletDao.selectUser(userVo);			
		if (selectVo == null ) {
			int keyNum = (int)(Math.random() * 8999) + 1000;
			System.out.println(keyNum);
			
			LoginKeyVo keyVo = tabletDao.selectKeyNum(keyNum);
			while(keyVo != null) {
				keyNum = (int)(Math.random() * 8999) + 1000;
				System.out.println(keyNum);
				
				keyVo = tabletDao.selectKeyNum(keyNum);	
				
			}
			selectVo.setKeyNum(keyNum);
			System.out.println(selectVo);	
			tabletDao.updateKeyNum(selectVo);
		}
		else {
			System.out.println("로그인 실패");			
		}
		return selectVo; 	
	}	
	
	
	public TabletUserVo keyTimeLogin(int keyNum) {
		System.out.println("TabletService.keyTimeLogin()");
		
		/* TabletUserVo keyTimeVo = tabletDao.selectKeyNum(keyNum); */
		
		return null;
	}
	
}
