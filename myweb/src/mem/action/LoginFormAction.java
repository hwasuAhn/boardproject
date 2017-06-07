package mem.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;


public class LoginFormAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		//저장된 아이디를 쿠키파일에 가져오기
		Cookie[] cookies=req.getCookies();
		String c_id="";  //c_id변수에 쿠키에 저장된 아이디 대입
		
		if(cookies!=null)  //쿠키가 존재한다면
		{
			for(int i=0; i<cookies.length; i++)
			{
				Cookie item=cookies[i];  //쿠키를 하나씩 추출
				if(item.getName().equals("c_id")==true)  //찾으려는 변수가 있는지 검사
				{
					//찾아진 쿠키의 값 추출, 저장된 아이디 가져오기
					c_id=item.getValue();
					
				}
			}
		}
		req.setAttribute("c_id", c_id);
		return "/mvc2member/loginForm.jsp";
	}

}
