package hkc.common;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

//사용자 로그인 확인 인터셉터
public class LoginInterceptor extends AbstractInterceptor {
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext context = invocation.getInvocationContext();
		Map<String, Object> session = (Map<String, Object>) context.getSession();
		String loginId = (String) session.get("loginId");
		
		if (loginId == null) {		//세션에 로그인 정보가 없으면 로그인 페이지로.
			return Action.LOGIN;
		}
		return invocation.invoke();
	}

}
