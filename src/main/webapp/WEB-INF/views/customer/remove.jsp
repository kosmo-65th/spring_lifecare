<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
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
 
  .remove_area {
    width: 900px;
    margin: 0px auto 50px;
    text-align: center;
    padding: 50px 170px;
    border: 1px solid #ebebeb;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
  }
  


  .remove_area p {
    color: #424242;
    font-size: 30px;
    line-height: 1;
    margin-bottom: 30px;
   }
  
  .remove_area input {
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

<title>회원 탈퇴</title>
</head>
<body>
<%@include file="../common/header.jsp" %>
  <form action="" method="post" name="findIdform" onsubmit="">
      <div class="title">회원탈퇴 하기</div>
        <div class="remove_area">
          <p>DO YOU WANT TO LEAVE OUR MEMBER?</p>
                           본인 확인을 위해 비밀번호를 한번 더 입력하신 후 탈퇴하기를 누르시면 정상적으로 탈퇴처리 됩니다. <br><br>  
             <input type="password" name="customer_pw" id="" placeholder="비밀번호" class="mb10" value="" required> 
             <input type="password" name="customer_PwChk" id="" placeholder="비밀번호확인" class="mb10" value="" required>                          
         </div>
                                       
        <div class="press">
              <button type="submit" class="btn-type btn2 blue mr_2">탈퇴하기</button>
              <button type="reset" class="btn-type btn2 blue">취소</button>
          </div>
      </form>
<%@include file="../common/footer.jsp" %>
</body>
</html>