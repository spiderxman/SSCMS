package com.masago.controllor;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.masago.bean.EmpBaseBean;
import com.masago.common.CmnConsts;

@Controller
public class MainFrameController {

	@RequestMapping("/MainFrame")  //初期表示
    public ModelAndView Init(HttpSession session){
    	ModelAndView mv = new ModelAndView();
    	EmpBaseBean empInfoBean = (EmpBaseBean)session.getAttribute(CmnConsts.SES_EMP_INFO);
    	mv.addObject("userName", empInfoBean.getEmpId());
        mv.setViewName("MainFrame"); //重新设置view视图页面
        return mv; //返回视图
    }


}