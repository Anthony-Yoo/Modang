package com.modang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.TabletDao;
import com.modang.vo.TabletUserVo;

@Service
public class TabletService {
	
	@Autowired
	private TabletDao tabletDao;
	
	public TabletUserVo loginGetKey(TabletUserVo userVo) {
		System.out.println("TabletService.loginGetKey()");
		
		TabletUserVo selectVo = tabletDao.selectUser(userVo);
		if (selectVo != null ) {
			int keyNum = (int)(Math.random() * 8999) + 1000;
			System.out.println(keyNum);
			selectVo.setKeyNum(keyNum);
			System.out.println(selectVo);	
			tabletDao.updateKeyNum(selectVo);
		}
		else {
			System.out.println("로그인 실패");			
		}
		return selectVo; 	
	}

}
