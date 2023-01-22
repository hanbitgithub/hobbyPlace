package com.hp.lesson.model.vo;

import java.sql.Clob;
import java.sql.Date;

import oracle.sql.CLOB;

public class Lesson {
	
	private int clNo;
	private String ctNo;
	private String ctDno;
	private String memNo;
	private String localCode;
	private String distrCode;
	private String clName;
	private String clAddress;
	private int clMax;
	private String clLevel;
	private String startDate;
	private String endDate;
	private int clTimes;
	private String clSchedule;
	private String clDay;
	private String clPrice;
	private CLOB clDetail;
	private String curriculum;
	private String refundPolicy;
	private String clSupplies;
	private String keyword;
	private Date enrollDate;
	private Date updateDate;
	private String clStatus;
	private int clCount;
	private String clRefuse;
	private String clThumb;
	private int clStarAvg;
	private int clStarCount;
	
	public Lesson() {}

	
	
	public Lesson(int clNo, String ctNo, String ctDno, String memNo, String localCode, String distrCode, String clName,
			String clAddress, int clMax, String clLevel, String startDate, String endDate, int clTimes,
			String clSchedule, String clDay, String clPrice, Clob clDetail, String curriculum, String refundPolicy,
			String clSupplies, String keyword, Date enrollDate, String clStatus, String clThumb) {
		super();
		this.clNo = clNo;
		this.ctNo = ctNo;
		this.ctDno = ctDno;
		this.memNo = memNo;
		this.localCode = localCode;
		this.distrCode = distrCode;
		this.clName = clName;
		this.clAddress = clAddress;
		this.clMax = clMax;
		this.clLevel = clLevel;
		this.startDate = startDate;
		this.endDate = endDate;
		this.clTimes = clTimes;
		this.clSchedule = clSchedule;
		this.clDay = clDay;
		this.clPrice = clPrice;
		this.clDetail = (CLOB) clDetail;
		this.curriculum = curriculum;
		this.refundPolicy = refundPolicy;
		this.clSupplies = clSupplies;
		this.keyword = keyword;
		this.enrollDate = enrollDate;
		this.clStatus = clStatus;
		this.clThumb = clThumb;
	}



	public Lesson(int clNo, String ctNo, String memNo, String clName, Date enrollDate, String clStatus) {
		super();
		this.clNo = clNo;
		this.ctNo = ctNo;
		this.memNo = memNo;
		this.clName = clName;
		this.enrollDate = enrollDate;
		this.clStatus = clStatus;
	}



	public Lesson(int clNo, String ctNo, String ctDno, String memNo, String localCode, String distrCode, String clName,
			String clAddress, int clMax, String clLevel, String startDate, String endDate, int clTimes,
			String clSchedule, String clDay, String clPrice, CLOB clDetail, String curriculum, String refundPolicy,
			String clSupplies, String keyword, Date enrollDate, Date updateDate, String clStatus, int clCount,
			String clRefuse, String clThumb) {
		super();
		this.clNo = clNo;
		this.ctNo = ctNo;
		this.ctDno = ctDno;
		this.memNo = memNo;
		this.localCode = localCode;
		this.distrCode = distrCode;
		this.clName = clName;
		this.clAddress = clAddress;
		this.clMax = clMax;
		this.clLevel = clLevel;
		this.startDate = startDate;
		this.endDate = endDate;
		this.clTimes = clTimes;
		this.clSchedule = clSchedule;
		this.clDay = clDay;
		this.clPrice = clPrice;
		this.clDetail = clDetail;
		this.curriculum = curriculum;
		this.refundPolicy = refundPolicy;
		this.clSupplies = clSupplies;
		this.keyword = keyword;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
		this.clStatus = clStatus;
		this.clCount = clCount;
		this.clRefuse = clRefuse;
		this.clThumb = clThumb;
	}
	



	public Lesson(int clNo, String localCode, String distrCode, String clName, String clPrice, String clThumb,
			int clStarAvg, int clStarCount) {
		super();
		this.clNo = clNo;
		this.localCode = localCode;
		this.distrCode = distrCode;
		this.clName = clName;
		this.clPrice = clPrice;
		this.clThumb = clThumb;
		this.clStarAvg = clStarAvg;
		this.clStarCount = clStarCount;
	}

