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
		//해당 글번호
		int num=Integer.parseInt(req.getParameter("num"));
		//해당 페이지번호
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		
		//DB처리
		BoardDBBean dbPro=BoardDBBean.getInstance();
		//해당 글번호에 대한 해당 레코드
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
