package my.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import www.utility.Utility;

import my.board.BoardDBBean;
import my.board.BoardDataBean;

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
		
		return "/mvc2bbs/content.jsp";
	}

}  //--------------------------------class ContentAction end
