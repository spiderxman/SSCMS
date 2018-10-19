package com.masago.service;

import java.util.List;

import com.masago.bean.EmpBaseBean;

public interface EmpInfoService {

    List<EmpBaseBean> getEmpInfo(String empId, String userName, String userRoot, String delFlag);
    
    String getMaxEmpId();
    
    void setEmpBase(EmpBaseBean empBaseBean);

}