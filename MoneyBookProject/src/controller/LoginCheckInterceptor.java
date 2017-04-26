package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	// 리퀘스트가 컨트롤러의 요청처리 메소드로 들어가기 전에 실행할 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (request.getSession().getAttribute("id_index") == null) {
			response.sendRedirect("test.do");
			return false;
		} else {
			return true;
		}
	}

	// 응답할 준비 다하고 할 메소드 (모델 앤 뷰를 만들고 난 후)
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	// 응답을 하고 나서 할 메소드
	// @Override
	// public void afterCompletion(HttpServletRequest request,
	// HttpServletResponse response, Object handler, Exception ex)
	// throws Exception {
	// super.afterCompletion(request, response, handler, ex);
	// }

}
