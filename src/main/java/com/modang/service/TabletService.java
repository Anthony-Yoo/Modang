package com.modang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.TabletDao;
import com.modang.vo.StaticVo;
import com.modang.vo.TabletUserVo;

@Service
public class TabletService {
	
	@Autowired
	private TabletDao tabletDao;
	
	public TabletUserVo loginGetKey(TabletUserVo userVo) {
		System.out.println("TabletService.loginGetKey()");
		
		//유져 로그인 & Key확인
		TabletUserVo logOnVo = tabletDao.selectUser(userVo);		
		
		//로그인 완료
		if (logOnVo != null) {
			System.out.println("로그인성공!"+logOnVo);
			
			// 30분 넘는 번호 삭제
			tabletDao.deleteTime(StaticVo.NORMAL_TIME);
			//난수 생성(2자리)
			int keyNum = (int)(Math.random() * 89) + 10;
			System.out.println(keyNum);
			
			//생성난수 검색(있다/없다 분개)
			TabletUserVo searchKeyVo = tabletDao.selectKeyNum(keyNum);
			
			//해당 난수없다
			if (searchKeyVo == null ) {
				//키테이블 입력
				logOnVo.setKeyNum(keyNum);
				System.out.println(logOnVo);
				tabletDao.insertKeyNum(logOnVo);				
				System.out.println(logOnVo);
			}
			//해당 난수있다
			else {
				//난수 중복체크 후 없는 난수 생성
				while(searchKeyVo == null) {
					//난수재생성(2자리)
					keyNum = (int)(Math.random() * 89) + 10;									
					searchKeyVo = tabletDao.selectKeyNum(keyNum);
					System.out.println(keyNum);
					}
				//키테이블 입력
				logOnVo.setKeyNum(keyNum);
				tabletDao.insertKeyNum(logOnVo);				
				System.out.println(logOnVo);
				}		
			}
			//로그인 실패
			else {
				System.out.println("로그인 실패");			
			}		
			return logOnVo; 	
	}	
	
	
//	public TabletUserVo keyLogin(int keyNum) {
//		System.out.println("TabletService.keyLogin()");
//		
//		tabletDao.deleteTime(StaticVo.NORMAL_TIME);
//		TabletUserVo keyTimeVo = 
//		/* TabletUserVo keyTimeVo = tabletDao.selectKeyNum(keyNum); */
//		
//		return null;
//	}
	
}
