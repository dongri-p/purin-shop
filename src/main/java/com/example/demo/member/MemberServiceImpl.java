package com.example.demo.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public String member()
	{
		return "/member/member";
	}

	@Override
	public String useridCheck(HttpServletRequest request)
	{	
		String userid=request.getParameter("userid");
		
		return mapper.useridCheck(userid).toString();
	}
	
	@Override
	public String memberOk(MemberDto mdto)
	{
		mapper.memberOk(mdto);
		
		return "redirect:/login/login";
	}
	
}











