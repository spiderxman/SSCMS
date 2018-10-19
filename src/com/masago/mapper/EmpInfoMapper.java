/**
@author masago TANG
 */
package com.masago.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.masago.bean.EmpBaseBean;

public interface EmpInfoMapper {
	List<EmpBaseBean> selectEmpInfo(
			@Param("empId") String empId
			,@Param("userName") String userName
			,@Param("authority") String authority
			,@Param("delFlag") String delFlag
			);
	
	String selectMaxEmpId();
	
	void insertEmpBase(@Param("empBaseBean") EmpBaseBean empBaseBean);
}