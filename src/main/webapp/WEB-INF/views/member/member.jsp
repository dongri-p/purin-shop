<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
  
    .msection {
      font-family:'Jua', sans-serif;
      background:#ffffff;
      max-width:480px;
      margin:60px auto;
      padding:40px 30px;
      border-radius:25px;
      box-shadow:0 10px 30px rgba(0, 0, 0, 0.1);
      text-align:center;
      position:relative;
      overflow:hidden;
    }
    .msection h3 {
      font-size:30px;
      color:#ec048c;
      margin-bottom:40px;
      margin-top:15px;
    }
    .msection input[type="text"],
    .msection input[type="password"],
    .msection select {
      width:100%;
      height:46px;
      padding:10px 14px;
      margin-top:14px;
      font-size:15px;
      border:2px solid #f8d0d9;
      border-radius:12px;
      box-sizing:border-box;
      background:#fffafc;
      transition:all 0.3s ease;
    }
    .msection input:focus,
    .msection select:focus {
      border-color: #ec048c;
      outline: none;
    }
	.msection .cemail {
      display:flex;
      align-items:center;
      gap:6px;
    }
    .msection .cemail input, .cemail select {
      height:46px;
      padding:10px 14px;
      font-size:15px;
      border:2px solid #f8d0d9;
      border-radius:12px;
      background:#fffafc;
      box-sizing:border-box;
    }
    .msection input[type="submit"],
    .msection input[type="button"] {
      width:48%;
      height:48px;
      margin-top:24px;
      border:none;
      border-radius:12px;
      font-size:16px;
      font-weight:bold;
      cursor:pointer;
      transition:0.3s ease;
    }
    #submit {
      background:#f8d0d9;
      color:black;
    }
    #submit:hover {
      background-color:#ec048c;
      color:white;
    }
    #btn {
      background-color:#eeeeee;
    }
    #btn:hover {
      background-color:#cccccc;
    }
    .msection span {
      font-size:15px;
      display:block;
      margin-top:5px;
    }
    #umsg, #pmsg {
      font-weight:bold;
    }
  </style>
  <script>
    function useridCheck(userid)
    {
    	userid=userid.trim();
    	
    	if(userid.length >= 6)
		{
    		var chk=new XMLHttpRequest();
    		chk.onload=function()
    		{
    			if(chk.responseText == "0")
    			{
    				document.getElementById("umsg").innerText="사용 가능한 아이디입니다.";
    				document.getElementById("umsg").style.color="blue";
    				uchk=1;
    			}
    			else
    			{
    				document.getElementById("umsg").innerText="사용 중인 아이디입니다.";
    				document.getElementById("umsg").style.color="red";
    				uchk=0;
    			}
    		}
    		chk.open("get", "useridCheck?userid="+userid);
    		chk.send();
		}
    	else
    	{
    		document.getElementById("umsg").innerText="아이디는 6자 이상입니다.";
    		document.getElementById("umsg").style.color="red";
    		uchk=0;
    	}
    }
    function pwdCheck()
    {
    	var pwd=document.mform.pwd.value;
    	var pwd2=document.mform.pwd2.value;
    	
    	if(pwd2.length != 0)  // 첫번째 비번 입력시에는 동작하지 않기 => 두번째 비밀번호가 없을 때
    	{
    		if(pwd == pwd2)
        	{
        		document.getElementById("pmsg").innerText="비밀번호가 일치합니다";
        		document.getElementById("pmsg").style.color="blue";
        		pchk=1;
        	}
        	else
        	{
        		document.getElementById("pmsg").innerText="비밀번호가 일치하지 않습니다";
        		document.getElementById("pmsg").style.color="red";
        		pchk=0;
        	}
    	}
    }
    
    var uchk=0;  // 중복 확인 완료(중복X) => 1
    var pchk=0;
    function check()  // return으로 처리할 경우 true, return이 없거나, 자바스크립트 오류이거나 할 경우 => 전송 
    {	
    	if(uchk == 0) // 중복체크가 되었는지 검사
    	{
    		alert("아이디를 확인하세요.");
    		return false;
    	}
    	else if(pchk == 0)
    		{
    			alert("비밀번호를 확인하세요.");
    			return false;
    		}
    		else if(document.mform.name.value == "")
    			{
					alert("이름을 확인하세요.");
					return false;
				}
    			else if(document.mform.phone.value.length == 0)
    				{
    					alert("전화번호를 확인하세요.");
						return false;
					}
    	else
        {
    	    // 이메일의 아이디와 서버주소를 합쳐서 하나의 input태그에 전달
            var emailOk=document.mform.uid.value+"@"+document.mform.server.value;
    		document.mform.email.value=emailOk;
    		return true;
    	}
    }
    
    function getServer(my)
    {
		const serverInput=document.getElementById("server");
		
		if(my.value == "self")
		{
			serverInput.removeAttribute("readonly");
			serverInput.value="";
			serverInput.focus();
		}
		else
		{
			serverInput.value=my.value;
			serverInput.setAttribute("readonly", true);
		}
	}
  </script>
</head>
<body> <!-- /member/member.jsp -->
 <section class="msection">
    <form method="post" name="mform" action="memberOk" onsubmit="return check()">
      <input type="hidden" name="email">
      <h3> 회원 가입 </h3>
      <div>
        <input type="text" name="userid" id="txt" placeholder="아이디(6자 이상)" onblur="useridCheck(this.value)">
        <br> <span id="umsg"> </span>
      </div>
      <div> <input type="text" name="name" id="txt" placeholder="이 름"> </div>
      <div> <input type="password" name="pwd" id="txt" placeholder="비밀번호" onkeyup="pwdCheck()"> </div>
      <div>
        <input type="password" name="pwd2" id="txt" placeholder="비밀번호 확인" onkeyup="pwdCheck()">
        <br> <span id="pmsg"> </span>
      </div>
      <div class="cemail">
        <input type="text" name="uid" id="uid"> @
        <input type="text" name="server" id="server" placeholder="도메인" readonly>
        <select name="dserver" id="select" onchange="getServer(this)">
          <option value=""> 선택하기 </option>
          <option value="naver.com"> naver.com </option>
          <option value="daum.net"> daum.net </option>
          <option value="gmail.com"> gmail.com </option>
          <option value="kakao.com"> kakao.com </option>
          <option value="self"> 직접입력 </option>
        </select>
      </div>
      <div> <input type="text" name="phone" id="txt" placeholder="전화번호"> </div>
      <div>
        <input type="button" value="취 소" id="btn" onclick="location='../main/main'">
        <input type="submit" value="회원 가입" id="submit">
      </div>
    </form>
 </section>
</body>
</html>