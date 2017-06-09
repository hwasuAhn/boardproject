package php.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;
import php.board.BoardDBBean;
import php.board.BoardDataBean;

public class WriteProAction extends HttpServlet implements CommandAction {
	
	//@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		req.setCharacterEncoding("euc-kr");
		BoardDBBean check = BoardDBBean.getInstance();
		BoardDataBean user = check.getMember(req.getParameter("id"));
		
		BoardDataBean article=new BoardDataBean();
		article.setNum(Integer.parseInt(req.getParameter("num")));
		article.setWriter(user.getWriter());
		article.setEmail(user.getEmail());
		article.setSubject(req.getParameter("subject"));
		article.setReg_date(new Timestamp(System.currentTimeMillis()));
		article.setRef(Integer.parseInt(req.getParameter("ref")));
		article.setRe_step(Integer.parseInt(req.getParameter("re_step")));
		article.setRe_level(Integer.parseInt(req.getParameter("re_level")));
		article.setContent(req.getParameter("content"));
		article.setIp(req.getRemoteAddr());
		
		BoardDBBean dbPro=BoardDBBean.getInstance();
		dbPro.insertArticle(article);
		
		return "/phpbbs/writePro.jsp";
	}

}
