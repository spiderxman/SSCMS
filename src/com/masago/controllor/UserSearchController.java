package com.masago.controllor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.masago.bean.EmpBaseBean;
import com.masago.bean.MstCodeBean;
import com.masago.common.PropertiesFileLoader;
import com.masago.service.EmpInfoService;
import com.masago.service.MstCodeService;

import net.sf.json.JSONArray;

@Controller
public class UserSearchController {

    @Autowired
    @Qualifier("EmpInfoService")
    private EmpInfoService userInfoService;
    
    @Autowired
    private MstCodeService mstCodeService; //权限表数据取得

    @RequestMapping("/UserSearchInit")  //初期表示
    public ModelAndView init(HttpSession session){
    	ModelAndView mv = new ModelAndView();
    	
    	List<MstCodeBean> authorityCodeList = mstCodeService.getMstCode("Authority");
    	mv.addObject("authorityCodeList", authorityCodeList);
        mv.setViewName("User/UserSearch");
        return mv; //返回视图
    }
    
    @RequestMapping(value="/UserSearch",method= {RequestMethod.POST})  //初期表示
    public ModelAndView userSearch(String userId, String userName, String authorityCd, String delFlag, HttpSession session){
    	ModelAndView mv = new ModelAndView();
    	//删除checkbox选中
    	if("on".equals(delFlag)) {
    		delFlag = null;
    	}else {
    		delFlag = "0";
    	}
    	List<EmpBaseBean> userInfoList = userInfoService.getEmpInfo(userId, userName, authorityCd, delFlag);
    	if(userInfoList.size()==0) {
    		mv.addObject("errorMessage", PropertiesFileLoader.getProperty("MSG_E004"));
    	}
    	mv.addObject("userInfoList", userInfoList);
        mv.setViewName("User/UserSearch"); //重新设置view视图页面
        return mv; //返回视图
    }
    
    @RequestMapping(value="/UserSearchByAjax",method= {RequestMethod.POST})  //初期表示
    @ResponseBody
    public JSONArray userSearchByAjax(HttpServletRequest request, HttpServletResponse response){
   	
    	String userId = request.getParameter("userId");
    	String userName = request.getParameter("userName");
    	String userRoot = request.getParameter("authorityCd");
    	String delFlag = request.getParameter("delFlag");
    	
    	//删除checkbox选中
    	if("on".equals(delFlag)) {
    		delFlag = null;
    	}else {
    		delFlag = "0";
    	}
    	List<EmpBaseBean> userInfoList = userInfoService.getEmpInfo(userId, userName, userRoot, delFlag);
    	JSONArray jsonArray = JSONArray.fromObject(userInfoList);
        return jsonArray; //返回视图
    }
}