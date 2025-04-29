package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.WebUtils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@Controller
//@ResponseBody
@RestController
public class CookieController {
	
	@GetMapping("/firstCookie")
	public String firstCookie(HttpServletResponse response)
	{
		try
		{
			// x눌렀다는 표시로 쿠키변수를 생성
			Cookie cookie=new Cookie("fcook", "1");
			cookie.setMaxAge(600);
			cookie.setPath("/");  // 쿠키의 경로 => member,login 이런데서도 이용할 수 있게
			response.addCookie(cookie);
			
			return "1";
		}
		catch(Exception e)
		{
			return "0";
		}
	}
	
	@GetMapping("/fcookOk")
	public String fcookOk(HttpServletRequest request)
	{
		Cookie cookie=WebUtils.getCookie(request, "fcook");
		
		if(cookie == null)
		{
			return "0";
		}
		else
		{
			return "1";
		}
	}

}
