/**
 * @author masago Tang
 *
 */
package com.masago.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class EmpTechBean {

	
	private String creater;
	private Date createDate;
	private String updater;
	private Date updateDate;
    
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

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