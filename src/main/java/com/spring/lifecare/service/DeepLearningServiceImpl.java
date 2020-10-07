package com.spring.lifecare.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.deeplearning4j.nn.conf.ComputationGraphConfiguration;
import org.deeplearning4j.nn.graph.ComputationGraph;
import org.deeplearning4j.nn.modelimport.keras.KerasModel;
import org.deeplearning4j.nn.modelimport.keras.KerasModelImport;
import org.deeplearning4j.nn.modelimport.keras.exceptions.InvalidKerasConfigurationException;
import org.deeplearning4j.nn.modelimport.keras.exceptions.UnsupportedKerasConfigurationException;
import org.nd4j.common.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Service
public class DeepLearningServiceImpl implements DeepLearningService{
	
	//다음과 같은 설정을 통하여 임시폴더에 저장이 가능해 진다
	public static final String DATA_PATH = FilenameUtils.concat(System.getProperty("java.io.tmpdir"),
	        "dl4j_keras/");
	

	@Override
	public Map<String, String> covidTest(MultipartHttpServletRequest req, Model model) throws IOException {
		String modelfile = new ClassPathResource("../../../../../webapp/resources/deeplearningModel/mobileNetV2model6.h5").getFile().getPath();
		ComputationGraph Deepmodel = null;
		try {
			Deepmodel = KerasModelImport.importKerasModelAndWeights(modelfile);
		} catch (UnsupportedKerasConfigurationException | InvalidKerasConfigurationException e) {
			System.out.println("error : "+e.getMessage());
		}
		
		// 사진 파일 경로
		//String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/");  // 업로드할 파일이 위치하게될 실제 경로
		String projectRoot = System.getProperty("user.dir");
		System.out.println(projectRoot);
		
		
		return null;
	}

	@Override
	public Map<String, String> covidTestTest(HttpServletRequest req) {
		/*
		String rootDir = DeepLearningServiceImpl.class.getResource(".").getPath();
		System.out.println("RootDir : "+rootDir);  // /C:/install/apache-tomcat-8.5.57/wtpwebapps/spring_lifecare/WEB-INF/classes/com/spring/lifecare/service/
		
		rootDir = rootDir.replace("WEB-INF/classes/com/spring/lifecare/service/", "");
		System.out.println("reRootDir : "+rootDir);  // C:/install/apache-tomcat-8.5.57/wtpwebapps/spring_lifecare/
		
		rootDir += "resources/deeplearningModel/"; // C:/install/apache-tomcat-8.5.57/wtpwebapps/spring_lifecare/resources/deeplearningModel/
		rootDir = rootDir.substring(1);
		System.out.println("rRReRootDir : "+rootDir);
		*/
		//모델 직렬화
	
		String modelfile="";
		String weightfile ="";
		try {
			modelfile = new ClassPathResource("deeplearningModel/mobileNetV2model7_complete.h5").getFile().getPath();
			weightfile = new ClassPathResource("deeplearningModel/mobileNetV2model7_weight.h5").getFile().getPath();
		} catch (IOException e1) {
			System.out.println("service-covidTestTest IOException");
		}
		
		try {
			ComputationGraph graph = KerasModelImport.importKerasModelAndWeights(modelfile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedKerasConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKerasConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
