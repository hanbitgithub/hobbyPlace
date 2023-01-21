package com.hp.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.hp.common.JDBCTemplate.*;

import com.hp.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao(){
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @param 수연
	 * @return conn, Member m
	 */
	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member m = new Member();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("mem_no"),
						       rset.getString("mem_id"),
						       rset.getString("mem_pwd"),
						       rset.getString("mem_name"),
						       rset.getString("mem_nickname"),
						       rset.getString("mem_email"),
						       rset.getString("mem_phone"),
						       rset.getInt("mem_post"),
						       rset.getString("mem_addr"),
						       rset.getString("gender"),
						       rset.getString("mem_birth"),
						       rset.getString("mem_profile"),
						       rset.getString("interest"),
						       rset.getString("grade"),
						       rset.getDate("enroll_date"),
						       rset.getDate("mem_update"),
						       rset.getString("mem_status"),
						       rset.getString("mem_drop"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}
	
	
	
	
	
	
	
	
	

}
