package com.example.demo.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginMapper mapper;

	@Override
	public String login()
	{
		
		return "/login/login";
	}

}
