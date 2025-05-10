package com.example.demo.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.member.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginMapper mapper;

	@Override
	public String login(HttpServletRequest request, Model model)
	{
		String err=request.getParameter("err");
		
		model.addAttribute("err", err);
		
		return "/login/login";
	}

	@Override
	public String loginOk(MemberDto mdto, HttpSession session)
	{
		// 세션변수를 어떤값으로 만들것인지 (아이디, 이름)
		String name=mapper.loginOk(mdto);
		
		if(name == null)
		{
			return "redirect:/login/login?err=1";
		}
		else
		{
			// 세션변수를 할당 후 메인페이지 이동
			session.setAttribute("userid", mdto.getUserid());
			session.setAttribute("name", name);
			
			return "redirect:/main/main";
		}
		
	}

	@Override
	public String logout(HttpSession session)
	{
		session.invalidate();
		
		return "redirect:/main/main";
	}

}
