package php.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;
import php.board.BoardDBBean;
import php.board.BoardDataBean;
import www.utility.Utility;

public class ContentAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		String id = req.getParameter("id");
		int num=Integer.parseInt(req.getParameter("num"));
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		
		
		BoardDBBean dbPro=BoardDBBean.getInstance();
		BoardDataBean article=dbPro.getArticle(num);
		
		req.setAttribute("id", id);
		req.setAttribute("num", new Integer(num));
		req.setAttribute("pageNum", new Integer(pageNum));
		req.setAttribute("article", article);
		String content=Utility.getConvertChar(article.getContent());
		content=Utility.getConvertBR(content);
		req.setAttribute("content", content);
		
		return "/phpbbs/content.jsp";
	}

}  //--------------------------------class ContentAction end
