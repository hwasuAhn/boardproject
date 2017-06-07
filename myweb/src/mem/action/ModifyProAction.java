package mem.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;
import my.member.MemberDAO;
import my.member.MemberDTO;

public class ModifyProAction extends HttpServlet implements CommandAction {

	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		//사용자가 입력 요청한 값 가져오기		
		String id=req.getParameter("id").trim();
		String passwd=req.getParameter("passwd").trim();
		String mname=req.getParameter("mname").trim();
		String tel=req.getParameter("tel").trim();
		String email=req.getParameter("email").trim();
		String zipcode=req.getParameter("zipcode").trim();
		String address1=req.getParameter("address1").trim();
		String address2=req.getParameter("address2").trim();
		String job=req.getParameter("job").trim();
		
		MemberDTO dto=new MemberDTO();
		dto.setId(id);
		dto.setPasswd(passwd);
		dto.setMname(mname);
		dto.setTel(tel);
		dto.setEmail(email);
		dto.setZipcode(zipcode);
		dto.setAddress1(address1);
		dto.setAddress2(address2);
		dto.setJob(job);
		
		System.out.println(dto);
		MemberDAO dbPro=MemberDAO.getInstance();
		int res=0;
		res=dbPro.modifyMem(dto);
		
		//System.out.println("수정 res : "+res);
		req.setAttribute("res", res);
		return "/mvc2member/modifyPro.jsp";
	}

}
