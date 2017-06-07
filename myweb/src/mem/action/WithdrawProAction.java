package mem.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;
import my.member.MemberDAO;
import my.member.MemberDTO;

public class WithdrawProAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		req.setCharacterEncoding("euc-kr");
		
		String id=req.getParameter("id");
		String passwd=req.getParameter("passwd");
		
		//System.out.println(id+" "+passwd);
		
		MemberDTO dto=new MemberDTO();
		dto.setId(id);
		dto.setPasswd(passwd);
		//System.out.println("id : "+ id);
	
		MemberDAO dbPro=MemberDAO.getInstance();
		int res=0;
		//System.out.println("dbProÀü res : "+res);
		res=dbPro.withdraw(id, passwd);
		//System.out.println("dbProÈÄ res : "+res);
		req.setAttribute("res", new Integer(res));
		req.setAttribute("id", id);
		//req.setAttribute("passwd", passwd);
		
		return "/mvc2member/withdrawPro.jsp";
	}

}
