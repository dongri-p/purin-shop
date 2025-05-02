<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /login/login.jsp -->
  <section>
    <h3 align="center"> 로그인 </h3>
    <form method="post" action="loginOk">
      <div> <input type="text" name="userid" placeholder="아이디"> </div>
      <div> <input type="password" name="pwd" placeholder="비밀번호"> </div>
      <div> <input type="submit" value="로그인" id="submit"> </div>
    </form>
  </section>
</body>
</html>