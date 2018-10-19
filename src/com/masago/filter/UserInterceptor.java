/**
 * 
 */
/**
 * @author Tang
 *
 */
package com.masago.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.masago.common.CmnConsts;
/**
 * 用户登录拦截器
 * 所有非登录url请求将直接跳转至登录页面
 * @author Tang
 *
 */
public class UserInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String url = request.getRequestURI();

		if (StringUtils.isNotBlank(url) && url.toLowerCase().indexOf("login") < 0
				&& url.toLowerCase().indexOf("validata") < 0) {
			if (null == request.getSession().getAttribute(CmnConsts.SES_EMP_INFO)) {
				String localUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
						+ request.getContextPath() + "/";
				response.sendRedirect(localUrl + "Login");
				return false;
			} else {
				return true;
			}
		}
		return true;

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}