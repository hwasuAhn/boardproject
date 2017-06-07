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
		//request영역에 자료 올리기
		req.setAttribute("res", new Integer(res));
		//req.setAttribute("dto", dto.getMlevel());
		req.setAttribute("id", id);
		//req.setAttribute("passwd", passwd);
		
		//session영역에 자료 올리기
		req.getSession().setAttribute("s_id2", id);
		//req.getSession().setAttribute("s_passwd2", passwd);
		if(dto!=null)
		{
			String mlevel=dto.getMlevel();
			req.getSession().setAttribute("s_mlevel", mlevel);
		}
		
		//아이디 쿠키저장-----------------------------
		String c_id=req.getParameter("c_id");
		//Checkbox에 체크를 하면 SAVE, 안하면 빈값
		if(c_id==null)
		{
			c_id="";
		}
		
		Cookie cookie=null;
		if(c_id.equals("SAVE"))
		{
			//Checkbox를 선택해 쿠키를 저장할 경우
			cookie=new Cookie("c_id", id);
			cookie.setMaxAge(60*60*24*31);  //1달동안 쿠키저장
		}
		else
		{
			//Checkbox를 선택하지않아 쿠키를 저장하지 않을 경우
			cookie=new Cookie("c_id", "");
			cookie.setMaxAge(0);  //0second
		}
		
		resp.addCookie(cookie);  //사용자PC에 쿠키값 저장
		//----------------------------------------------		

		
		req.setAttribute("res", res);
		return "/mvc2member/loginPro.jsp";
	}

}
