package mem.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;

public class IdCheckProAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		String id=req.getParameter("id");
		
		req.setAttribute("id", id);
		//System.out.println("req id : "+id);
		return "/member/idCheckProc.jsp";
	}

}
