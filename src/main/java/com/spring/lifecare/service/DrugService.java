package com.spring.lifecare.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public interface DrugService {


	void searchDrug(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}