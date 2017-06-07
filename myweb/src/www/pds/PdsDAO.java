package www.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import www.utility.DBClose;

public class PdsDAO {

	//파일등록
	public int insert(Connection con, PdsDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		
		sql+=" INSERT INTO tb_pds(pdsno, wname, subject, regdate, passwd, filename, filesize) ";
		sql+=" VALUES(pdsno_seq.nextval, ?, ?, sysdate, ?, ?, ?) ";
		pstmt=con.prepareStatement(sql);			
		pstmt.setString(1, dto.getWname());
		pstmt.setString(2, dto.getSubject());
		pstmt.setString(3, dto.getPasswd());
		pstmt.setString(4, dto.getFilename());
		pstmt.setLong(5, dto.getFilesize());
		res=pstmt.executeUpdate();			
		return res;
	}  //insert() end
	
	//파일삭제
	public int delete(Connection con, PdsDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		
		sql+=" DELETE FROM tb_pds ";
		sql+=" WHERE pdsno=? AND passwd=? ";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPdsno());
		pstmt.setString(2, dto.getPasswd());
		res=pstmt.executeUpdate();
		return res;
	}
	
	//관리자 파일삭제
	public int admindelete(Connection con, PdsDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		
		sql+=" DELETE FROM tb_pds ";
		sql+=" WHERE pdsno=? ";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPdsno());
		res=pstmt.executeUpdate();
		return res;
	}	
	
	//파일 목록
	public ArrayList<PdsDTO> list(Connection con) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		ArrayList<PdsDTO> list=null;
		
		sql+=" SELECT * FROM tb_pds ";
		sql+=" ORDER BY pdsno DESC ";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next())
		{
			list=new ArrayList<PdsDTO>();
			do {
				PdsDTO dto=new PdsDTO();
				dto.setPdsno(rs.getInt("pdsno"));
				/*dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getInt("filesize"));*/
				list.add(dto);
			} while(rs.next());
		}
		DBClose.close(pstmt, rs);
		return list;
	}  //list() end
	
	//파일 목록
	public ArrayList<PdsDTO> listMain(Connection con) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		ArrayList<PdsDTO> list=null;
		
		sql+=" SELECT pdsno, subject, regdate, readcnt, filename, r FROM( ";
		sql+=" SELECT pdsno, subject, regdate, readcnt, filename, rownum as r FROM( ";
		sql+=" SELECT pdsno, subject, regdate, readcnt, filename FROM tb_pds ";
		sql+=" ORDER BY pdsno DESC)) WHERE r<5 ";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next())
		{
			list=new ArrayList<PdsDTO>();
			do {
				PdsDTO dto=new PdsDTO();
				dto.setPdsno(rs.getInt("pdsno"));
				//dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setFilename(rs.getString("filename"));
				//dto.setFilesize(rs.getInt("filesize"));
				list.add(dto);
			} while(rs.next());
		}
		DBClose.close(pstmt, rs);
		return list;
	}  //listMain() end
	
	//상세보기
	public PdsDTO read(Connection con, int pdsno) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		PdsDTO dto=null;
		
		sql+=" SELECT * FROM tb_pds ";
		sql+=" WHERE pdsno=? ";
		pstmt=con.prepareStatement(sql);  //쿼리문 생성
		pstmt.setInt(1, pdsno);
		rs=pstmt.executeQuery();  //쿼리문 실행	
		if(rs.next())
		{	
			dto=new PdsDTO();
			dto.setPdsno(rs.getInt("pdsno"));
			dto.setWname(rs.getString("wname"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReadcnt(rs.getInt("readcnt"));
			dto.setRegdate(rs.getString("regdate"));
			dto.setFilename(rs.getString("filename"));
			dto.setFilesize(rs.getInt("filesize"));			
		}
		else
		{
			System.out.println("관련 게시글 없음");
		}
		DBClose.close(pstmt, rs);
		return dto;
	}  //read() end
	
	//파일 수정폼
	public PdsDTO updateform(Connection con, PdsDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//int res=0;
		String sql="";
		
		sql+=" SELECT * FROM tb_pds ";
		sql+=" WHERE pdsno=? AND passwd=? ";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPdsno());
		pstmt.setString(2, dto.getPasswd());		
		rs=pstmt.executeQuery();
		if(rs.next())
		{
			dto.setPdsno(rs.getInt("pdsno"));
			dto.setWname(rs.getString("wname"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReadcnt(rs.getInt("readcnt"));
			dto.setRegdate(rs.getString("regdate"));
			dto.setFilename(rs.getString("filename"));
			dto.setFilesize(rs.getInt("filesize"));
		}
		else
		{
			dto=null;
		}
		return dto;
	}  //updateform() end
	
	//관리자 파일 수정폼
	public PdsDTO adminupdateform(Connection con, PdsDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//int res=0;
		String sql="";
		
		sql+=" SELECT * FROM tb_pds ";
		sql+=" WHERE pdsno=? ";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPdsno());	
		rs=pstmt.executeQuery();
		if(rs.next())
		{
			dto.setPdsno(rs.getInt("pdsno"));
			dto.setWname(rs.getString("wname"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReadcnt(rs.getInt("readcnt"));
			dto.setRegdate(rs.getString("regdate"));
			dto.setFilename(rs.getString("filename"));
			dto.setFilesize(rs.getInt("filesize"));
		}
		else
		{
			dto=null;
		}
		return dto;
	}  //adminupdateform() end
	
	//파일 수정
	public int updateproc(Connection con, PdsDTO dto) throws SQLException {
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		
		sql+=" UPDATE tb_pds ";
		sql+=" SET wname=?, subject=?, passwd=?";

		if(dto.getFilesize()>0)
		{
			sql+=" , filename=?, filesize=? ";
		}
		
		sql+=" WHERE pdsno=? ";
		pstmt=con.prepareStatement(sql);			
		pstmt.setString(1, dto.getWname());
		pstmt.setString(2, dto.getSubject());
		pstmt.setString(3, dto.getPasswd());
		
		if(dto.getFilesize()>0)
		{
			pstmt.setString(4, dto.getFilename());
			pstmt.setLong(5, dto.getFilesize());
			pstmt.setInt(6, dto.getPdsno());
		}
		else
		{
			pstmt.setInt(4, dto.getPdsno());
		}
		res=pstmt.executeUpdate();			
		return res;
	}  //updateproc() end
	
}  //-----------------------------------------class PdsDAO end