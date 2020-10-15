package com.spring.lifecare.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Service
public class DeepLearningServiceImpl implements DeepLearningService{
	
	//다음과 같은 설정을 통하여 임시폴더에 저장이 가능해 진다
	public static final String DATA_PATH = FilenameUtils.concat(System.getProperty("java.io.tmpdir"),
	        "dl4j_keras/");
	

	@Override
	public Map<String, String> covidTest(MultipartHttpServletRequest req, Model model) throws IOException {
		
		return null;
	}

	@Override
	public Map<String, String> covidTestTest(HttpServletRequest req) {
		return null;
	}

	@Override
	public Map<String, Object> DeepLearningCorona(MultipartHttpServletRequest req, Model model) {
		MultipartFile file = req.getFile("xray_img");
		
		String TestImgSrc ="";
		
		// 업로드할 파일의 최대 사이즈(10 * 1024 * 1024 = 10MB)
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/img/");	
		System.out.println("saveDir : "+saveDir);
		
		ClassPathResource resource = new ClassPathResource("deeplearning/testImg/"); //resource 파일 루트
		
		String formatType = file.getContentType().split("/")[1];//png
		
		String realDir="";
		try {
			realDir = resource.getFile().getPath();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("realDir : "+realDir);
		System.out.println("파일이름 " +file.getOriginalFilename());
		
		try {
			file.transferTo(new File(saveDir+file.getOriginalFilename()));
			System.out.println("file :" + file);
//			BufferedReader in = new BufferedReader(
//					new FileReader(saveDir + file.getOriginalFilename())
//			);
//			BufferedWriter out = new BufferedWriter(
//					new FileWriter(realDir + "/test2."+formatType)
//			);
			
			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + "/test2."+formatType);
			TestImgSrc = realDir + "/test2."+formatType;
			int data = 0;
		
			while((data = fis.read()) != -1) {
				fos.write(data);
			}
			//fos.flush();
			
			//in.close();
			//out.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		/////////////////////////// 여기까지 사진 저장
		String modelSrc = "";
		try {
			modelSrc = new ClassPathResource("deeplearning/model/corona.py").getFile().getPath();
			System.out.println("진짜 modleSrc : "+modelSrc);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		/////////////////////////////////cmd 실행
		List<String> list = new ArrayList<String>();
		
		try {
			//Linux의 경우는 /bin/bash
			//Process process = Runtime.getRuntime().exec("/bin/bash");
			Process process = Runtime.getRuntime().exec("cmd");
			//Process의 각 stream을 받는다.
			//process의 입력 stream
			OutputStream stdin = process.getOutputStream();
			//process의 출력 stream
			InputStream stdout = process.getInputStream();

			//입력 stream을 BufferedWriter로 받아서 콘솔로부터 받은 입력을 Process 클래스로 실행시킨다.
			System.out.println("modelSrc : "+modelSrc.substring(0,modelSrc.length()-9));
			List<String> commendList = new ArrayList<String>();
			//commendList.add("activate tensorflow3.6.5");
			commendList.add("cd "+modelSrc.substring(0,modelSrc.length()-10));
			System.out.println("실행어 : "+ "cd "+modelSrc.substring(0,modelSrc.length()-10));
			modelSrc=modelSrc.substring(0,modelSrc.length()-9) +"mobileNetV2model7.h5";
			commendList.add("corona.py "+ modelSrc+" "+TestImgSrc);
			System.out.println("실행어 : "+ "corona.py "+ modelSrc+" "+TestImgSrc);
			
			try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(stdin))) {
				for(int i=0; i<commendList.size(); i++) {
					// 콘솔로 부터 엔터가 포함되면 input String 변수로 값이 입력됩니다.
					String input =commendList.get(i);
					// 콘솔에서 \n가 포함되어야 실행된다.(엔터의 의미인듯 싶습니다.)
					input += "\n";
					writer.write(input);
					// Process로 명령어 입력
					writer.flush();
					// exit 명령어가 들어올 경우에는 프로그램을 종료합니다.
					if ("exit\n".equals(input)) {
						process.destroy();
					}
				}
				writer.close();
			} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			} 
			
			
			
			try (BufferedReader reader = new BufferedReader(new InputStreamReader(stdout))) {
				String line;
				while ((line = reader.readLine()) != null) {
					list.add(line);
					System.out.println(line);
					
					if(line.contains("[[")) {
						reader.close();
						break;
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(stdin))) {
				for(int i=0; i<=commendList.size(); i++) {
					// 콘솔로 부터 엔터가 포함되면 input String 변수로 값이 입력됩니다.
					String input ="exit";
					// 콘솔에서 \n가 포함되어야 실행된다.(엔터의 의미인듯 싶습니다.)
					input += "\n";
					writer.write(input);
					// Process로 명령어 입력
					// exit 명령어가 들어올 경우에는 프로그램을 종료합니다.
					if ("exit\n".equals(input)) {
						process.destroy();
					}
				}
			} catch (IOException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<String> realresult = new ArrayList<String>();
		
		for(String test : list) {
			if(test.contains("[[")) {
				System.out.println(test.substring(2,test.length()-2));
				test = test.substring(2,test.length()-2);
				
				String[] testList = test.split(" ");
				for(String a : testList) {
					if(!a.equals("")) {
						realresult.add(a);
					}
				}
			}
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("corona", String.format("%.2f", Double.parseDouble(realresult.get(0))*100));
		result.put("normal", String.format("%.2f", Double.parseDouble(realresult.get(1))*100));
		result.put("pneumonia", String.format("%.2f", Double.parseDouble(realresult.get(2))*100));
		
		System.out.println("최종값 코로나 : "+result.get("corona"));
		
		return result;
	}

	@Override
	public Map<String, Object> DeepLearningCancer(HttpServletRequest req, Model model) {
		String radius = req.getParameter("radius");
		String texture = req.getParameter("texture");
		String perimeter = req.getParameter("perimeter");
		String area = req.getParameter("area");
		String smoothness = req.getParameter("smoothness");
		String compactness = req.getParameter("compactness");
		String concavity = req.getParameter("concavity");
		String symmetry = req.getParameter("symmetry");
		String fractal_dimension = req.getParameter("fractal_dimension");
		String age = req.getParameter("age");
		
		String modelSrc = "";
		try {
			modelSrc = new ClassPathResource("deeplearning/model/cancer.py").getFile().getPath();
			System.out.println("진짜 modleSrc : "+modelSrc);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		/////////////////////////////////cmd 실행
		List<String> list = new ArrayList<String>();
		
		try {
			//Linux의 경우는 /bin/bash
			//Process process = Runtime.getRuntime().exec("/bin/bash");
			Process process = Runtime.getRuntime().exec("cmd");
			//Process의 각 stream을 받는다.
			//process의 입력 stream
			OutputStream stdin = process.getOutputStream();
			//process의 출력 stream
			InputStream stdout = process.getInputStream();

			//입력 stream을 BufferedWriter로 받아서 콘솔로부터 받은 입력을 Process 클래스로 실행시킨다.
			System.out.println("modelSrc : "+modelSrc.substring(0,modelSrc.length()-9));
			List<String> commendList = new ArrayList<String>();
			commendList.add("activate tensorflow3.6.5");
			commendList.add("cd "+modelSrc.substring(0,modelSrc.length()-10));
			System.out.println("실행어 : "+ "cd "+modelSrc.substring(0,modelSrc.length()-10));
			modelSrc=modelSrc.substring(0,modelSrc.length()-9) +"logreg.pkl";
			commendList.add("cancer.py "+ modelSrc+" "+radius+" "+texture+" "+perimeter+" "+area+" "+smoothness+" "+compactness+" "+concavity+" "+
					symmetry+" "+fractal_dimension+" "+age);
			System.out.println("실행어 : "+ "cancer.py "+ modelSrc+" "+radius+" "+texture+" "+perimeter+" "+area+" "+smoothness+" "+compactness+" "+concavity+" "+
					symmetry+" "+fractal_dimension+" "+age);
			
			try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(stdin))) {
				for(int i=0; i<commendList.size(); i++) {
					// 콘솔로 부터 엔터가 포함되면 input String 변수로 값이 입력됩니다.
					String input =commendList.get(i);
					// 콘솔에서 \n가 포함되어야 실행된다.(엔터의 의미인듯 싶습니다.)
					input += "\n";
					writer.write(input);
					// Process로 명령어 입력
					writer.flush();
					// exit 명령어가 들어올 경우에는 프로그램을 종료합니다.
					if ("exit\n".equals(input)) {
						process.destroy();
					}
				}
				writer.close();
			} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			} 
			
			
			
			try (BufferedReader reader = new BufferedReader(new InputStreamReader(stdout))) {
				String line;
				while ((line = reader.readLine()) != null) {
					list.add(line);
					System.out.println(line);
					
					if(line.contains("[[")) {
						reader.close();
						break;
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(stdin))) {
				for(int i=0; i<=commendList.size(); i++) {
					// 콘솔로 부터 엔터가 포함되면 input String 변수로 값이 입력됩니다.
					String input ="exit";
					// 콘솔에서 \n가 포함되어야 실행된다.(엔터의 의미인듯 싶습니다.)
					input += "\n";
					writer.write(input);
					// Process로 명령어 입력
					// exit 명령어가 들어올 경우에는 프로그램을 종료합니다.
					if ("exit\n".equals(input)) {
						process.destroy();
					}
				}
			} catch (IOException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<String> realresult = new ArrayList<String>();
		Map<String, Object> result = new HashMap<String, Object>();
		
		for(String test : list) {
			if(test.contains("[")) {
				System.out.println("test : " +test.substring(1,test.length()-1));
				test = test.substring(1,test.length()-1);
				realresult.add(test);
				
				if(test.equals("0")) {
					result.put("result", "악성");
				} else {
					result.put("result", "양성");
				}
			}
		}
		
		result.put("percent", "82.09%");
		
		System.out.println("결과 : "+result.get("result"));
		
		return result;
	}

}
