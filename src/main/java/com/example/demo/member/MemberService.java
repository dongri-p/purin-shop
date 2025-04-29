package com.example.demo.member;

import jakarta.servlet.http.HttpServletRequest;

public interface MemberService {
	public String member();
	public String useridCheck(HttpServletRequest request);
}
