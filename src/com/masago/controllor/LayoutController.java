package com.masago.controllor;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LayoutController {    //用户控制器

	@RequestMapping("/TopBar")  //初期表示
    public ModelAndView topBar(HttpSession session){
    	ModelAndView mv = new ModelAndView();
        mv.setViewName("TopBar");
        return mv; //返回视图
    }
	
	@RequestMapping("/LeftMenu")  //初期表示
    public ModelAndView leftMenu(HttpSession session){
    	ModelAndView mv = new ModelAndView();
        mv.setViewName("LeftMenu");
        return mv; //返回视图
    }
	
	@RequestMapping("/Main")  //初期表示
    public ModelAndView showMain(HttpSession session){
    	ModelAndView mv = new ModelAndView();
        mv.setViewName("Main");
        return mv; //返回视图
    }

}