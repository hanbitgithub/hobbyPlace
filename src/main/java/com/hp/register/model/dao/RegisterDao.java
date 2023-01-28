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
	
	public ArrayList<Register> selectTutorNewRegister(Connection conn, int memNo, int num){
		ArrayList<Register> nList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectTutorNewRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, num);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				nList.add(new Register(rset.getInt("reg_no"),
									  rset.getString("mem_name"),
									  rset.getString("cl_name"),
									  rset.getString("teach_date"),
									  rset.getString("reg_date"),
									  rset.getString("sch_time"),
									  rset.getString("reg_price"),
									  rset.getString("reg_count"),
									  rset.getString("reg_sta"),
									  rset.getString("reg_cal")									  
									  ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return nList;
	}
	
	public ArrayList<Register> selectTutorFinRegister(Connection conn, int memNo){
		ArrayList<Register> fList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectTutorFinRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				fList.add(new Register(rset.getInt("reg_no"),
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
		return fList;
	}
	
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

}
