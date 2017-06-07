package mem.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;
import my.member.MemberDAO;
import my.member.MemberDTO;

public class ModifyFormAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		req.setCharacterEncoding("euc-kr");
		
		String id=req.getParameter("id").trim();
		String passwd=req.getParameter("passwd").trim();
		
		MemberDTO dto=new MemberDTO();
		dto.setId(id);
		dto.setPasswd(passwd);
		
		MemberDAO dbPro=MemberDAO.getInstance();
		dto=dbPro.modifyForm(dto);
		//System.out.println("¼öÁ¤Æû dto : "+dto);
		
		req.setAttribute("dto", dto);
		return "/mvc2member/modifyForm.jsp";
	}

}
