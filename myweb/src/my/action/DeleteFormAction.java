package my.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.board.BoardDBBean;
import my.board.BoardDataBean;

public class DeleteFormAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		//해당 글번호
		int num=Integer.parseInt(req.getParameter("num"));
		//해당 페이지번호
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		
		req.setAttribute("num", new Integer(num));
		req.setAttribute("pageNum", new Integer(pageNum));
				
		return "/mvc2bbs/deleteForm.jsp";
	}

}  //------------------------------------------------------class DeleteFormAction end
