/**
 * @author TANG
 *
 */
package com.masago.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.masago.bean.MstCodeBean;

public interface MstCodeMapper {
	List<MstCodeBean> selectMstCode(@Param("codeGroup") String codeGroup);
}