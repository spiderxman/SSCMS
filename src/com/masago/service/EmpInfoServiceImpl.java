/**
 *
 */
/**
 * @author user
 *
 */
package com.masago.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.masago.bean.EmpBaseBean;
import com.masago.mapper.EmpInfoMapper;
import com.masago.service.EmpInfoService;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("EmpInfoService")
public class EmpInfoServiceImpl implements EmpInfoService{    //表示service层

    @Autowired
    private EmpInfoMapper empInfomapper;
    /**
     * 
     */
    @Transactional(readOnly=true)
    public List<EmpBaseBean> getEmpInfo(String empId, String userName, String userRoot, String delFlag) {
        return empInfomapper.selectEmpInfo(empId, userName, userRoot, delFlag);
    }
    @Transactional(readOnly=true)
    public String getMaxEmpId() {
        return empInfomapper.selectMaxEmpId();
    }
    /**
     * 
     */
    @Transactional
    public void setEmpBase(EmpBaseBean empBaseBean) {
    	empInfomapper.insertEmpBase(empBaseBean);
    }

}