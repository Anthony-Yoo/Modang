package com.modang.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.modang.dao.UserDao;
import com.modang.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	
	/*회원가입*/
	/**
	 * @param userVo
	 * @param file
	 * @return
	 */
	/**
	 * @param userVo
	 * @param file
	 * @return
	 */
	public int join(UserVo userVo, MultipartFile file) {
		
		System.out.println("UserService.join()");
		//System.out.println(userVo);
		
		//파일저장경로
		String saveDir = "C:\\javastudy\\upload";
		
		//파일관련정보 뽑는다
		System.out.println("FileUploadService.restore()");
		System.out.println(file);
		
		//원파일 이름
		String orgname = file.getOriginalFilename();//실제 저장되는 사용자가 지정한 파일의 이름
		System.out.println("orgname: "+ orgname);
		
		//확장자
		String exname = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		System.out.println("exname"+ exname);
		System.out.println("exe:"+ file.getOriginalFilename().lastIndexOf("."));
		
		//저장파일 이름
		String savename = System.currentTimeMillis()+UUID.randomUUID().toString()+exname;//UUID.randomUUID()가 실제 이미지 이름을 숫자포함된 문자열로 저장.
		System.out.println("savename"+ savename);//리턴형이 UUID
		
		//파일패스 : 실제 파일의 저장 경로
		String filePath = saveDir +"\\"+savename;
		System.out.println("filePath:"+filePath);
		
		//파일 사이즈
		long fileSize = file.getSize();
		System.out.println("fileSize:"+ fileSize);
		
		//파일 업로드 ( 하드디스크에 저장)
		try {
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bout = new BufferedOutputStream(out);
			bout.write(fileData);
			bout.close();
			
		}catch (IOException e) {
			e.printStackTrace();
			
		}
		
		userVo.setProfileImage(savename);
		int count=userDao.insertUser(userVo);
		
		return count;
		
	}
	/*로그인*/
	public UserVo login(UserVo userVo) {
		System.out.println("UserService.login()");
		System.out.println(userVo);
		
		UserVo authUser=userDao.selectUser(userVo);
		
		return authUser;
	}
	/*수정폼*/
	public UserVo modifyForm(String id) {
		System.out.println("UserService.modifyForm()");
		System.out.println(id);
		
		UserVo userNo=userDao.updateSelect(id);
		System.out.println(userNo);
		return userNo;
	}
	/*수정*/
	public int modify(UserVo userVo, MultipartFile file) {
		
		System.out.println("UserService.modify()");
		System.out.println(userVo);
		
		if(!file.isEmpty()) {//수정할 파일이 있으면
			//파일저장경로
			String saveDir = "C:\\javastudy\\upload";

			//원파일 이름
			String orgname = file.getOriginalFilename();//실제 저장되는 사용자가 지정한 파일의 이름
			System.out.println("orgname: "+ orgname);
			
			//확장자
			String exname = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			System.out.println("exname"+ exname);
			System.out.println("exe:"+ file.getOriginalFilename().lastIndexOf("."));
			
			//저장파일 이름
			String savename = System.currentTimeMillis()+UUID.randomUUID().toString()+exname;//UUID.randomUUID()가 실제 이미지 이름을 숫자포함된 문자열로 저장.
			System.out.println("savename"+ savename);//리턴형이 UUID
			
			//파일패스 : 실제 파일의 저장 경로
			String filePath = saveDir +"\\"+savename;
			System.out.println("filePath:"+filePath);
			
			//파일 사이즈
			long fileSize = file.getSize();
			System.out.println("fileSize:"+ fileSize);
			
			//파일 업로드 ( 하드디스크에 저장)
			try {
				byte[] fileData = file.getBytes();
				OutputStream out = new FileOutputStream(filePath);
				BufferedOutputStream bout = new BufferedOutputStream(out);
				bout.write(fileData);
				bout.close();
				
			}catch (IOException e) {
				e.printStackTrace();
				
			}
		
			userVo.setProfileImage(savename);
		}
		
		int count=userDao.updateUser(userVo);
		
		return count;
	}
	
	
	//id check
	public boolean idCheck(String id) {
		System.out.println("UserService.idCheck()");
		System.out.println(id);
		UserVo userVo=userDao.selectUser(id);
		
		boolean result;
		if(userVo==null) {
			result=true;
		}else {
			result=false;
		}
		
		return result;
	}

}
