package com.example.demo.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	public Integer useridCheck(String userid);
	public void memberOk(MemberDto mdto);
}
