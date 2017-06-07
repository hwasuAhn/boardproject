package mem.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;

public class EmailCheckProAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		String email=req.getParameter("email");
		req.setAttribute("email", email);
		return "/member/emailCheckProc2.jsp";
	}

}
