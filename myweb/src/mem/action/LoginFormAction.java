package mem.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;


public class LoginFormAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		//����� ���̵� ��Ű���Ͽ� ��������
		Cookie[] cookies=req.getCookies();
		String c_id="";  //c_id������ ��Ű�� ����� ���̵� ����
		
		if(cookies!=null)  //��Ű�� �����Ѵٸ�
		{
			for(int i=0; i<cookies.length; i++)
			{
				Cookie item=cookies[i];  //��Ű�� �ϳ��� ����
				if(item.getName().equals("c_id")==true)  //ã������ ������ �ִ��� �˻�
				{
					//ã���� ��Ű�� �� ����, ����� ���̵� ��������
					c_id=item.getValue();
					
				}
			}
		}
		req.setAttribute("c_id", c_id);
		return "/mvc2member/loginForm.jsp";
	}

}
