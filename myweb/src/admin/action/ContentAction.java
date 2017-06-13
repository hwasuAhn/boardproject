package admin.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;
import my.board.BoardDBBean;
import my.board.BoardDataBean;
import www.utility.Utility;

public class ContentAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		//�ش� �۹�ȣ
		int num=Integer.parseInt(req.getParameter("num"));
		//�ش� ��������ȣ
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		
		//DBó��
		BoardDBBean dbPro=BoardDBBean.getInstance();
		//�ش� �۹�ȣ�� ���� �ش� ���ڵ�
		BoardDataBean article=dbPro.getArticle(num);
		
		req.setAttribute("num", new Integer(num));
		req.setAttribute("pageNum", new Integer(pageNum));
		req.setAttribute("article", article);
		String content=Utility.getConvertChar(article.getContent());
		content=Utility.getConvertBR(content);
		req.setAttribute("content", content);
		
		return "/admin/bbs/jspbbs_content.jsp";
	}

}  //--------------------------------class ContentAction end
