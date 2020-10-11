package test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class Main{
  public static void main(String[] args) throws IOException{
  	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
  	BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
  	StringBuilder stringB = new StringBuilder("");
  	String varName;
  	String varType;
  	
  	a:
  	while(true) {
	    	String strArr = br.readLine();
	    	strArr= strArr.trim();
	    	
  		String[] str = strArr.split(" ");
	    	
  		if(str[0].contentEquals("CREATE")) {
  			
  			continue a;
  		}else if(strArr.contentEquals(");")) {
  			break a;
  		}else {
  			if(str[0].contentEquals(",")) {
  	    		varName = str[1];
  		    	varType = str[2].toUpperCase();
  	    	}else {
  		    	varName = str[0];
  		    	varType = str[1].toUpperCase();
  	    	}
  		}
  		
  		
	    	
	    	if(varType.contains("NUMBER")) {
	    		varType="int";
	    	}else if(varType.contains("VARCHAR")) {
	    		varType="String";
	    	}else if(varType.contains("TIMESTAMP")) {
	    		varType="Timestamp";
	    	}
	    	
	    	
	    	stringB.append("private ");
	    	stringB.append(varType+" ");
	    	stringB.append(varName+";");
	    	stringB.append("\n");
	    	//System.out.println(stringB);
  	}
  	
  	bw.write(stringB.toString());
  	bw.flush();
  }
}
/*
CREATE TABLE Customer(
	id varchar2(50)PRIMARY KEY ,
	password varchar2(50) NOT NULL ,
  name varchar2(20) NOT NULL,
  jumin varchar2(13) NOT NULL,
  birth Timestamp NOT NULL,
  solar varchar2(3) NOT NULL,
  gender varchar2(1) NOT NULL,
  email varchar2(100) NOT NULL,
  phone varchar2(13) NOT NULL,
  emailCheck varchar2(1) NOT NULL,
  smsCheck varchar2(1) NOT NULL,
  address1 varchar2(10) NOT NULL,
  address2 varchar2(150) NOT NULL,
  address3 varchar2(150) NOT NULL
);

*/