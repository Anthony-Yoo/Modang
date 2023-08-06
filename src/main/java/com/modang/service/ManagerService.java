package com.modang.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.modang.dao.BiliardDao;
import com.modang.dao.ManagerDao;
import com.modang.vo.ManagerVo;
import com.modang.vo.TariffVo;

@Service
public class ManagerService {
	String saveDir = "C:\\javaStudy\\upload";
	@Autowired private ManagerDao managerDao;
	//@Autowired private TariffVo tariffVo;
	//@Autowired private BiliardDao biliardDao;
	
	/*회원가입*/	//요금테이블 정보 같이 삽입
	public int join(ManagerVo managerVo, List<MultipartFile> file) {
		System.out.println("managerService.join");
		//요금테이블(tariff) 정보 삽입
		//TariffVo tariffVo = new TariffVo();
		//tariffVo.setbiliardno(managerVo.getbiliardNo());//뭐라는거양(*´⌒`*)
		//biliardDao.
		//매니저 정보 삽입
		//이미지 삽입
		int count = 0; 
		for(int i=0; i<file.size(); i++) {
			System.out.println(file.get(i).getOriginalFilename());		
			
			//원 파일 이름
			String orgName = file.get(i).getOriginalFilename();
			System.out.println("orgName:"+orgName);
			
			//확장자
			String exName = file.get(i).getOriginalFilename().substring(file.get(i).getOriginalFilename().lastIndexOf("."));
			System.out.println("exName:"+exName);
			System.out.println("exe:"+file.get(i).getOriginalFilename().lastIndexOf("."));//.앞까지의 글자가 몇개
			//substring(n)-n번째 부터 몇개
			//lastIndexOf(n)-인덱스 n부터 뒤에꺼 가져오기
			
			//저장 파일 이름
			String saveName = System.currentTimeMillis()+UUID.randomUUID().toString()+exName;
			System.out.println("saveName :"+saveName);
			
			//파일패스 (어느경로에 어떤이름으로)
			String filePath = saveDir + "\\"+saveName;
			System.out.println("filePath :"+filePath);
			
			//파일 사이즈
			long fileSize = file.get(i).getSize();
			System.out.println("filesize :"+fileSize);
			
			//파일 업로드(사용자 파일 복사 -하드디스크 저장)
			try {
				byte[] fileData = file.get(i).getBytes();//죽
				OutputStream out = new FileOutputStream(filePath);//빨대
				BufferedOutputStream bout = new BufferedOutputStream(out);//빨대큰거
				bout.write(fileData);//몸속으로넘어감
				bout.close();
			}catch (IOException e) {
				e.printStackTrace();
			}
			count++;
			switch (count) {
				case 1 : 
					managerVo.setImageFile1(saveName);	
					break;
				case 2 :
					managerVo.setImageFile2(saveName);	
					break;
				case 3 :
					managerVo.setImageFile3(saveName);
					break;
				default :
					System.out.println("saveName이 없어용~");
					break;
			}			
		}		
		//db에 저장
		//ManagerVo managerVo= new ManagerVo();
		System.out.println(managerVo);	
		
		managerDao.insertManager(managerVo); // 당구장 사장님 회원가입 
		
		int biliardNo = managerVo.getbiliardNo(); // 당구장 번호 가져오기
		System.out.println("요금테이블생성할 당구장:"+biliardNo);
		int countNo = managerDao.insertTariff(biliardNo); // 당구장 요금표(기본가격) 셍성하기
		
		
		return countNo;
	}
	
	/*회원가입 id 중복체크*/
	public ManagerVo idcheck(String id) {
		System.out.println("ManagerService.idcheck");
		ManagerVo managerVo = managerDao.selectManager(id);		
		
		return managerVo;
	}
	
	/*로그인*/
	public ManagerVo login(ManagerVo managerVo) {
		System.out.println("managerService.login");
		ManagerVo loginManager= managerDao.selectManager(managerVo);
		System.out.println(loginManager);
		return loginManager;
	}
	/* 당구장 정보 수정폼*/
	public ManagerVo settingsForm(int biliardNo) {
		System.out.println("managerService.settingsForm");
		ManagerVo managerVo = managerDao.selectManager(biliardNo);
		return managerVo;
	}
	/*당구장 정보 수정*/
	public ManagerVo modify(ManagerVo managerVo, List<MultipartFile> file) {
		System.out.println("managerService.modify");
		for(int i=0; i<file.size(); i++) {
			System.out.println(file.get(i).getOriginalFilename());

			//원 파일 이름
			String orgName = file.get(i).getOriginalFilename();		
			//확장자
			String exName = file.get(i).getOriginalFilename().substring(file.get(i).getOriginalFilename().lastIndexOf("."));		
			//저장 파일 이름
			String saveName = System.currentTimeMillis()+UUID.randomUUID().toString()+exName;
			System.out.println("saveName :"+saveName);
			//파일패스 (어느경로에 어떤이름으로)
			String filePath = saveDir + "\\"+saveName;
			System.out.println("filePath :"+filePath);	
			//파일 사이즈
			long fileSize = file.get(i).getSize();
			System.out.println("filesize :"+fileSize);
			//파일 업로드(사용자 파일 복사 -하드디스크 저장)
			try {
				byte[] fileData = file.get(i).getBytes();//죽
				OutputStream out = new FileOutputStream(filePath);//빨대
				BufferedOutputStream bout = new BufferedOutputStream(out);//빨대큰거
				bout.write(fileData);//몸속으로넘어감
				bout.close();
			}catch (IOException e) {
				e.printStackTrace();
			}
			managerVo.setImageFile1(saveName);
			managerVo.setImageFile2(saveName);
			managerVo.setImageFile3(saveName);
		}
		//db에 저장
		//ManagerVo managerVo= new ManagerVo();
		System.out.println(managerVo);
		int count = managerDao.updateManager(managerVo);
		return managerVo;
	}
	
	
	
}