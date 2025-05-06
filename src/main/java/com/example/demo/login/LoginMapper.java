package com.example.demo.login;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.member.MemberDto;

@Mapper
public interface LoginMapper {
	public String loginOk(MemberDto mdto);
}
