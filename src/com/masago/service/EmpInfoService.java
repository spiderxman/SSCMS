package com.masago.service;

import java.util.List;

import com.masago.bean.EmpBaseBean;
import com.masago.bean.EmpTechBean;

public interface EmpInfoService {

    List<EmpBaseBean> getEmpInfo(String empId, String userName, String userRoot, String delFlag);
    
    String getMaxEmpId();
    
    void addEmpBase(EmpBaseBean empBaseBean);
    
    void addEmpTech(EmpTechBean empTechBean);

}