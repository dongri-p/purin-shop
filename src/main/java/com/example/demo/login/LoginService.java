package com.example.demo.login;

import com.example.demo.member.MemberDto;

import jakarta.servlet.http.HttpSession;

public interface LoginService {
	String login();
	String loginOk(MemberDto mdto, HttpSession session);
	String logout(HttpSession session);

}
