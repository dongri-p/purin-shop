package com.example.demo.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.member.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	@Autowired
	@Qualifier("ls")
	private LoginService service;
	
	@GetMapping("/login/login")
	public String login(HttpServletRequest request, Model model)
	{
		return service.login(request, model);
	}
	
	@PostMapping("/login/loginOk")
	public String loginOk(MemberDto mdto, HttpSession session)
	{
		return service.loginOk(mdto, session);
	}
	
	@GetMapping("/login/logout")
	public String logout(HttpSession session)
	{
		return service.logout(session);
	}

}
