<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /login/login.jsp -->
  <section>
    <c:if test="${param.err == 1}">
     <!-- param으로 넘어오는 값을 사용가능 -->
    </c:if>
    <h3 align="center"> 로그인 </h3>
    <form method="post" action="loginOk">
      <div> <input type="text" name="userid" placeholder="아이디"> </div>
      <div>
        <input type="password" name="pwd" placeholder="비밀번호">
       <c:if test="${err == 1}">
        <br> <span style="font-size:12px;color:red;"> 아이디 혹은 비밀번호 오류입니다. </span>
       </c:if>
      </div>
      <div> <input type="submit" value="로그인" id="submit"> </div>
    </form>
  </section>
</body>
</html>