package com.example.demo.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@GetMapping("/member/member")
	public String member()
	{
		return service.member();
	}
	
	@GetMapping("/member/useridCheck")
	public @ResponseBody String useridCheck(HttpServletRequest request)
	{
		return service.useridCheck(request);
	}
	
	@PostMapping("/member/memberOk")
	public String memberOk(MemberDto mdto)
	{
		return service.memberOk(mdto);
	}
	

}
