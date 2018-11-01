package com.masago.controllor;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.masago.bean.EmpBaseBean;
import com.masago.bean.EmpTechBean;
import com.masago.bean.MstCodeBean;
import com.masago.service.EmpInfoService;
import com.masago.service.MstCodeService;

import net.sf.json.JSONArray;

@Controller
public class EmpInfoController {

    @Autowired
    @Qualifier("EmpInfoService")
    private EmpInfoService empInfoService;
    
    @Autowired
    private MstCodeService mstCodeService; //コード値取得

    /**
     * 社員基本初期表示
     * @param mv
     * @param msg
     * @return
     */
    @RequestMapping("/EmpBaseAddInit")
    public ModelAndView empBaseAddInit(ModelAndView mv, @ModelAttribute("errorMessage") String msg, HttpSession session){
    	// 最大社員ID取得
    	String maxEmpId = empInfoService.getMaxEmpId();
    	String empId = String.valueOf(Integer.valueOf(maxEmpId) + 1);
    	//権限取得
    	List<MstCodeBean> authorityCodeList = mstCodeService.getMstCode("Authority");
    	//最終学歴取得
    	List<MstCodeBean> educationCodeList = mstCodeService.getMstCode("Education");
    	//在留資格取得
    	List<MstCodeBean> immigrationStatusCodeList = mstCodeService.getMstCode("ImmigrationStatus");
    	//社員種別取得
    	List<MstCodeBean> employeeTypeCodeList = mstCodeService.getMstCode("EmployeeType");
    	//社内役割取得
    	List<MstCodeBean> positionCodeList = mstCodeService.getMstCode("Position");
    	//仕事状態取得
    	List<MstCodeBean> workingStatusCodeList = mstCodeService.getMstCode("WorkingStatus");

    	mv.addObject("empId", empId);
    	mv.addObject("authorityCodeList", authorityCodeList);
    	mv.addObject("educationCodeList", educationCodeList);
    	mv.addObject("immigrationStatusCodeList", immigrationStatusCodeList);
    	mv.addObject("employeeTypeCodeList", employeeTypeCodeList);
    	mv.addObject("positionCodeList", positionCodeList);
    	mv.addObject("workingStatusCodeList", workingStatusCodeList);
        mv.setViewName("Emp/EmpBaseAdd"); //重新设置view视图页面
//        mv.addObject("errorMessage", msg);
        return mv;
    }
    
    @InitBinder("empBaseBean")
    public void empBaseBeanBinder(WebDataBinder webDataBinder) {
    	webDataBinder.setFieldDefaultPrefix("empBaseBean.");
    }
    
    @InitBinder("empTechBean")
    public void empTechBeanBinder(WebDataBinder webDataBinder) {
    	webDataBinder.setFieldDefaultPrefix("empTechBean.");
    }
    /**
     * 社員情報登録
     * @param empInfoAdd
     * @param mv
     * @return
     */
    @RequestMapping("/EmpBaseAdd")
    public String empBaseAdd(EmpBaseBean empBaseBean, EmpTechBean empTechBean, Model mv){
    	empBaseBean.setHisNo(1);
    	empBaseBean.setDelFlg("0");
    	empBaseBean.setBirthday(empBaseBean.getBirthday().replace("/", ""));
    	empInfoService.addEmpBase(empBaseBean);
    	
    	empTechBean.setEmpId(empBaseBean.getEmpId());
    	empInfoService.addEmpTech(empTechBean);
//    	mv.addAttribute("errorMessage", PropertiesFileLoader.getProperty("MSG_E003"));
        return "redirect:/EmpBaseAddInit";
    }
    
    /**
     * ユーザ存在チェック
     * @param userId
     * @return
     */
    @RequestMapping(value ="/CheckUserIdExists", method = RequestMethod.POST)
    @ResponseBody
    public JSONArray checkUserIdExists(String userId){
    	List<EmpBaseBean> userInfoList = empInfoService.getEmpInfo(userId, "", "", "");
    	JSONArray jsonArray = JSONArray.fromObject(userInfoList);
        return jsonArray; //返回视图
    }
}