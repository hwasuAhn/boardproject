package my.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		//�ش� �۹�ȣ
		int num=Integer.parseInt(req.getParameter("num"));
		//�ش� ��������ȣ
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		
		req.setAttribute("num", new Integer(num));
		req.setAttribute("pageNum", new Integer(pageNum));
				
		return "/mvc2bbs/update.jsp";
	}

}  //---------------------------------class UpdateAction end
