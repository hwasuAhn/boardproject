package php.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;
import php.board.BoardDBBean;
import php.board.BoardDataBean;

public class UpdateFormAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		req.setCharacterEncoding("euc-kr");
		
		int num=Integer.parseInt(req.getParameter("num"));
		String pageNum=req.getParameter("pageNum");
		String passwd=req.getParameter("passwd");
		BoardDataBean article=null;		
		BoardDBBean dbPro=BoardDBBean.getInstance();
		//int check=dbPro.updateCheckArticle(num, passwd);
		article=dbPro.updateGetArticle(num, passwd);
				
		//�ش�信�� ����� �Ӽ�
		req.setAttribute("pageNum", new Integer(pageNum));
		//req.setAttribute("check", new Integer(check));
		req.setAttribute("article", article);
		return "/mvc2bbs/updateForm.jsp";
	}

}
