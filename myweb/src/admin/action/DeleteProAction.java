package admin.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;
import my.board.BoardDBBean;

public class DeleteProAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		req.setCharacterEncoding("euc-kr");
		
		int num=Integer.parseInt(req.getParameter("num"));
		String pageNum=req.getParameter("pageNum");
				
		BoardDBBean dbPro=BoardDBBean.getInstance();
		int check=dbPro.deleteArticle(num);
		
		//�ش�信�� ����� �Ӽ�
		req.setAttribute("pageNum", new Integer(pageNum));
		req.setAttribute("check", new Integer(check));
		
		return "/admin/bbs/jspbbs_deletePro.jsp";
	}

}  //-----------------------------------------------class DeleteProAction end
