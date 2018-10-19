package com.masago.service;

import java.util.List;

import com.masago.bean.MstCodeBean;

public interface MstCodeService {

    List<MstCodeBean> getMstCode(String codeGroup);

}