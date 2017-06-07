package www.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import www.member.MemberDTO;
import www.utility.DBClose;

public class MemberDAO {

	//회원가입
	public int insert(Connection con, MemberDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		
		sql+=" INSERT INTO member(id, passwd, mname, tel, email, zipcode, ";
		sql+=" address1, address2, job, mlevel, mdate) ";
		sql+=" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, 'D', sysdate) ";
		pstmt=con.prepareStatement(sql);			
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPasswd());
		pstmt.setString(3, dto.getMname());
		pstmt.setString(4, dto.getTel());
		pstmt.setString(5, dto.getEmail());
		pstmt.setString(6, dto.getZipcode());
		pstmt.setString(7, dto.getAddress1());
		pstmt.setString(8, dto.getAddress2());	
		pstmt.setString(9, dto.getJob());
		res=pstmt.executeUpdate();			
		return res;
	}  //insert() end
	
	//아이디 중복 확인
	public int duplicatedid(Connection con, String id) throws SQLException {
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int res=0;
		
		sql+=" SELECT count(id) FROM member ";
		sql+=" WHERE id=? ";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next())
		{
			res=rs.getInt(1);  //아이디가 중복되었을 경우
		}
		DBClose.close(con, pstmt, rs);
		return res;
	}  //duplicatedid() end
	
	//이메일 중복 확인
	public int duplicatedemail(Connection con, String email) throws SQLException {
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int res=0;
		
		sql+=" SELECT count(email) FROM member ";
		sql+=" WHERE email=? ";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, email);
		rs=pstmt.executeQuery();
		if(rs.next())
		{
			res=rs.getInt(1);  //이메일이 중복되었을 경우
		}
		DBClose.close(con, pstmt, rs);
		return res;
	}  //duplicatedemail() end
		
	//회원 로그인
	public MemberDTO loginproc(Connection con, MemberDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//int res=0;
		String sql="";
		
		sql+=" SELECT mlevel FROM member ";
		sql+=" WHERE id=? AND passwd=? AND mlevel<>'F' ";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPasswd());		
		rs=pstmt.executeQuery();
		if(rs.next())
		{
			dto.setMlevel(rs.getString("mlevel"));
		}
		else
		{
			dto=null;
		}
		DBClose.close(con, pstmt, rs);
		return dto;
	}  //loginproc() end
	
	//관리자 회원 로그인
	public MemberDTO adminloginproc(Connection con, MemberDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//int res=0;
		String sql="";
		
		sql+=" SELECT mlevel FROM admin ";
		sql+=" WHERE id=? AND passwd=? AND mlevel<>'F' ";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPasswd());		
		rs=pstmt.executeQuery();
		if(rs.next())
		{
			dto.setMlevel(rs.getString("mlevel"));
		}
		else
		{
			dto=null;
		}
		DBClose.close(con, pstmt, rs);
		return dto;
	}  //adminloginproc() end

	//회원 탈퇴
	public int delete(Connection con, MemberDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		
		sql+=" UPDATE member ";
		sql+=" SET mlevel='F' ";
		sql+=" WHERE id=? AND passwd=? ";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPasswd());
		res=pstmt.executeUpdate();
		
		DBClose.close(con, pstmt);
		return res;
	}  //delete() end
	
	//관리자 회원 탈퇴
	public int delete(Connection con, String id) throws SQLException {
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		
		sql+=" UPDATE member ";
		sql+=" SET mlevel='F' ";
		sql+=" WHERE id=? ";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		res=pstmt.executeUpdate();
		
		DBClose.close(con, pstmt);
		return res;
	}  //delete() end
	
	//회원정보 수정 폼
	public MemberDTO updateform(Connection con, MemberDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//int res=0;
		String sql="";
		
		sql+=" SELECT * FROM member ";
		sql+=" WHERE id=? AND passwd=? AND mlevel<>'F' ";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPasswd());		
		rs=pstmt.executeQuery();
		if(rs.next())
		{
			dto.setPasswd(rs.getString("passwd"));
			dto.setMname(rs.getString("mname"));
			dto.setTel(rs.getString("tel"));
			dto.setEmail(rs.getString("email"));
			dto.setZipcode(rs.getString("zipcode"));
			dto.setAddress1(rs.getString("address1"));
			dto.setAddress2(rs.getString("address2"));
			dto.setJob(rs.getString("job"));
		}
		else
		{
			dto=null;
		}
		return dto;
	}  //updateform() end
	
	//회원정보 수정
	public int updateproc(Connection con, MemberDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		sql+=" UPDATE member ";
		sql+=" SET passwd=?, mname=?, tel=?, email=?, zipcode=?, address1=?, address2=?, job=? ";
		sql+=" WHERE id=? ";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, dto.getPasswd());
		pstmt.setString(2, dto.getMname());
		pstmt.setString(3, dto.getTel());
		pstmt.setString(4, dto.getEmail());
		pstmt.setString(5, dto.getZipcode());
		pstmt.setString(6, dto.getAddress1());
		pstmt.setString(7, dto.getAddress2());
		pstmt.setString(8, dto.getJob());
		pstmt.setString(9, dto.getId());
		res=pstmt.executeUpdate();
		
		DBClose.close(con, pstmt);
		return res;
	}  //updateproc() end
	
	//관리자 회원정보 수정 폼
	public MemberDTO editform(Connection con, MemberDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//int res=0;
		String sql="";
		
		sql+=" SELECT * FROM member ";
		sql+=" WHERE id=? AND mlevel<>'F' ";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, dto.getId());		
		rs=pstmt.executeQuery();
		if(rs.next())
		{
			dto.setPasswd(rs.getString("passwd"));
			dto.setMname(rs.getString("mname"));
			dto.setTel(rs.getString("tel"));
			dto.setEmail(rs.getString("email"));
			dto.setZipcode(rs.getString("zipcode"));
			dto.setAddress1(rs.getString("address1"));
			dto.setAddress2(rs.getString("address2"));
			dto.setJob(rs.getString("job"));
			dto.setMlevel(rs.getString("mlevel"));
		}
		else
		{
			dto=null;
		}
		return dto;
	}  //updateform() end
	
	//관리자 회원정보 수정
	public int update(Connection con, MemberDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		
		sql+=" UPDATE member ";
		sql+=" SET passwd=?, mname=?, tel=?, email=?, zipcode=?, address1=?, address2=?, job=?, mlevel=? ";
		sql+=" WHERE id=? ";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, dto.getPasswd());
		pstmt.setString(2, dto.getMname());
		pstmt.setString(3, dto.getTel());
		pstmt.setString(4, dto.getEmail());
		pstmt.setString(5, dto.getZipcode());
		pstmt.setString(6, dto.getAddress1());
		pstmt.setString(7, dto.getAddress2());
		pstmt.setString(8, dto.getJob());
		pstmt.setString(9, dto.getMlevel());
		pstmt.setString(10, dto.getId());
		res=pstmt.executeUpdate();
		
		DBClose.close(con, pstmt);
		return res;
	}  //update() end
		
	//회원 리스트
	public ArrayList<MemberDTO> list(Connection con) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		ArrayList<MemberDTO> list=null;
		
		sql+=" SELECT * FROM member ";
		sql+=" WHERE mlevel<>'F' ";
		sql+=" ORDER BY id ";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next())
		{			
			list=new ArrayList<MemberDTO>();
			do{
				MemberDTO dto = new MemberDTO();               
			       dto.setId(rs.getString("id")); 
			       /*dto.setPasswd(rs.getString("passwd"));
			       dto.setMname(rs.getString("mname"));
			       dto.setTel(rs.getString("tel"));
			       dto.setEmail(rs.getString("email"));
			       dto.setZipcode(rs.getString("zipcode"));
			       dto.setAddress1(rs.getString("address1"));
			       dto.setAddress2(rs.getString("address2"));
			       dto.setJob(rs.getString("job"));
			       dto.setMlevel(rs.getString("mlevel"));
			       dto.setMdate(rs.getString("mdate"));*/
		       
			       list.add(dto);
			} while(rs.next());
		}
		DBClose.close(pstmt, rs);
		return list;
	}  //list() end
	
	/*//회원 리스트 페이지
	  *//** 페이지당 출력할 레코드 수 *//*
    public int numPerPage = 5;  
    *//** 블럭당 출력 페이지 수 *//*
    private int pagePerBlock = 10;  
    
	public ArrayList<MemberDTO> list(Connection con,int nowPage)  throws SQLException
	{
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	StringBuffer sql=new StringBuffer();
    	ArrayList<MemberDTO> list=null;
    	MemberDTO dto=null;
    	
		 주어진 페이지의 시작 레코드 번호
		조건: 페이지 시작 번호는 0부터 시작
		레코드 번호도 0부터 시작
		   
		 1페이지: 0 * 10 = 0부터 시작
		 2페이지: 1 * 10 = 10부터 시작 
		 3페이지: 2 * 10 = 20부터 시작
		 4페이지: 3 * 10 = 30부터 시작
		
    	int beginOfPage=beginOfPage(nowPage);
    	  		
        // ---------------------------------------------------
        // 레코드를 추출할 범위 생성
        // ---------------------------------------------------
        // 1 페이지:  1 ~ 10   WHERE r >= 1 and r <= 10
        // 2 페이지: 11 ~ 20  WHERE r >= 11 and r <= 20
        int startnum=beginOfPage;  // 1
        int endnum=(beginOfPage + this.numPerPage) - 1;
        String range="r >= " + startnum + " and r <= " + endnum;

        sql.append(" SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate, r");
        sql.append(" FROM(");
        sql.append("           SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate, rownum as r");
        sql.append("           FROM (");
        sql.append("                      SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate ");
        sql.append("                      FROM member ");
        sql.append("                      ORDER BY id");
        sql.append("                      )");
        sql.append("            )");
        sql.append(" WHERE " + range); // WHERE r >= 1 and r <= 10
        pstmt = con.prepareStatement(sql.toString());
        rs = pstmt.executeQuery();
        
        if(rs.next()) {
        	list=new ArrayList<MemberDTO>();
        	do {
        		dto = new MemberDTO();               
                dto.setId(rs.getString("id")); 
                dto.setPasswd(rs.getString("passwd"));
                dto.setMname(rs.getString("mname"));
                dto.setTel(rs.getString("tel"));
                dto.setEmail(rs.getString("email"));
                dto.setZipcode(rs.getString("zipcode"));
                dto.setAddress1(rs.getString("address1"));
                dto.setAddress2(rs.getString("address2"));
                dto.setJob(rs.getString("job"));
                dto.setMlevel(rs.getString("mlevel"));
                dto.setMdate(rs.getString("mdate"));
                
                list.add(dto);
        	} while(rs.next());
        }            
		DBClose.close(con,pstmt,rs);    	
    	return list;    		
		
	}//list(nowPage)
	
    *//**
     * 페이지의 시작레코드번호
     * nowPage: 현재 페이지 
     * 페이지당 출력할 레코드 수 ★
     * 현재 페이지 번호 * 페이지당 레코드 수
     * 1 Page = (0 * 10) + 1 --> 1
     * 2 Page = (1 * 10) + 1 --> 11
     * 3 Page = (2 * 10) + 1 --> 21
     * @param nowPage 현재 페이지
     * @return
     *//*
    public int beginOfPage(int nowPage){
        return (nowPage * this.numPerPage)+1;       
    }  //end*/

}  //-----------------------class MemberDAO end
