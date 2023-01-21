package com.hp.member.model.service;

import java.sql.Connection;

import static com.hp.common.JDBCTemplate.*;
import com.hp.member.model.dao.MemberDao;
import com.hp.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		return m;
	}
	
	
	
	
	
	
	
}
