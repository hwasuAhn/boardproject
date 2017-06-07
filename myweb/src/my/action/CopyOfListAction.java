package my.action;


import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.board.BoardDBBean;

public class CopyOfListAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		String pageNum=req.getParameter("pageNum");
		if(pageNum==null)
		{
			pageNum="1";
		}
		int pageSize=10;
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		int count=0;
		int number=0;
		
		List articleList=null;
		BoardDBBean dbPro=BoardDBBean.getInstance();
		count=dbPro.getArticleCount();
		
		if(count>0)
		{
			articleList=dbPro.getArticles(startRow, endRow);
		}
		else
		{
			articleList=Collections.EMPTY_LIST;
		}
		
		number=count-(currentPage-1)*pageSize;
		
		//request영역에 저장
		req.setAttribute("currentPage", new Integer(currentPage));
		req.setAttribute("startRow", new Integer(startRow));
		req.setAttribute("endRow", new Integer(endRow));
		req.setAttribute("count", new Integer(count));
		req.setAttribute("pageSize", new Integer(pageSize));
		req.setAttribute("number", new Integer(number));
		req.setAttribute("articleList", articleList);
		
		return "list.jsp";
	}

}  //---------------------------------class ListAction end
