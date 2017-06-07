package www.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import www.notice.NoticeDTO;
import www.utility.DBClose;
import www.utility.DBConnect;

public class NoticeDAO {

	private DBConnect dbconn=null;

	public NoticeDAO() {
		dbconn=new DBConnect();
	}
	
	/** �������� ����� ���ڵ� �� */
	public int numPerPage=5;
	/** ���� ��� ������ �� */
	private int pagePerBlock=10;
	
	public ArrayList<NoticeDTO> list() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		ArrayList<NoticeDTO> list=null;
		NoticeDTO dto=null;
		
		try {
			con=dbconn.getConnection();  //DB����
			
			//1�� : �׷��ȣ�� �������� 2�� : �ۼ����� �������� ����
			sql+=" SELECT * From tb_notice ";  //������ �ۼ�
			sql+=" ORDER BY noticeno DESC ";
			pstmt=con.prepareStatement(sql);  //������ ����
			rs=pstmt.executeQuery();  //������ ����
			if(rs.next())
			{
				list=new ArrayList<NoticeDTO>();
				do {
					dto=new NoticeDTO();
					dto.setNoticeno(rs.getInt("noticeno"));
					/*dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setRegdt(rs.getString("regdt"));*/
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
	
	//���� ������ ���
	public ArrayList<NoticeDTO> listMain() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		ArrayList<NoticeDTO> list=null;
		NoticeDTO dto=null;
		
		try {
			con=dbconn.getConnection();  //DB����
			
			//1�� : �׷��ȣ�� �������� 2�� : �ۼ����� �������� ����
			sql+="SELECT noticeno, subject, content, regdt, r FROM(SELECT noticeno, subject, content, regdt, rownum as r FROM(SELECT * From tb_notice ";  //������ �ۼ�
			sql+=" ORDER BY noticeno DESC)) WHERE r<6 ";
			pstmt=con.prepareStatement(sql);  //������ ����
			rs=pstmt.executeQuery();  //������ ����
			if(rs.next())
			{
				list=new ArrayList<NoticeDTO>();
				do {
					dto=new NoticeDTO();
					dto.setNoticeno(rs.getInt("noticeno"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setRegdt(rs.getString("regdt"));
					list.add(dto);
				} while(rs.next());
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}  //listMain end
	
	//���� ������ ���
		public ArrayList<NoticeDTO> list(int nowPage) {
			Connection con=null;
	    	PreparedStatement pstmt=null;
	    	ResultSet rs=null;
	    	StringBuffer sql=new StringBuffer();
	    	ArrayList<NoticeDTO> list=new ArrayList<NoticeDTO>();
	    	NoticeDTO dto=new NoticeDTO();
	    	
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

	            sql.append(" SELECT noticeno, subject, regdt, r");
	            sql.append(" FROM(");
	            sql.append("           SELECT noticeno, subject, regdt, rownum as r");
	            sql.append("           FROM (");
	            sql.append("                      SELECT noticeno, subject, regdt");
	            sql.append("                      FROM tb_notice ");
	            sql.append("                      ORDER BY noticeno DESC ");
	            sql.append("                      )");
	            sql.append("            )");
	            sql.append(" WHERE " + range); // WHERE r >= 1 and r <= 12
	            pstmt = con.prepareStatement(sql.toString());
	            rs = pstmt.executeQuery();
	            
	            while (rs.next() == true) {            
	                dto = new NoticeDTO();               
	                dto.setNoticeno(rs.getInt("noticeno"));
	                dto.setSubject(rs.getString("subject"));
	                dto.setRegdt(rs.getString("regdt"));
	                list.add(dto);
	            }            
	    	} catch(Exception e) {
	    		System.out.println(e);
	    	} finally{
	    		DBClose.close(con,pstmt,rs);
	    	}    	
	    	return list; 
		}  //list(nowPage) end
		
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
	    		sql="SELECT count(*) FROM tb_notice";
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
	    
	    public int insert(NoticeDTO dto) {
			Connection con=null;
			PreparedStatement pstmt=null;
			String sql="";
			int res=0;
			
			try {
				con=dbconn.getConnection();  //DB����
				sql="";  //sql���� �� �ʱ�ȭ
				sql+=" INSERT INTO tb_notice(noticeno, subject, content) ";
				sql+=" VALUES(noticeno_seq.nextval, ?, ?) ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, dto.getSubject());
				pstmt.setString(2, dto.getContent());
				res=pstmt.executeUpdate();			
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con, pstmt);
			}  //try end
			return res;
		}  //insert() end
	    
	    public NoticeDTO read(int noticeno) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="";
			NoticeDTO dto=null;
			
			try {
				con=dbconn.getConnection();  //DB����
				sql+=" SELECT * FROM tb_notice ";
				sql+=" WHERE noticeno=? ";
				pstmt=con.prepareStatement(sql);  //������ ����
				pstmt.setInt(1, noticeno);
				rs=pstmt.executeQuery();  //������ ����			
				if(rs.next())
				{	
					dto=new NoticeDTO();
					dto.setNoticeno(rs.getInt("noticeno"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setRegdt(rs.getString("regdt"));
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
	    
	    public int delete(NoticeDTO dto) {
			Connection con=null;
			PreparedStatement pstmt=null;
			String sql="";
			int res=0;
			
			try {			
				con=dbconn.getConnection();  //DB����			
				sql+=" DELETE FROM tb_notice ";
				sql+=" WHERE noticeno=? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, dto.getNoticeno());
				res=pstmt.executeUpdate();			
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con, pstmt);
			}  //try end
			return res;
		}  //delete() end
	    
	    public NoticeDTO updateform(NoticeDTO dto) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="";
			
			try {
				con=dbconn.getConnection();  //DB����
				sql+=" SELECT subject, content FROM tb_notice";
				sql+=" WHERE noticeno=? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, dto.getNoticeno());
				rs=pstmt.executeQuery();
				if(rs.next())
				{
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
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
	    
	    public boolean update(NoticeDTO dto) {
			Connection con=null;
			PreparedStatement pstmt=null;
			String sql="";
			int res=0;
			boolean flag=false;
			
			try {
				con=dbconn.getConnection();  //DB����
				sql+=" UPDATE tb_notice ";
				sql+=" SET subject=?, content=? ";
				sql+=" WHERE noticeno=? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, dto.getSubject());
				pstmt.setString(2, dto.getContent());
				pstmt.setInt(3, dto.getNoticeno());
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
	    
}  //------------------------------------class NoticeDAO end
