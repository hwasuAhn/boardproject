package my.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	public MemberDAO() {}  //기본생성자
	
	private static MemberDAO instance=new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
		
	//아래 영역에 메소드 작성
	
	//login
	public int login(String id, String passwd) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		//MemberDTO dto=null;
		int res=0;
		try {
			conn=getConnection();
			sql+=" SELECT COUNT(id) as cnt ";
			sql+=" FROM member ";
			sql+=" WHERE id=? AND passwd=? AND mlevel<>'F' ";
			//sql+=" SELECT mlevel FROM member ";
			//sql+=" WHERE id=? AND passwd=? AND mlevel<>'F' ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs=pstmt.executeQuery();
			
			if(rs.next()==true)
			{
				//dto=new MemberDTO();
				//dto.setMlevel(rs.getString("mlevel"));
				res=rs.getInt("cnt");			
				//System.out.println("로그인 res : "+res);
			}
			/*else
			{
				dto=null;
			}*/
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt!=null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn!=null) try { conn.close(); } catch(SQLException e) {}
		}  //try end
		//System.out.println(res);
		return res;
	}  //login end
	
	//loginlevel
	public MemberDTO loginlevel(String id, String passwd) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		MemberDTO dto=null;
		//int res=0;
		try {
			conn=getConnection();
			//sql+=" SELECT COUNT(id) as cnt ";
			//sql+=" FROM member ";
			//sql+=" WHERE id=? AND passwd=? ";
			sql+=" SELECT mlevel FROM member ";
			sql+=" WHERE id=? AND passwd=? AND mlevel<>'F' ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs=pstmt.executeQuery();
			
			if(rs.next()==true)
			{
				dto=new MemberDTO();
				dto.setMlevel(rs.getString("mlevel"));
				//res=rs.getInt("cnt");			
			}
			/*else
			{
				dto=null;
			}*/
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt!=null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn!=null) try { conn.close(); } catch(SQLException e) {}
		}  //try end
		//System.out.println(res);
		return dto;
	}  //loginlevel end
	
	//회원가입
	public int insertmem(MemberDTO mem) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int res=0;
		
		try {
			conn=getConnection();
			sql+=" INSERT INTO member(id, passwd, mname, tel, email, zipcode, ";
			sql+=" address1, address2, job, mlevel, mdate) ";
			sql+=" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, 'D', sysdate) ";
			pstmt=conn.prepareStatement(sql);			
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getPasswd());
			pstmt.setString(3, mem.getMname());
			pstmt.setString(4, mem.getTel());
			pstmt.setString(5, mem.getEmail());
			pstmt.setString(6, mem.getZipcode());
			pstmt.setString(7, mem.getAddress1());
			pstmt.setString(8, mem.getAddress2());	
			pstmt.setString(9, mem.getJob());
			res=pstmt.executeUpdate();		
			
			//System.out.println("회원가입 res : "+res);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt!=null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn!=null) try { conn.close(); } catch(SQLException e) {}
		}  //try end
		return res;
	}  //insertmem end
	
	//아이디 확인
	public MemberDTO idSearch(String id) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDTO mod=null;
		
		try {
			conn=getConnection();
			String sql=" SELECT * FROM member WHERE id=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				mod=new MemberDTO();
				mod.setId(rs.getString("id"));
				mod.setAddress1(rs.getString("address1"));
				mod.setAddress2(rs.getString("address2"));
				mod.setEmail(rs.getString("email"));
				mod.setJob(rs.getString("job"));
				mod.setPasswd(rs.getString("passwd"));
				mod.setTel(rs.getString("tel"));
				mod.setZipcode(rs.getString("zipcode"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt!=null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn!=null) try { conn.close(); } catch(SQLException e) {}
		}  //try end
		return mod;
	}  //idSearch end
	
	//회원정보 수정폼
	public MemberDTO modifyForm(MemberDTO dto) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(" SELECT * FROM member WHERE id=? AND passwd=? AND mlevel<>'F' ");
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto=new MemberDTO();
				dto.setId(rs.getString("id"));
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
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt!=null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn!=null) try { conn.close(); } catch(SQLException e) {}
		}  //try end
		return dto;
	}  //modifyForm end
	
	//회원정보 수정
	public int modifyMem(MemberDTO mod) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int res=0;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(" SELECT * FROM member WHERE id=? ");
			pstmt.setString(1, mod.getId());
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				sql=" UPDATE member SET passwd=?, email=?, address1=?, address2=?, tel=?, zipcode=?, job=?, mname=? ";
				sql+=" WHERE id=? ";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, mod.getPasswd());
				pstmt.setString(2, mod.getEmail());
				pstmt.setString(3, mod.getAddress1());
				pstmt.setString(4, mod.getAddress2());
				pstmt.setString(5, mod.getTel());
				pstmt.setString(6, mod.getZipcode());
				pstmt.setString(7, mod.getJob());
				pstmt.setString(8, mod.getMname());
				pstmt.setString(9, mod.getId());
				pstmt.executeUpdate();
				System.out.println(pstmt);
				
				res=1;
			}
			else
			{
				res=-1;
			}
			//System.out.println("회원정보수정 res : "+res);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt!=null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn!=null) try { conn.close(); } catch(SQLException e) {}
		}  //try end
		return res;
	}  //modifyMem end
	
	//회원 삭제
	/*public int withdraw(String id, String passwd) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		String dbpasswd="";
		int x=0;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(" SELECT passwd FROM member WHERE id=? ");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dbpasswd=rs.getString("passwd");
				if(dbpasswd.equals(passwd))
				{
					sql+=" UPDATE member SET mlevel='F' ";
					sql+=" WHERE id=? ";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x=1;
				}
				else
				{
					x=5;
				}
			
				sql+=" UPDATE member SET mlevel='F' ";
				sql+=" WHERE id=? AND passwd=? ";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, passwd);
				res=pstmt.executeUpdate();
				System.out.println("회원삭제 x : "+x);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt!=null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn!=null) try { conn.close(); } catch(SQLException e) {}
		}  //try end
		return x;
	}  //withdraw end
*/
	
	public int withdraw(String id, String passwd) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		
		try {
			conn=getConnection();
			sql+=" UPDATE member SET mlevel='F' ";
			sql+=" WHERE id=? AND passwd=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			res=pstmt.executeUpdate();
			//System.out.println("회원삭제 res : "+res);
			//System.out.println("ID : "+id);
			//System.out.println("PASSWD : "+passwd);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn!=null) try { conn.close(); } catch(SQLException e) {}
		}  //try end
		//int x=13;
		return res;
	}  //withdraw end
	
	//ID 중복확인
	public int duplicateId(String id) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int res=0;
		
		try {
			conn=getConnection();
			sql+=" SELECT COUNT(id) as cnt ";
			sql+=" FROM member ";
			sql+=" WHERE id=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()==true)
			{
				res=rs.getInt("cnt");
			}
			System.out.println("duplicateID : "+res);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt!=null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn!=null) try { conn.close(); } catch(SQLException e) {}
		}  //try end
		return res;
	}  //duplicateId end
	
	//DB커넥션 풀
	private Connection getConnection() throws Exception {
		Context initCtx=new InitialContext();
		DataSource ds=(DataSource)initCtx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
}  //--------------------------class MemberDAO end
