package com.hp.register.model.dao;

import static com.hp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hp.lesson.model.vo.Lesson;
import com.hp.member.model.vo.Member;
import com.hp.register.model.vo.Register;
import com.hp.tutor.model.dao.TutorDao;

public class RegisterDao {
	
	private Properties prop = new Properties();
	
	public RegisterDao(){
		String filePath = TutorDao.class.getResource("/db/sql/register-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @author 예서
	 * @param memNo 튜터 회원번호
	 * @param status 예약 진행 상태
	 * @return 로그인한 튜터의 예약승인 페이지에 띄울 list
	 */
	public ArrayList<Register> selectTutorRegister(Connection conn, int memNo, String status){
		ArrayList<Register> rList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectTutorRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, "%" + status + "%");
			rset = pstmt.executeQuery();
			while(rset.next()) {
				rList.add(new Register(rset.getInt("reg_no"),
									  rset.getString("mem_name"),
									  rset.getString("cl_name"),
									  rset.getString("teach_date"),
									  rset.getString("reg_date"),
									  rset.getString("sch_time"),
									  rset.getString("reg_price"),
									  rset.getString("reg_sta")
									  ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return rList;
	}
	
	/**
	 * @author 예서
	 * @param regNo 선택한 예약번호
	 * @return 선택한 예약번호의 상세정보
	 */
	public Register selectDetailApproval(Connection conn, int regNo) {
		Register r = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectDetailApproval");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, regNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Register(rset.getInt("reg_no"),
								rset.getString("mem_name"),
								rset.getString("cl_name"),
								rset.getString("teach_date"),
								rset.getString("reg_date"),
								rset.getString("sch_time"),
								rset.getString("reg_price"),
								rset.getString("reg_count"),
								rset.getString("mem_phone"),
								rset.getString("mem_email"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
	/**
	 * @author 예서
	 * @param regSta 예약승인/신청반려
	 * @param regNo 예약번호
	 * @return 예약진행상태 update
	 */
	public int updateRegister(Connection conn, int regSta, int regNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, regSta);
			pstmt.setInt(2, regNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @author 예서
	 * @param l 신청한 클래스 정보
	 * @return 신청한 클래스 상세 정보
	 */
	public Lesson selectLessonRegister(Connection conn, Lesson l) {
		Lesson le = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectLessonRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, l.getClMax());
			pstmt.setInt(2, l.getClMax());
			pstmt.setInt(3, l.getClNo());
			pstmt.setString(4, l.getClSchedule());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				le = new Lesson(rset.getString("cl_name"),
						rset.getString("teach_date"),
						rset.getString("teach_time"),
						rset.getString("cl_price"),
						rset.getInt("people"),
						rset.getString("price"),
						rset.getString("cl_thumb"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return le;
		
	}
	
	/**
	 * @author 예서
	 * @param memNo 클래스 신청한 멤버번호
	 * @return 멤버의 개인정보
	 */
	public Member selectRegisterMem(Connection conn, int memNo) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectRegisterMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("mem_no"),
								rset.getString("mem_name"),
								rset.getString("mem_email"),
								rset.getString("mem_phone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}
	

	/**
	 * 마이클래스 수강내역부분 조회
	 * @author 수정
	 * @param conn
	 * @param memNo
	 * @return ArrayList<Register> list
	 */
	public ArrayList<Register> selectRegisterList(Connection conn, int memNo) {
		ArrayList<Register> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRegisterList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Register(
									  rset.getString("teach_date"),
									  rset.getInt("reg_no"),
									  rset.getString("reg_date"),
									  rset.getString("reg_pay"),
									  rset.getString("reg_price"),
									  rset.getString("reg_count"),
									  rset.getString("reg_sta"),
									  rset.getString("cl_thumb"),
									  rset.getString("cl_name"),
									  rset.getString("start_time"),
									  rset.getString("distr_name"),
									  rset.getString("tt_name")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
	}

	
}
