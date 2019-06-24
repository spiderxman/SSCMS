/**
@author masago TANG
 */
package com.masago.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.masago.bean.EmpBaseBean;
import com.masago.bean.EmpTechBean;

public interface EmpInfoMapper {
	List<EmpBaseBean> selectEmpInfo(
			@Param("empId") String empId
			,@Param("empName") String empName
			,@Param("workingStatus") String workingStatus
			,@Param("delFlag") String delFlag
			);
	
	String selectMaxEmpId();
	
	void insertEmpBase(@Param("empBaseBean") EmpBaseBean empBaseBean);
	
	int insertEmpTech(EmpTechBean empTechBean);
}