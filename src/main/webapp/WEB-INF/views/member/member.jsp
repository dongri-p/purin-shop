<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    section {
      width:1100px;
      margin:auto;
      text-align:center;
    }
    section div {
      margin-top:10px;
    }
    section h3 {
      text-align:center;
      color:#333;
      font-size:22px;
      margin-bottom:25px;
    }
    section input, select {
      border:1px solid #ccc;
      border-radius:4px;
      margin:3px 0;
      font-size:14px;
    }
    #txt {
      width:420px;
      height:42px;
    }
    #email {
      width:130px;
      height:42px;
    }
    #select {
      width:132px;
      height:47px;
    }
    #submit {
      width:428px;
      height:46px;
      background:#f8d0d9;
      border:none;
      color:black;
      cursor:pointer;
    }
    #submit:hover {
      background-color:#ec048c;
      color:white;
    }
    #umsg, #pmsg {
      font-size:12px;
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
    	오후
    }
    
    var uchk=0;  // 중복 확인 완료(중복X) => 1
    var pchk=0;
    function check()  // return으로 처리할 경우 true, return이 없거나, 자바스크립트 오류이거나 할 경우 => 전송 
    {	
    	if(uchk == 0) // 중복체크가 되었는지 검사
    	{
    		alert("아이디를 확인하세요.")
    		return false;
    	}
    	else if(pchk == 0)
    		{
    			alert("비밀번호를 확인하세요.")
    			return false;
    		}
    		else if(document.mform.name.value == "")
    			{
					alert("이름을 확인하세요.")
					return false;
				}
    			else if(document.mform.phone.value.length == 0)
    				{
    					alert("전화번호를 확인하세요.")
						return false;
					}
    				else
        			{
    					return true;
    				}
    }
  </script>
</head>
<body> <!-- /member/member.jsp -->
 <section>
    <form method="post" name="mform" action="memberOk" onsubmit="return check()">
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
      <div>
        <input type="text" name="uid" id="email">@<input type="text" name="server" id="email">
        <select name="deserver" id="select">
          <option value=""> 직접입력 </option>
          <option value="naver.com"> naver.com </option>
          <option value="daum.net"> daum.net </option>
          <option value="gmail.com"> gmail.com </option>
          <option value="kakao.com"> kakao.com </option>
        </select>
      </div>
      <div> <input type="text" name="phone" id="txt" placeholder="전화번호"> </div>
      <div> <input type="submit" value="회원 가입" id="submit"> </div>
    </form>
 </section>
</body>
</html>