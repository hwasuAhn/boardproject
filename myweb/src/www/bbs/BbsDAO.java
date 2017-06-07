package www.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import www.utility.DBClose;
import www.utility.DBConnect;


public class BbsDAO {

	private DBConnect dbconn=null;
	
	public BbsDAO() {
		dbconn=new DBConnect();
	}
	
	/** �������� ����� ���ڵ� �� */
	public int numPerPage=10;
	/** ���� ��� ������ �� */
	private int pagePerBlock=10;

	//�����Ͻ� ���� ����
	//����
	public int insert(BbsDTO dto) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int res=0;
		
		try {
			con=dbconn.getConnection();  //DB����
			
			//1)�׷��ȣ ����
			//bbsnoĮ�� �� �߿��� ���� ū��+1
			sql+=" SELECT max(bbsno) From tb_bbs ";  //������ �ۼ�
			pstmt=con.prepareStatement(sql);  //������ ����
			rs=pstmt.executeQuery();  //������ ����
			int grpno=0;
			if(rs.next())
			{
				grpno=rs.getInt(1)+1;
			}
			
			//2)���ڵ� �߰�
			sql="";  //sql���� �� �ʱ�ȭ
			sql+=" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno) ";
			sql+=" VALUES(bbsno_seq.nextval, ?, ?, ?, ?, ?, ?) ";
			pstmt=con.prepareStatement(sql);			
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			pstmt.setInt(6, grpno);
			res=pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}  //try end
		return res;
	}  //insert() end
	
	public ArrayList<BbsDTO> list() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		ArrayList<BbsDTO> list=null;
		BbsDTO dto=null;
		
		try {
			con=dbconn.getConnection();  //DB����
			
			//1�� : �׷��ȣ�� �������� 2�� : �ۼ����� �������� ����
			sql+=" SELECT * From tb_bbs ";  //������ �ۼ�
			sql+=" ORDER BY grpno DESC, ansnum ASC ";
			pstmt=con.prepareStatement(sql);  //������ ����
			rs=pstmt.executeQuery();  //������ ����
			if(rs.next())
			{
				list=new ArrayList<BbsDTO>();
				do {
					dto=new BbsDTO();
					dto.setBbsno(rs.getInt("bbsno"));
					/*dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setPasswd(rs.getString("passwd"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setGrpno(rs.getInt("grpno"));
					dto.setIndent(rs.getInt("indent"));
					dto.setAnsnum(rs.getInt("ansnum"));
					dto.setIp(rs.getString("ip"));*/
					list.add(dto);
				} while(rs.next());
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}  //list() end
	
	//���� ����Ʈ
	public ArrayList<BbsDTO> listMain() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		ArrayList<BbsDTO> list=null;
		BbsDTO dto=null;
		
		try {
			con=dbconn.getConnection();  //DB����
			
			//1�� : �׷��ȣ�� �������� 2�� : �ۼ����� �������� ����
			sql+=" SELECT bbsno, wname, subject, readcnt, regdt, grpno, indent, ansnum, r FROM( ";
			sql+=" SELECT bbsno, wname, subject, readcnt, regdt, grpno, indent, ansnum, rownum as r FROM( ";
			sql+=" SELECT bbsno, wname, subject, readcnt, regdt, grpno, indent, ansnum From tb_bbs ";  //������ �ۼ�
			sql+=" ORDER BY grpno DESC, ansnum ASC)) WHERE r<6 ";
			pstmt=con.prepareStatement(sql);  //������ ����
			rs=pstmt.executeQuery();  //������ ����
			if(rs.next())
			{
				list=new ArrayList<BbsDTO>();
				do {
					dto=new BbsDTO();
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					//dto.setContent(rs.getString("content"));
					//dto.setPasswd(rs.getString("passwd"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setGrpno(rs.getInt("grpno"));
					dto.setIndent(rs.getInt("indent"));
					dto.setAnsnum(rs.getInt("ansnum"));
					//dto.setIp(rs.getString("ip"));
					list.add(dto);
				} while(rs.next());
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}  //listMain() end
	
	//�󼼺���
	public BbsDTO read(int bbsno) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		BbsDTO dto=null;
		
		try {
			increment(bbsno);
			con=dbconn.getConnection();  //DB����
			sql+=" SELECT * FROM tb_bbs ";
			sql+=" WHERE bbsno=? ";
			pstmt=con.prepareStatement(sql);  //������ ����
			pstmt.setInt(1, bbsno);
			rs=pstmt.executeQuery();  //������ ����			
			if(rs.next())
			{	
				dto=new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setRegdt(rs.getString("regdt"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setIp(rs.getString("ip"));
			}
			else
			{
				System.out.println("���� �Խñ� ����");
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}  //try end
		return dto;		
	}  //read end
	
	//��ȸ�� ����
	public void increment(int bbsno) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		
		try {
			con=dbconn.getConnection();  //DB����
			sql+=" UPDATE tb_bbs ";
			sql+=" SET readcnt=readcnt+1 ";
			sql+=" WHERE bbsno=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bbsno);
			res=pstmt.executeUpdate();
			if(res==0)
			{
				System.out.println("��ȸ�� ���� ����");
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt);
		}  //try end
	}  //increment() end
	
	public int reply(BbsDTO dto) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		int res=0;
		
		try {
			con=dbconn.getConnection();  //DB����
			
			//1)�θ�� ������������
			//	�׷��ȣ : �θ� �׷��ȣ�� �����ϰ�
			//	�鿩���� : �θ�� �鿩���� + 1
			//	�ۼ��� : �θ�ۼ��� + 1
			sql.append(" SELECT grpno, indent, ansnum FROM tb_bbs ");
			sql.append(" WHERE bbsno=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getBbsno());
			rs=pstmt.executeQuery();
			int grpno=0, indent=0, ansnum=0;
			if(rs.next())
			{
				grpno=rs.getInt("grpno");  //�׷��ȣ
				indent=rs.getInt("indent")+1;  //�鿩����
				ansnum=rs.getInt("ansnum")+1;  //�ۼ���
			}  //�Է��ڷ� �ϼ�
			
			//2)���� �׷쳻���� �ۼ��� �����ϱ�
			sql.delete(0, sql.length());  //1�ܰ迡�� ����ߴ� ������ ����
			sql.append(" UPDATE tb_bbs ");
			sql.append(" SET ansnum=ansnum+1 ");
			sql.append(" WHERE grpno=? AND ansnum>=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			pstmt.executeUpdate();
			
			//3)�亯�� �߰�
			sql.delete(0, sql.length());  //2�ܰ迡�� ����ߴ� ������ ����
			sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno, indent, ansnum) ");
			sql.append(" VALUES(bbsno_seq.nextval, ?, ?, ?, ?, ?, ?, ? ,?) ");
			pstmt=con.prepareStatement(sql.toString());			
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			pstmt.setInt(6, grpno);
			pstmt.setInt(7, indent);
			pstmt.setInt(8, ansnum);
			res=pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}  //try end
		return res;
	}  //reply() end
	
	//����
	public int delete(BbsDTO dto) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		
		try {			
			con=dbconn.getConnection();  //DB����			
			sql+=" DELETE FROM tb_bbs ";
			sql+=" WHERE bbsno=? AND passwd=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBbsno());
			pstmt.setString(2, dto.getPasswd());
			res=pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt);
		}  //try end
		return res;
	}  //delete() end
	
	//������ ����
	public int admindelete(BbsDTO dto) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		
		try {			
			con=dbconn.getConnection();  //DB����			
			sql+=" DELETE FROM tb_bbs ";
			sql+=" WHERE bbsno=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBbsno());
			res=pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt);
		}  //try end
		return res;
	}  //admindelete() end
	
	//������ 
	public BbsDTO updateform(BbsDTO dto) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		
		try {
			con=dbconn.getConnection();  //DB����
			sql+=" SELECT wname, subject, content, passwd FROM tb_bbs";
			sql+=" WHERE bbsno=? AND passwd=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBbsno());
			pstmt.setString(2, dto.getPasswd());
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPasswd(rs.getString("passwd"));
			}
			else
			{
				dto=null;
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}  //try end
		return dto;
	}  //updateform() end
	
	//������ ������ 
	public BbsDTO adminupdateform(BbsDTO dto) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		
		try {
			con=dbconn.getConnection();  //DB����
			sql+=" SELECT wname, subject, content, passwd FROM tb_bbs";
			sql+=" WHERE bbsno=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBbsno());
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPasswd(rs.getString("passwd"));
			}
			else
			{
				dto=null;
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}  //try end
		return dto;
	}  //adminupdateform() end
	
	//����
	public boolean update(BbsDTO dto) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		int res=0;
		boolean flag=false;
		
		try {
			con=dbconn.getConnection();  //DB����
			sql+=" UPDATE tb_bbs ";
			sql+=" SET wname=?, subject=?, content=?, passwd=?, ip=? ";
			sql+=" WHERE bbsno=? ";
			pstmt=con.prepareStatement(sql);			
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			pstmt.setInt(6, dto.getBbsno());
			res=pstmt.executeUpdate();
			if(res==1)
			{
				flag=true;
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt);
		}  //try end
		return flag;
	}  //update() end
	
	//���� ������ ���
	public ArrayList<BbsDTO> list(int nowPage) {
		Connection con=null;
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	StringBuffer sql=new StringBuffer();
    	ArrayList<BbsDTO> list=new ArrayList<BbsDTO>();
    	BbsDTO dto=new BbsDTO();
    	
		/* �־��� �������� ���� ���ڵ� ��ȣ
		����: ������ ���� ��ȣ�� 0���� ����
		���ڵ� ��ȣ�� 0���� ����
		   
		 1������: 0 * 10 = 0���� ����
		 2������: 1 * 10 = 10���� ���� 
		 3������: 2 * 10 = 20���� ����
		 4������: 3 * 10 = 30���� ����
		*/
    	int beginOfPage=beginOfPage(nowPage);
    	
    	try{
    		con=dbconn.getConnection();  
    		
            // ---------------------------------------------------
            // ���ڵ带 ������ ���� ����
            // ---------------------------------------------------
            // 1 ������:  1 ~ 12   WHERE r >= 1 and r <= 12
            // 2 ������: 13 ~ 24  WHERE r >= 13 and r <= 24
            int startnum=beginOfPage;  // 1
            int endnum=(beginOfPage + this.numPerPage) - 1;
            String range="r >= " + startnum + " and r <= " + endnum;

            sql.append(" SELECT bbsno, wname, subject, grpno, indent, ansnum, regdt, passwd, readcnt, ip, r");
            sql.append(" FROM(");
            sql.append("           SELECT bbsno, wname, subject, grpno, indent, ansnum, regdt, passwd, readcnt, ip, rownum as r");
            sql.append("           FROM (");
            sql.append("                      SELECT bbsno, wname, subject, grpno, indent, ansnum, regdt, passwd, readcnt, ip");
            sql.append("                      FROM tb_bbs ");
            sql.append("                      ORDER BY grpno DESC, ansnum ASC");
            sql.append("                      )");
            sql.append("            )");
            sql.append(" WHERE " + range); // WHERE r >= 1 and r <= 12
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            
            while (rs.next() == true) {            
                dto = new BbsDTO();               
                dto.setBbsno(rs.getInt("bbsno")); 
                dto.setWname(rs.getString("wname"));
                dto.setSubject(rs.getString("subject"));
                dto.setIndent(rs.getInt("indent"));
                dto.setRegdt(rs.getString("regdt"));
                dto.setPasswd(rs.getString("passwd"));
                dto.setReadcnt(rs.getInt("readcnt"));

                list.add(dto);
            }            
    	} catch(Exception e) {
    		System.out.println(e);
    	} finally{
    		DBClose.close(con,pstmt,rs);
    	}    	
    	return list; 
	}  //list(nowPage) end
	
	//���� �˻� ������ ���
		public ArrayList<BbsDTO> listSerch(int nowPage, String serchTxt, String key) {
			Connection con=null;
	    	PreparedStatement pstmt=null;
	    	ResultSet rs=null;
	    	StringBuffer sql=new StringBuffer();
	    	ArrayList<BbsDTO> list=new ArrayList<BbsDTO>();
	    	BbsDTO dto=new BbsDTO();
	    	String column="";
			if(key.equals("S1"))
			{
				column="subject like '%"+serchTxt+"%'";
			}	
			else if(key.equals("S2"))
			{
				column="subject like '%"+serchTxt+"%'"+" OR "+"content like '%"+serchTxt+"%'";
			}
			else if(key.equals("S3"))
			{
				column="wname like '%"+serchTxt+"%'";
			}
	    	//System.out.println(serchTxt);
	    	
			/* �־��� �������� ���� ���ڵ� ��ȣ
			����: ������ ���� ��ȣ�� 0���� ����
			���ڵ� ��ȣ�� 0���� ����
			   
			 1������: 0 * 10 = 0���� ����
			 2������: 1 * 10 = 10���� ���� 
			 3������: 2 * 10 = 20���� ����
			 4������: 3 * 10 = 30���� ����
			*/
	    	int beginOfPage=beginOfPage(nowPage);
	    	
	    	try{
	    		con=dbconn.getConnection();  
	    		
	            // ---------------------------------------------------
	            // ���ڵ带 ������ ���� ����
	            // ---------------------------------------------------
	            // 1 ������:  1 ~ 12   WHERE r >= 1 and r <= 12
	            // 2 ������: 13 ~ 24  WHERE r >= 13 and r <= 24
	            int startnum=beginOfPage;  // 1
	            int endnum=(beginOfPage + this.numPerPage) - 1;
	            String range="r >= " + startnum + " and r <= " + endnum;

	            sql.append(" SELECT bbsno, wname, subject, grpno, indent, ansnum, regdt, passwd, readcnt, ip, r");
	            sql.append(" FROM(");
	            sql.append("           SELECT bbsno, wname, subject, grpno, indent, ansnum, regdt, passwd, readcnt, ip, rownum as r");
	            sql.append("           FROM (");
	            sql.append("                      SELECT bbsno, wname, subject, grpno, indent, ansnum, regdt, passwd, readcnt, ip");
	            sql.append("                      FROM tb_bbs WHERE "+column);
	            sql.append("                      ORDER BY grpno DESC, ansnum ASC");
	            sql.append("                      )");
	            sql.append("            )");
	            sql.append(" WHERE " + range); // WHERE r >= 1 and r <= 12
	           //System.out.println(sql.toString());
	            pstmt = con.prepareStatement(sql.toString());
	            rs = pstmt.executeQuery();
	            
	            while (rs.next() == true) {            
	                dto = new BbsDTO();               
	                dto.setBbsno(rs.getInt("bbsno")); 
	                dto.setWname(rs.getString("wname"));
	                dto.setSubject(rs.getString("subject"));
	                dto.setIndent(rs.getInt("indent"));
	                dto.setRegdt(rs.getString("regdt"));
	                dto.setPasswd(rs.getString("passwd"));
	                dto.setReadcnt(rs.getInt("readcnt"));

	                list.add(dto);
	            }            
	    	} catch(Exception e) {
	    		System.out.println(e);
	    	} finally{
	    		DBClose.close(con,pstmt,rs);
	    	}    	
	    	return list; 
		}  //listSerch(nowPage) end
		
		//���� �˻� ������ ��� nowPage X
		public ArrayList<BbsDTO> listSerch(String serchTxt, String key) {
			Connection con=null;
	    	PreparedStatement pstmt=null;
	    	ResultSet rs=null;
	    	StringBuffer sql=new StringBuffer();
	    	ArrayList<BbsDTO> list=new ArrayList<BbsDTO>();
	    	BbsDTO dto=new BbsDTO();
	    	String column="";
			if(key.equals("S1"))
			{
				column="subject like '%"+serchTxt+"%'";
			}	
			else if(key.equals("S2"))
			{
				column="subject like '%"+serchTxt+"%'"+" OR "+"content like '%"+serchTxt+"%'";
			}
			else if(key.equals("S3"))
			{
				column="wname like '%"+serchTxt+"%'";
			}
	    	//System.out.println(serchTxt);
	    	
	    	try{
	    		con=dbconn.getConnection();  
			    sql.append(" SELECT bbsno, wname, subject, grpno, indent, ansnum, regdt, passwd, readcnt, ip");
			    sql.append(" FROM tb_bbs WHERE "+column);
			    sql.append(" ORDER BY grpno DESC, ansnum ASC");
			   //System.out.println(sql.toString());
			    pstmt = con.prepareStatement(sql.toString());
			    rs = pstmt.executeQuery();
			    
			   while (rs.next() == true) {            
				   dto = new BbsDTO();               
			       dto.setBbsno(rs.getInt("bbsno")); 
			       dto.setWname(rs.getString("wname"));
			       dto.setSubject(rs.getString("subject"));
			       dto.setIndent(rs.getInt("indent"));
			       dto.setRegdt(rs.getString("regdt"));
			       dto.setPasswd(rs.getString("passwd"));
			       dto.setReadcnt(rs.getInt("readcnt"));

			       list.add(dto);
			       }      
			   } catch(Exception e) {
				   System.out.println(e);
				   } finally{
			    		DBClose.close(con,pstmt,rs);
			 }    	
			return list; 
		}  //listSerch() end
	
    /**
     * �������� ���۷��ڵ��ȣ
     * nowPage: ���� ������ 
     * �������� ����� ���ڵ� �� ��
     * ���� ������ ��ȣ * �������� ���ڵ� ��
     * 1 Page = (0 * 12) + 1 --> 1
     * 2 Page = (1 * 12) + 1 --> 13
     * 3 Page = (2 * 12) + 1 --> 25
     * @param nowPage ���� ������
     * @return
     */
    public int beginOfPage(int nowPage){
        return (nowPage * this.numPerPage)+1;       
    }  //beginOfPage(nowPage) end	
    
    // ----------------------------------------------------------
    // ����¡ ���� �޼ҵ� ����
    // ----------------------------------------------------------
    public String paging(int nowPage,String fileName) {

        int pagePerBlock=this.pagePerBlock; //���� ������ �� �⺻���� 10������
        
        // �˻� ���ڵ�� ����
        int searchCount=recordCount();
        // ��ü ������ ����
        int totalPage=pageCount(searchCount);
        // ��ü �� ����
        int totalBlock=blockCount(totalPage);
        // ���� �� ����
        int nowBlock=nowBlock(nowPage);
        
        StringBuffer sb=new StringBuffer();
        
        // ����¡ ����
        if(searchCount > 0) { // ���ڵ尡 �����Ѵٸ�
            sb.append("[<a href=./" + fileName);
            sb.append("?nowPage=0"); 
            sb.append(">ó�� ������</a>]&nbsp;");            
            
            // ���� ������ �������� 11������ �̻��� ���
            // ���� 10������ ���
            // 0 Block:  1~10 page 
            // 1 Block: 11~20 page 
            if(nowBlock > 0) { // 1 �̻������� ������ �̵� ����
                // ���� 10�� ��ũ, ���� ������ �̵�
                // 1 Block --> ((1 - 1) * 10) =  0 Block page 0 
                // 2 Block --> ((2 - 1) * 10) =  1 Block page 10
                sb.append("[<a href=./" + fileName);
                sb.append("?nowPage=" + ((nowBlock-1)*pagePerBlock)); // ((2-1)*10)=10
                sb.append(">����"+ pagePerBlock+"��</a>] ::: ");
            }
            
            // ������ ��� ���
            for (int i = 0; i < pagePerBlock; i++) {
                sb.append("<a href=./" + fileName);
             // 1 page: ((0 * 10) + 0) = 0
             // 2 page: ((0 * 10) + 1) = 1
             // 3 page: ((0 * 10) + 2) = 2
             // 4 page: ((0 * 10) + 3) = 3
                sb.append("?nowPage=" + ((nowBlock*pagePerBlock) + i));
                sb.append(">");
                
             // ���� �������� ����ȭ�ؼ� ���  
                if(((nowBlock * pagePerBlock) + i)==nowPage) {
                    sb.append("<b><u>"+((nowBlock * pagePerBlock) + i + 1)+"</u></b></a>&nbsp;");
                }else{
                    sb.append(((nowBlock * pagePerBlock) + i + 1)+"</a>&nbsp;");
                }
                
                // ������ �������̸� ������ ��ȣ ����� ����
                // �������� 0���� ���������� +1���Ͽ� ������ ����������
                // �˻�
                if ((nowBlock * pagePerBlock) + i + 1 == totalPage) break;
            }
            
            // ���� 10�� ���
            // nowBlock�� 0���� ���������� +1���Ͽ� �� �̵����� ����
            if ( nowBlock + 1 < totalBlock) {
                // ���� ������ �̵� ��ũ
                sb.append(" ::: [<a href=./" + fileName);
                sb.append("?nowPage="+((nowBlock + 1) * pagePerBlock)); // (1+1)*10
                sb.append(">���� "+pagePerBlock+"��</a>]");
            }
            
            sb.append("[<a href=./" + fileName);
            
            // ������ 0���� ���������� -1�� ��.
            sb.append("?nowPage=" + (totalPage - 1)); 
            sb.append(">������ ������</a>]&nbsp;");            
        }        
        return sb.toString();
    }  //paging() end
    
    //���ڵ� ����
    public int recordCount()
    {
    	Connection con=null;
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	String sql="";
    	int res=0;
    	try{
    		con=dbconn.getConnection();
    		sql="SELECT count(*) FROM tb_bbs";
    		pstmt=con.prepareStatement(sql);
    		rs=pstmt.executeQuery();
    		if(rs.next()){
    			res=rs.getInt(1);
    		}
    	}catch(Exception e){}
    	finally{
    		DBClose.close(con,pstmt,rs);
    	}
    	return res;
    }  //recordCount() end
    
    /**
     * ��ü �������� ����, �ϳ��� �������� ���ڵ尡 1�� �־ �ϳ��� 
     * �������� ó���Ǿ�� �Ѵ�. ���� 0.1�� 1�� �ڸ��ø��Ѵ�.<br>
     * ���ڵ� 1��: 0.1 --> 1�� �ø�<br>
     * ���ڵ� 11��: 1.1 --> 2�� �ø�<br>
     * ���ڵ� 25��: 2.5 --> 3�� �ø�<br>
     * @param count �˻��� ���ڵ� ��
     * @return
     */
    public int pageCount(int count){
        double _count=(double)count; // �������� double�� ��ȯ
        // System.out.println(_count);    // 1.0, 11.0
        
        //  1.0 / 10 --> 0.1 --> 1.0, numPerPage: �������� ���ڵ� ��, 10 
        // 11.0 / 10 --> 1.1 --> 2.0 
        double retVal = Math.ceil( _count / this.numPerPage); 
        // System.out.println(retVal);    // 1.0, 2.0
        
        return (int)retVal;  // �Ҽ��� ©�����, 1, 2        
    
    }  //pageCount() end
    
    /**
     * ��ü �� �� 
     * @param count ������ ��
     * @return
     */
    public int blockCount(int count){
        double _count=(double)count;
        
        double retVal=Math.ceil(_count/this.pagePerBlock);
        
        return (int)(retVal);       
    }  //blockCount() end
    
    /**
     * ���� ������ �����մϴ�.
     * @param nowPage ���� ������ ��ȣ
     * @return ���� �� ��ȣ
     */
    public int nowBlock(int nowPage){
        int retVal = nowPage / this.pagePerBlock;
        // ���� �� = ���� ������/ ���� ������ ��
        //  1 -->  1 / 10 --> 0 Block
        // 11 --> 11 / 10 --> 1 Block
        // 15 --> 15 / 10 --> 1 Block
        // 21 --> 21 / 10 --> 2 Block
        
        return retVal;            
    }  //nowBlock() end    
    
}  //-----------------------------------------------class BbsDAO end
