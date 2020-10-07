package com.spring.lifecare.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;

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
		
		return null;
	}

	@Override
	public Map<String, String> covidTestTest(HttpServletRequest req) {
		return null;
	}

}
