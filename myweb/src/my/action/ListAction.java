package my.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.board.BoardDBBean;

public class ListAction implements CommandAction{

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		String pageNum = req.getParameter("pageNum");
		if(pageNum == null){
			pageNum="1";
		}
		int pageSize=10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		int count = 0;
		int number =0;
		
		List articleList = null;
		BoardDBBean dbPro = BoardDBBean.getInstance();
		count=dbPro.getArticleCount();
		
		String today=www.utility.Utility.getDate();  //���� ��¥
		
		if(count>0)
		{
			articleList=dbPro.getArticles(startRow, endRow);
		}
		else
		{
			articleList = Collections.EMPTY_LIST;
		}
		
		number = count-(currentPage-1)*pageSize;
		
		req.setAttribute("currentPage", new Integer(currentPage));
		req.setAttribute("startRow", new Integer(startRow));
		req.setAttribute("endRow", new Integer(endRow));
		req.setAttribute("count", new Integer(count));
		req.setAttribute("pageSize", new Integer(pageSize));
		req.setAttribute("number", new Integer(number));
		req.setAttribute("articleList", articleList);		
		//req.setAttribute("reg_date", articleList);		
		req.setAttribute("today", today);
		
		return "/mvc2bbs/list.jsp";
	}

}







