package com.spring.lifecare.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface DeepLearningService {
	public Map<String, String> covidTest(MultipartHttpServletRequest req, Model model) throws IOException;
	public Map<String, String> covidTestTest(HttpServletRequest req) ;
	
	public Map<String, Object> DeepLearningCorona(MultipartHttpServletRequest req, Model model);
	
	public Map<String, Object> DeepLearningCancer(HttpServletRequest req, Model model);
	
}
