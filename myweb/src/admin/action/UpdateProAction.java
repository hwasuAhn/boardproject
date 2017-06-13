package admin.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;
import my.board.BoardDBBean;
import my.board.BoardDataBean;

public class UpdateProAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		req.setCharacterEncoding("euc-kr");
		String pageNum=req.getParameter("pageNum");
		
		BoardDataBean article=new BoardDataBean();
		
		article.setNum(Integer.parseInt(req.getParameter("num")));
		article.setWriter(req.getParameter("writer"));
		article.setEmail(req.getParameter("email"));
		article.setSubject(req.getParameter("subject"));
		article.setPasswd(req.getParameter("passwd"));
		article.setContent(req.getParameter("content"));
		
		System.out.println(req.getParameter("writer") +" "+req.getParameter("passwd"));
		
		BoardDBBean dbPro=BoardDBBean.getInstance();
		int check=dbPro.updateProArticle(article);
		
		req.setAttribute("pageNum", new Integer(pageNum));
		req.setAttribute("check", new Integer(check));
		return "/admin/bbs/jspbbs_updatePro.jsp";
	}

}  //-----------------------------------class UpdateProAction end
