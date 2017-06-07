package mem.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;

public class ZipCheckProAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		String dong=req.getParameter("dong");
		req.setAttribute("dong", dong);
		
		return "/member/zipCheckProc.jsp";
	}

}
