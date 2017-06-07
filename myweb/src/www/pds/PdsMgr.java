package www.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import www.utility.ConnectionMgr;
import www.utility.DBClose;

public class PdsMgr {

		ConnectionMgr dbconn=null;  //DBConnect dbconn=null;
		PdsDAO dao=null;

		public PdsMgr() {
			//DB���ᰪ�� ���� ��쿡�� ��ü����
			if(dbconn==null)
			{
				dbconn=new ConnectionMgr();
			}
		}  //�⺻ ������
		
		synchronized public PdsDAO getDAO() {
			if(dao==null)
			{
				dao=new PdsDAO();
			}
			return dao;
		}  //getDAO() end
		
		//���ϵ��
		public int insert(PdsDTO dto) {
			Connection con=dbconn.getConnection();  //DB����
			int res=0;
			try {
				res=getDAO().insert(con, dto);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}  //try end
			return res;
		}  //insert() end
		
		//�󼼺���
		public PdsDTO read(int pdsno) {
			Connection con=dbconn.getConnection();  //DB����
			PdsDTO dto=null;
			increment(pdsno);
			try {
				dto=getDAO().read(con, pdsno);
				
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}  //try end
			return dto;
		}  //read() end
		
		//��ȸ�� ����
		public void increment(int pdsno) {
			Connection con=null;
			PreparedStatement pstmt=null;
			String sql="";
			int res=0;
			
			try {
				con=dbconn.getConnection();  //DB����
				sql+=" UPDATE tb_pds ";
				sql+=" SET readcnt=readcnt+1 ";
				sql+=" WHERE pdsno=? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, pdsno);
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
		
		//����
		public int delete(PdsDTO dto) {
			Connection con=dbconn.getConnection();  //DB����
			int res=0;
			try {
				res=getDAO().delete(con, dto);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}  //try end
			return res;
		}  //delete() end
		
		//������ ����
		public int admindelete(PdsDTO dto) {
			Connection con=dbconn.getConnection();  //DB����
			int res=0;
			try {
				res=getDAO().admindelete(con, dto);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}  //try end
			return res;
		}  //admindelete() end
		
		//���Ͼ��ε� ������
		public PdsDTO updateform(PdsDTO dto) {
			Connection con=dbconn.getConnection();
			//int res=0;
			try {
				dto=getDAO().updateform(con, dto);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}
			return dto;
		}  //updateform() end
		
		//������ ���Ͼ��ε� ������
		public PdsDTO adminupdateform(PdsDTO dto) {
			Connection con=dbconn.getConnection();
			//int res=0;
			try {
				dto=getDAO().adminupdateform(con, dto);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}
			return dto;
		}  //adminupdateform() end		
		
		//���Ͼ��ε� ����
		public int updateproc(PdsDTO dto) {
			Connection con=dbconn.getConnection();  //DB����
			int res=0;
			try {
				res=getDAO().updateproc(con, dto);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}  //try end
			return res;
		}  //updateproc() end
		
		//���� ���
		public ArrayList<PdsDTO> list() {
			Connection con=dbconn.getConnection();  //DB����
			ArrayList<PdsDTO> list=null;
			
			try {
				list=getDAO().list(con);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}  //try end
			return list;
		}  //list() end
		
		//���� ���� ���
		public ArrayList<PdsDTO> listMain() {
			Connection con=dbconn.getConnection();  //DB����
			ArrayList<PdsDTO> list=null;
			
			try {
				list=getDAO().listMain(con);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}  //try end
			return list;
		}  //listMain() end
		
		/** �������� ����� ���ڵ� �� */
		public int numPerPage=4;
		/** ���� ��� ������ �� */
		private int pagePerBlock=10;
		
		//���� ������ ���
		public ArrayList<PdsDTO> list(int nowPage) {
			Connection con=null;
	    	PreparedStatement pstmt=null;
	    	ResultSet rs=null;
	    	StringBuffer sql=new StringBuffer();
	    	ArrayList<PdsDTO> list=new ArrayList<PdsDTO>();
	    	PdsDTO dto=new PdsDTO();
	    	
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

	            sql.append(" SELECT pdsno, wname, subject, regdate, passwd, readcnt, filename, filesize, r");
	            sql.append(" FROM(");
	            sql.append("           SELECT pdsno, wname, subject, regdate, passwd, readcnt, filename, filesize, rownum as r");
	            sql.append("           FROM (");
	            sql.append("                      SELECT pdsno, wname, subject, regdate, passwd, readcnt, filename, filesize ");
	            sql.append("                      FROM tb_pds ");
	            sql.append("                      ORDER BY pdsno DESC");
	            sql.append("                      )");
	            sql.append("            )");
	            sql.append(" WHERE " + range); // WHERE r >= 1 and r <= 12
	            pstmt = con.prepareStatement(sql.toString());
	            rs = pstmt.executeQuery();
	            
	            while (rs.next() == true) {            
	                dto = new PdsDTO();               
	                dto.setPdsno(rs.getInt("pdsno")); 
	                dto.setWname(rs.getString("wname"));
	                dto.setSubject(rs.getString("subject"));
	                dto.setRegdate(rs.getString("regdate"));
	                dto.setPasswd(rs.getString("passwd"));
	                dto.setReadcnt(rs.getInt("readcnt"));
	                dto.setFilename(rs.getString("filename"));
	                dto.setFilesize(rs.getInt("filesize"));
	                
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
	    		sql="SELECT count(*) FROM tb_pds";
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
	
}  //--------------class PdsMgr end
