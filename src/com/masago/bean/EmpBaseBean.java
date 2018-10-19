/**
 * @author masago Tang
 *
 */
package com.masago.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class EmpBaseBean {

	private String empId;
	private Integer hisNo;
	private String empFirstName;
	private String empLastName;
	private String empNameKana;
	private String empNickName;
	private String password;
	private String authority;
	private String sex;
	private String birthday;
	private String country;
	private String address;
	private String station;
	private String tel;
	private String mail;
	private String school;
	private String education;
	private String major;
	private String graduateDate;
	private String immigrationStatus;
	private String language1;
	private String level1;
	private String language2;
	private String level2;
	private String certificate;
	private String employeeType;
	private String position;
	private String workingStatus;
	private String companyStartDate;
	private String companyEndDate;
	private String officeName;
	private String officeAddress;
	private String officeStartDate;
	private String officeEndDate;
	private String delFlg;
	private String creater;
	private Date createDate;
	private String updater;
	private Date updateDate;
    
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public Integer getHisNo() {
		return hisNo;
	}
	public void setHisNo(Integer hisNo) {
		this.hisNo = hisNo;
	}
	public String getEmpFirstName() {
		return empFirstName;
	}
	public void setEmpFirstName(String empFirstName) {
		this.empFirstName = empFirstName;
	}
	public String getEmpLastName() {
		return empLastName;
	}
	public void setEmpLastName(String empLastName) {
		this.empLastName = empLastName;
	}
	public String getEmpNameKana() {
		return empNameKana;
	}
	public void setEmpNameKana(String empNameKana) {
		this.empNameKana = empNameKana;
	}
	public String getEmpNickName() {
		return empNickName;
	}
	public void setEmpNickName(String empNickName) {
		this.empNickName = empNickName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStation() {
		return station;
	}
	public void setStation(String station) {
		this.station = station;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getGraduateDate() {
		return graduateDate;
	}
	public void setGraduateDate(String graduateDate) {
		this.graduateDate = graduateDate;
	}
	public String getImmigrationStatus() {
		return immigrationStatus;
	}
	public void setImmigrationStatus(String immigrationStatus) {
		this.immigrationStatus = immigrationStatus;
	}
	public String getLanguage1() {
		return language1;
	}
	public void setLanguage1(String language1) {
		this.language1 = language1;
	}
	public String getLevel1() {
		return level1;
	}
	public void setLevel1(String level1) {
		this.level1 = level1;
	}
	public String getLanguage2() {
		return language2;
	}
	public void setLanguage2(String language2) {
		this.language2 = language2;
	}
	public String getLevel2() {
		return level2;
	}
	public void setLevel2(String level2) {
		this.level2 = level2;
	}
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getEmployeeType() {
		return employeeType;
	}
	public void setEmployeeType(String employeeType) {
		this.employeeType = employeeType;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getWorkingStatus() {
		return workingStatus;
	}
	public void setWorkingStatus(String workingStatus) {
		this.workingStatus = workingStatus;
	}
	public String getCompanyStartDate() {
		return companyStartDate;
	}
	public void setCompanyStartDate(String companyStartDate) {
		this.companyStartDate = companyStartDate;
	}
	public String getCompanyEndDate() {
		return companyEndDate;
	}
	public void setCompanyEndDate(String companyEndDate) {
		this.companyEndDate = companyEndDate;
	}
	public String getOfficeName() {
		return officeName;
	}
	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}
	public String getOfficeAddress() {
		return officeAddress;
	}
	public void setOfficeAddress(String officeAddress) {
		this.officeAddress = officeAddress;
	}
	public String getOfficeStartDate() {
		return officeStartDate;
	}
	public void setOfficeStartDate(String officeStartDate) {
		this.officeStartDate = officeStartDate;
	}
	public String getOfficeEndDate() {
		return officeEndDate;
	}
	public void setOfficeEndDate(String officeEndDate) {
		this.officeEndDate = officeEndDate;
	}
	public String getDelFlg() {
		return delFlg;
	}
	public void setDelFlg(String delFlg) {
		this.delFlg = delFlg;
	}
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public String getUpdater() {
		return updater;
	}
	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public String getCreateDate() {
		String dateString = sdf.format(createDate);
		return dateString;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUpdateDate() {
		String dateString = sdf.format(updateDate);
		return dateString;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
}