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
 
  .findPassword_area {
    width: 900px;
    margin: 0px auto 50px;
    text-align: center;
    padding: 50px 170px;
    border: 1px solid #ebebeb;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
  }
  


  .findPassword_area p {
    color: #424242;
    font-size: 30px;
    line-height: 1;
    margin-bottom: 30px;
   }
  
  .findPassword_area input {
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
    width: 30%;
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
     margin-top: 3% !important;
     margin-right: 3% !important;
     margin-bottom: 3% !important;
    
  }
   .btn-type.btn3.red  {
    color: red !important;
    border: 1px #2e3033;
    background: #e74a3b;
  }
  
  .btn-type.btn3.red {
    color: #fff !important;
    border: 1px  #2e3033;
    background: #e74a3b;
  }
  .btn-type.btn3 {
    width: 30%;
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
  
</style>
<title>비밀번호 찾기</title>
</head>
<%@include file="../common/header.jsp" %>
<body>
     <form action="${pageContext.request.contextPath}/findPwdSendEmail?${_csrf.parameterName}=${_csrf.token}" method="post" name="findPassword">
         <div class="title">비밀번호 찾기</div>
        <div class="findPassword_area">
          <p>FORGOT YOUR PASSWORD?</p>                
                          비밀번호가 기억나지 않으세요?<br> 
                          회원가입 시 입력하신  아이디과 이메일주소를 입력하여 분실하신 비밀번호를 찾으실 수 있습니다. 
                          임시 비밀번호로 로그인하신 후 실제 사용하실 비밀번호로 변경해주시기 바랍니다. 
            
             <input type="text" name="customer_id" id="" placeholder="아이디를 입력해주세요." class="mb10" value="" required>
             <input type="text" name="customer_email" id="" placeholder="이메일을 입력해주세요" class="mb10" value="" required >  
            <div class="press">
              <button type="submit" class="btn-type btn2 blue mr_2">비밀번호 찾기</button>
              <button type="reset" class="btn-type btn3 red mr_2">취소</button>
          </div>           
         </div>                                         
     </form>
</body>
<%@include file="../common/footer.jsp" %>
</html>