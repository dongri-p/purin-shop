<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    @font-face {
      font-family:Arial, sans-serif;
      font-weight:300;
      font-style:normal;
    } 
    body {
      margin:0px;
      font-family:Arial, sans-serif;
    }
    #fouter {
      width:100%;
      height:30px;
      background:#f8d0d9;
    }
    #fouter {
      cursor:pointer;
    }
    #fouter #first {
      width:1100px;
      height:30px;
      margin:auto;
      background:#f8d0d9;
    }
    #fouter #first #left {
      display:inline-block;
      width:1000px;
      height:30px;
      line-height:30px;
      text-align:center;
      color:#ec048c;
    }
    #fouter #first #right {
      display:inline-block;
      width:80px;
      height:30px;
      line-height:30px;
      text-align:right;
      color:#ec048c;
    }
    
    header {
      width:1100px;
      height:70px;
      margin:auto;
    }
    header #logo {
      display:inline-block;
      width:300px;
      height:70px;
      line-height:70px;
    }
    header #search {
      display:inline-block;
      width:480px;
      height:70px;
      line-height:70px;
    }
    header #search #searchForm {
      width:350px;
      height:44px;
      border:1px solid black;
      line-height:44px;
      border-radius:15px;
    }
    header #search #searchForm input[type="text"] {
      width:280px;
      border:none;
      outline:none;
      margin-left:10px;
    }
    header #memMenu {
      display:inline-block;
      width:300px;
      height:70px;
      line-height:70px;
    }
    header a {
      text-decoration:none;
      color:black;
    }
    
    nav {
      width:1100px;
      height:60px;
      margin:auto;
    }
    nav > ul {
      padding-left:0px;
    }
    nav > ul > li {
      display:inline-block;
      width:150px;
      height:60px;
      line-height:60px;
    }
    nav > ul > li:first-child {
      width:240px;
    }
    nav > ul > li:last-child {
      width:220px;
      text-align:right;
    }
    
    footer {
      width:1100px;
      height:150px;
      margin:auto;
      background:purple;
    }
  </style>
  <script>
    var h=30;
    function fclose()
    {
    	// id="fouter"내의 모든 걸 숨기기
    	//document.getElementById("fouter").display="none";
    	ss=setInterval(function()
    	{
    		h--;
        	document.getElementById("fouter").style.height=h+"px";
        	document.getElementById("first").style.height=h+"px";
        	
        	if(h == 0)
        	{
        		clearInterval(ss);
        		document.getElementById("fouter").style.display="none";
        	}
    	}, 10);

    	//쿠키변수에 사용자가 x를 클릭하였으므로 정보를 저장 후 안보여주기
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		if(chk.responseText == "0")
    		{
    			alert("오류");
    		}
    	}
    	chk.open("get", "../firstCookie");
    	chk.send();
    }
    
    // default.jsp는 모든 페이지가 다 사용한다
    // 비동기방식으로 접근
    window.onload=function()
    {
    	// 쿠키를 체크하여 보여줄지 말지를 결정한다
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		var n=chk.responseText;
    		if(n == "1")
    		{
    			document.getElementById("fouter").style.display="none";
    		}
    	}
    	chk.open("get", "../fcookOk");
    	chk.send();
    }
  </script>
  <sitemesh:write property="head"/>
</head>
<body> <!-- default.jsp -->
  <div id="fouter">
    <div id="first">
      <div id="left"> 회원가입하고 왕푸린의 사랑을 받으세요~ </div>
      <div id="right"> <span id="xx" onclick="fclose()"> X </span> </div>
    </div>
  </div>
  
  <header>
    <div id="logo">
      <img src="../static/logo.png" width="250" valign="middle" onclick="location='../main/main'">
    </div>
  	<div id="search"> 
  	  <div id="searchForm">
  	    <input type="text" name="sword" id="sword">
  	    <img src="../static/s.png" valign="middle">
  	  </div>
    </div>
  	<div id="memMenu">
  	  장바구니 |
  	 <c:if test="${userid == null}"> 
  	  <a href="../login/login"> 로그인 </a> |
  	  <a href="../member/member"> 회원가입 </a> |
  	 </c:if>
  	 <c:if test="${userid != null}"> 
  	  ${name}님 |
  	  <a href="logout"> 로그아웃 </a> |
  	 </c:if> 
  	  고객센터
  	</div>
  </header>
  
  <nav>
    <ul>
      <li> 카테고리 </li>
      <li> 신상품 </li>
      <li> 베스트 </li>
      <li> 알뜰쇼핑 </li>
      <li> 특가/혜택 </li>
      <li> 푸린하루배송 </li>
    </ul>
  </nav>
  
  <sitemesh:write property="body"/>
  
  <footer> </footer>
	
</body>
</html>