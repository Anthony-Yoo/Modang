package com.modang.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.modang.dao.ManagerDao;
import com.modang.vo.ManagerVo;

@Service
public class ManagerService {
	String saveDir = "C:\\javaStudy\\upload";
	@Autowired
	private ManagerDao managerDao;
	
	/*회원가입*/
	public void join(MultipartFile file,ManagerVo managerVo) {
		System.out.println("managerService.join");
		//매니저 정보 삽입
		managerDao.insertManager(managerVo);
		//요금테이블(tariff) 정보 삽입

		//매장이미지 정보 삽입
		System.out.println("GalleryService.addGallery()");
		System.out.println("FileuploadService.restore()");
		System.out.println(file.getOriginalFilename());
		
		//원 파일 이름
		String orgName = file.getOriginalFilename();
		System.out.println("orgName:"+orgName);
		
		//확장자
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		System.out.println("exName:"+exName);
		System.out.println("exe:"+file.getOriginalFilename().lastIndexOf("."));//.앞까지의 글자가 몇개
		//substring(n)-n번째 부터 몇개
		//lastIndexOf(n)-인덱스 n부터 뒤에꺼 가져오기
		
		//저장 파일 이름
		String saveName = System.currentTimeMillis()+UUID.randomUUID().toString()+exName;
		System.out.println("saveName :"+saveName);
		
		//파일패스 (어느경로에 어떤이름으로)
		String filePath = saveDir + "\\"+saveName;
		System.out.println("filePath :"+filePath);
		
		//파일 사이즈
		long fileSize = file.getSize();
		System.out.println("filesize :"+fileSize);
		
		//파일 업로드(사용자 파일 복사 -하드디스크 저장)
		try {
			byte[] fileData = file.getBytes();//죽
			OutputStream out = new FileOutputStream(filePath);//빨대
			BufferedOutputStream bout = new BufferedOutputStream(out);//빨대큰거
			bout.write(fileData);//몸속으로넘어감
			bout.close();
		}catch (IOException e) {
			e.printStackTrace();
		}
		//db에 저장
		//ManagerVo managerVo= new ManagerVo(0,imageFile1,imageFile2,imageFile3);
		System.out.println(managerVo);
		
		managerDao.insertManager(managerVo);
	}
	
	/*로그인*/
	public ManagerVo login(ManagerVo managerVo) {
		System.out.println("managerService.login");
		ManagerVo loginManager= managerDao.selectManager(managerVo);
		System.out.println(loginManager);
		return loginManager;
	}
	


}