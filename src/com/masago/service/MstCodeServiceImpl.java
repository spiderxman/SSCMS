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

import com.masago.bean.MstCodeBean;
import com.masago.mapper.MstCodeMapper;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("MstCodeService")
public class MstCodeServiceImpl implements MstCodeService{

    @Autowired
    private MstCodeMapper mstCodeMapper;
    /**
     * 
     */
    @Transactional(readOnly=true)
    public List<MstCodeBean> getMstCode(String codeGroup) {
        return mstCodeMapper.selectMstCode(codeGroup);
    }

}