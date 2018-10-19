package com.masago.controllor;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.masago.bean.EmpBaseBean;
import com.masago.common.CmnConsts;
import com.masago.common.CmnLogger;
import com.masago.common.PropertiesFileLoader;
import com.masago.service.EmpInfoService;

@Controller
public class LoginController {
	//Loggerインスタンス
	private static CmnLogger logger = new CmnLogger();
		
    @Autowired
    @Qualifier("EmpInfoService")
    private EmpInfoService empInfoService;

    @RequestMapping("/Login")
    public ModelAndView login(String empId, String password, String req_gid, ModelAndView mv, HttpSession session){
    	logger.info("★★★★★★login start★★★★★★");
    	if(StringUtils.isEmpty(req_gid)) {
    		session.removeAttribute(CmnConsts.SES_EMP_INFO);
    		mv.setViewName("Login");
    		return mv;
    	}
    	List<EmpBaseBean> empInfoList = empInfoService.getEmpInfo(empId, null, null, null);

        if (empInfoList != null && empInfoList.size() > 0) {
        	EmpBaseBean empInfoBean = empInfoList.get(0);
//        	if(password.equals(Base64Utils.base64Decode(empInfoBean.getPassword()))){
        	if(password.equals(empInfoBean.getPassword())){
				//パスワード一致
        		session.setAttribute(CmnConsts.SES_EMP_INFO, empInfoBean);
        		//重定向
                mv.setView(new RedirectView("MainFrame"));
			}else{
				//パスワードの不一致
				mv.addObject("message", PropertiesFileLoader.getProperty("MSG_E001"));
	            mv.setViewName("Login");
			}
        }else {
            mv.addObject("message", PropertiesFileLoader.getProperty("MSG_E002"));
            mv.setViewName("Login");
        }
        try {
			Thread.sleep(200);
        }catch(Exception ex) {
        	//
        }
        
        return mv;
    }
}