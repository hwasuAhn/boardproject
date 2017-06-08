package mem.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.action.CommandAction;

public class LogoutAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "/mvc2member/logout.jsp";
	}

}
