<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 .title {
	  display: inline-block;
	  width: 100%;
	  text-align: center;
	  font-weight: 500;
	  color: #1a1a1a;
	  font-size: 34px;
	  line-height: 1;
	  margin-bottom: 30px;
 }
 
  .findId_area {
    width: 900px;
    margin: 0px auto 50px;
    text-align: center;
    padding: 50px 170px;
    border: 1px solid #ebebeb;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
  }
  


  .findId_area p {
    color: #424242;
    font-size: 30px;
    line-height: 1;
    margin-bottom: 30px;
   }
  
  .findId_area input {
    display: inline-block;
    box-sizing: border-box;
    border: 1px solid #d9d9d9;
    background: #fff;
    width: 100%;
    height: 45px;
    padding: 10px;
    color: #858585;
    font-size: 14px;
    line-height: 1;
    font-weight: 200;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
 }
 .mb10 {
    margin-bottom: 10px !important;
    margin-top: 10px;
    
  }
  .press {
     text-align: center;
  }
  .btn-type.btn2.blue  {
    color: blue !important;
    border: 1px #2e3033;
    background: #009DFF;
  }
  
  .btn-type.btn2.blue {
    color: #fff !important;
    border: 1px  #2e3033;
    background: #009DFF;
  }
  .btn-type.btn2 {
    width: 15%;
    height: 45px;
    line-height: 40px;
    font-size: 18px;
    text-transform: uppercase;
    font-family: 'NotoSansKR';
    font-style: normal;
    font-weight: 400;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
  }
  .btn-type {
    display: inline-block;
    position: relative;
    cursor: pointer;
    transition: all 0.3s;
  }
  .mr_2 {
    margin-right: 2% !important;
  }
  
</style>
<title>아이디 찾기</title>
</head>

<body>
<%@include file="header.jsp" %>
    <form action="" method="post" name="findIdform" onsubmit="">
      <div class="title">아이디 찾기</div>
        <div class="findId_area">
          <p>FORGOT YOUR ID?</p>
                           아이디가 기억나지 않으세요? 분실하신 아이디를 찾으실 수 있습니다.
                          회원가입 시 입력하신 이름과 휴대폰번호를 이용하여 분실하신 아이디를 조회하실 수 있습니다.   
               <input type="text" name="name" id="" placeholder="이름" class="mb10" value="" >     
               <input type="text" name="phone" id="" placeholder="휴대폰 번호를 입력해주세요." class="mb10" value="" >        
         </div>
                                       
        <div class="press">
              <button type="submit" class="btn-type btn2 blue mr_2">아이디 찾기</button>
              <button type="reset" class="btn-type btn2 blue">취소</button>
          </div>
      </form>
      <%@include file="footer.jsp" %>
   </body>
</html>