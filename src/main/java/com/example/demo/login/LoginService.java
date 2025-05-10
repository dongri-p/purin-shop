package com.example.demo.login;

import org.springframework.ui.Model;

import com.example.demo.member.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface LoginService {
	String login(HttpServletRequest request, Model model);
	String loginOk(MemberDto mdto, HttpSession session);
	String logout(HttpSession session);

}