	public int getClNo() {
		return clNo;
	}

	public void setClNo(int clNo) {
		this.clNo = clNo;
	}

	public String getCtNo() {
		return ctNo;
	}

	public void setCtNo(String ctNo) {
		this.ctNo = ctNo;
	}

	public String getCtDno() {
		return ctDno;
	}

	public void setCtDno(String ctDno) {
		this.ctDno = ctDno;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getLocalCode() {
		return localCode;
	}

	public void setLocalCode(String localCode) {
		this.localCode = localCode;
	}

	public String getDistrCode() {
		return distrCode;
	}

	public void setDistrCode(String distrCode) {
		this.distrCode = distrCode;
	}

	public String getClName() {
		return clName;
	}

	public void setClName(String clName) {
		this.clName = clName;
	}

	public String getClAddress() {
		return clAddress;
	}

	public void setClAddress(String clAddress) {
		this.clAddress = clAddress;
	}

	public int getClMax() {
		return clMax;
	}

	public void setClMax(int clMax) {
		this.clMax = clMax;
	}

	public String getClLevel() {
		return clLevel;
	}

	public void setClLevel(String clLevel) {
		this.clLevel = clLevel;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getClTimes() {
		return clTimes;
	}

	public void setClTimes(int clTimes) {
		this.clTimes = clTimes;
	}

	public String getClSchedule() {
		return clSchedule;
	}

	public void setClSchedule(String clSchedule) {
		this.clSchedule = clSchedule;
	}

	public String getClDay() {
		return clDay;
	}

	public void setClDay(String clDay) {
		this.clDay = clDay;
	}

	public String getClPrice() {
		return clPrice;
	}

	public void setClPrice(String clPrice) {
		this.clPrice = clPrice;
	}

	public CLOB getClDetail() {
		return clDetail;
	}

	public void setClDetail(CLOB clDetail) {
		this.clDetail = clDetail;
	}

	public String getCurriculum() {
		return curriculum;
	}

	public void setCurriculum(String curriculum) {
		this.curriculum = curriculum;
	}

	public String getRefundPolicy() {
		return refundPolicy;
	}

	public void setRefundPolicy(String refundPolicy) {
		this.refundPolicy = refundPolicy;
	}

	public String getClSupplies() {
		return clSupplies;
	}

	public void setClSupplies(String clSupplies) {
		this.clSupplies = clSupplies;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getClStatus() {
		return clStatus;
	}

	public void setClStatus(String clStatus) {
		this.clStatus = clStatus;
	}

	public int getClCount() {
		return clCount;
	}

	public void setClCount(int clCount) {
		this.clCount = clCount;
	}

	public String getClRefuse() {
		return clRefuse;
	}

	public void setClRefuse(String clRefuse) {
		this.clRefuse = clRefuse;
	}

	public String getClThumb() {
		return clThumb;
	}

	public void setClThumb(String clThumb) {
		this.clThumb = clThumb;
	}

	public int getClStarAvg() {
		return clStarAvg;
	}



	public void setClStarAvg(int clStarAvg) {
		this.clStarAvg = clStarAvg;
	}



	public int getClStarCount() {
		return clStarCount;
	}



	public void setClStarCount(int clStarCount) {
		this.clStarCount = clStarCount;
	}



	@Override
	public String toString() {
		return "Lesson [clNo=" + clNo + ", ctNo=" + ctNo + ", ctDno=" + ctDno + ", memNo=" + memNo + ", localCode="
				+ localCode + ", distrCode=" + distrCode + ", clName=" + clName + ", clAddress=" + clAddress
				+ ", clMax=" + clMax + ", clLevel=" + clLevel + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", clTimes=" + clTimes + ", clSchedule=" + clSchedule + ", clDay=" + clDay + ", clPrice=" + clPrice
				+ ", clDetail=" + clDetail + ", curriculum=" + curriculum + ", refundPolicy=" + refundPolicy
				+ ", clSupplies=" + clSupplies + ", keyword=" + keyword + ", enrollDate=" + enrollDate + ", updateDate="
				+ updateDate + ", clStatus=" + clStatus + ", clCount=" + clCount + ", clRefuse=" + clRefuse
				+ ", clThumb=" + clThumb + "]";
	}
	
	
	
	
}
	