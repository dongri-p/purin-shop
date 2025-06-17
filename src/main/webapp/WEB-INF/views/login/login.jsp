<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    section {
      width:1100px;
      height:500px;
      margin:auto;
      text-align:center;
    }
    section div {
      margin-top:10px;
    }
    section h3 {
      text-align:center;
      color:#ec048c;
      font-size:24px;
      margin-bottom:30px;
    }
    section input[type="text"],
    section input[type="password"],
    section input[type="submit"] {
      width:420px;
      padding:12px;
      margin:5px 0;
      border:1px solid #f8d0d9;
      border-radius:4px;
      box-sizing:border-box;
      font-size:16px;
    }
    section input[type="text"]:focus,
    section input[type="password"]:focus {
      border-color:#ec048c;
      outline:none;
    }
    section #submit {
      background-color:#f8d0d9;
      color:black;
      border:none;
      cursor:pointer;
      font-size:18px;
      transition:background-color 0.3s ease;
    }
    section #submit:hover {
      background-color:#ec048c;
      color:white;
    }
    section .find {
      margin-top:10px;
    }
    section .find:hover {
      cursor:pointer;
    }
  </style>
  <script>
    function findU()
    {
        open("fUserid","op","width=700,height=500");
    }
    function findP()
    {
        open("fPwd","op","width=700,height=500");
    }
    
  </script>
</head>
<body> <!-- /login/login.jsp -->
  <section>
    <c:if test="${param.err == 1}">
     <!-- param으로 넘어오는 값을 사용가능 -->
    </c:if>
    <h3 align="center"> 로그인 </h3>
    <form method="post" action="loginOk" name="lform" onsubmit="return check()">
      <div> <input type="text" name="userid" id="txt" placeholder="아이디"> </div>
      <div>
        <input type="password" name="pwd" id="txt" placeholder="비밀번호">
       <c:if test="${err == 1}">
        <br> <span style="font-size:12px;color:red;"> 아이디 혹은 비밀번호 오류입니다. </span>
       </c:if>
      </div>
      <div> <input type="submit" value="로그인" id="submit"> </div>
      <div class="find">
        <span onclick="findU()"> 아이디 찾기 </span>&nbsp;|&nbsp;
        <span onclick="findP()"> 비밀번호 찾기 </span>&nbsp;|&nbsp;
        <span onclick="location='../member/member'"> 회원가입 </span>
      </div>
    </form>
  </section>
</body>
</html>