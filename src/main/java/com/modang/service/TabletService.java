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
		
		//유져 로그인
		TabletUserVo logOnVo = tabletDao.selectUser(userVo);
		
		//로그인 완료
		if (logOnVo != null) {
			System.out.println("로그인성공!"+logOnVo);
			
			// 30분 넘는 번호 삭제
			tabletDao.deleteTime(StaticVo.NORMAL_TIME);
			
			//본인키 검색(있다/없다 분개)
			LoginKeyVo myKeyVo = tabletDao.selectUserKey(logOnVo);
			
			//본인키 없으면..
			if (myKeyVo == null ) {
				//난수 생성(2자리)
				int keyNum = (int)(Math.random() * 89) + 10;
				System.out.println(keyNum);
				
				//해당키 검색
				LoginKeyVo keyOwnerVo = tabletDao.selectKeyNum(keyNum);				
				
				//해당키 있으면..
				while(keyOwnerVo != null) {
					//난수재생성(2자리)
					keyNum = (int)(Math.random() * 89) + 10;
					System.out.println(keyNum);
					
					myKeyVo = tabletDao.selectKeyNum(keyNum);					
				}				
				//생성된 신규 키 선언
				int newKey = myKeyVo.getKeyNum();
				System.out.println(newKey);
				//로그온VO에 신규키 셋
				logOnVo.setKeyNum(newKey);
				System.out.println(logOnVo);
				//키테이블에 인서트
				tabletDao.insertKeyNum(logOnVo);			
			}
			//본인키 있으면..
			else {
				System.out.println("키있음");
				//있던 키 선언
				int oldKey =  myKeyVo.getKeyNum();
				System.out.println(oldKey);
				//로그온Vo에 있던키 셋
				logOnVo.setKeyNum(oldKey);
				System.out.println(logOnVo);			
			}
		}
		//로그인 실패
		else {
			System.out.println("로그인 실패");			
		}		
		return logOnVo; 	
	}	
	
	
	public TabletUserVo keyTimeLogin(int keyNum) {
		System.out.println("TabletService.keyTimeLogin()");
		
		/* TabletUserVo keyTimeVo = tabletDao.selectKeyNum(keyNum); */
		
		return null;
	}
	
}
