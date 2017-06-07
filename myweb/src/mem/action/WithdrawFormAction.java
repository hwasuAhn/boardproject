package mem.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;

public class WithdrawFormAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		req.setCharacterEncoding("euc-kr");
		
		String id=req.getParameter("id");
		//System.out.println("formactionid : "+id);
		req.setAttribute("id", id);
		return "/mvc2member/withdrawForm.jsp";
	}

}
