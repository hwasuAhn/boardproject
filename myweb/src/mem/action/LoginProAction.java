package mem.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;
import my.member.MemberDAO;
import my.member.MemberDTO;

public class LoginProAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		req.setCharacterEncoding("euc-kr");
		
		String id=req.getParameter("id");
		String passwd=req.getParameter("passwd");
		
		MemberDTO dto=new MemberDTO();
		dto.setId(id);dto.setPasswd(passwd);
		
		MemberDAO dbPro=MemberDAO.getInstance();
		int res=0;
		res=dbPro.login(id, passwd);
		dto=dbPro.loginlevel(id, passwd); 
		System.out.println("res : "+res);
		//System.out.println("dto : "+dto);

		req.setAttribute("res", new Integer(res));
		//req.setAttribute("dto", dto.getMlevel());
		req.setAttribute("id", id);

		
		req.getSession().setAttribute("s_id2", id);
		req.getSession().setAttribute("s_passwd2", passwd);
		if(dto!=null)
		{
			String mlevel=dto.getMlevel();
			req.getSession().setAttribute("s_mlevel", mlevel);
		}
		
		String c_id=req.getParameter("c_id");

		if(c_id==null)
		{
			c_id="";
		}
		
		Cookie cookie=null;
		if(c_id.equals("SAVE"))
		{
			cookie=new Cookie("c_id", id);
			cookie.setMaxAge(60*60*24*31);
		}
		else
		{
			cookie=new Cookie("c_id", "");
			cookie.setMaxAge(0);  //0second
		}
		
		resp.addCookie(cookie);
		//----------------------------------------------		

		
		req.setAttribute("res", res);
		return "/mvc2member/loginPro.jsp";
	}

}
