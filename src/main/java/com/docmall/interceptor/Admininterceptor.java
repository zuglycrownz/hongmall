package com.docmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.docmall.domain.AdminVO;

public class Admininterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean result = false;
		HttpSession session = request.getSession();
		
		AdminVO admin = ((AdminVO) session.getAttribute("adminStatus"));
		
		if(admin == null) { //로그인 하지 않은경우
			
			result = false;
			if(isAjaxRequest(request)) {
				response.sendError(400);
			}else {
				
				getTargetUrl(request);
				 	String alertScript = "alert('로그인이 필요합니다.');";
		            String redirectScript = "window.location.href='/admin/intro';";
		            String fullScript = "<script>" + alertScript + redirectScript + "</script>";

		            response.setContentType("text/html; charset=UTF-8");
		            response.getWriter().println(fullScript);
			}
			
           
            
			
		}else { //로그인 한 경우
			result = true;
			
		}
		// TODO Auto-generated method stub
		return result;
	}
	

	private void getTargetUrl(HttpServletRequest request) {
		
		String url = request.getRequestURI();
		String query = request.getQueryString();
		
		if(query == null || query.equals("null") ) {
			
			query = "";
		}else {
			query = "?" + query;
		}
		String targetUrl = url + query;
		
		if(request.getMethod().equals("GET")) {
			
			request.getSession().setAttribute("targetURL", targetUrl);
		}
		
	}

	private boolean isAjaxRequest(HttpServletRequest request) {
		
		boolean isAjax = false;
		String header = request.getHeader("AJAX");
		if(header !=null && header.equals("true")) {
			isAjax = true;
			
		}
		
		return isAjax;
	}
}
