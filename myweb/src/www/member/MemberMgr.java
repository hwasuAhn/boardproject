package www.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import www.utility.ConnectionMgr;
import www.utility.DBClose;

public class MemberMgr {

	ConnectionMgr dbconn=null;  //DBConnect dbconn=null;
	MemberDAO dao=null;
	
	/** �������� ����� ���ڵ� �� */
	public int numPerPage=10;
	/** ���� ��� ������ �� */
	private int pagePerBlock=10;
	
	public MemberMgr() {
		//DB���ᰪ�� ���� ��쿡�� ��ü����
		if(dbconn==null)
		{
			dbconn=new ConnectionMgr();
		}
	}  //�⺻ ������
	
	synchronized public MemberDAO getDAO() {
		if(dao==null)
		{
			dao=new MemberDAO();
		}
		return dao;
	}  //getDAO() end
	
	//ȸ������
	public int insert(MemberDTO dto) {
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
	
	//���̵� �ߺ� Ȯ��
	public int duplicatedid(String id) {
		Connection con=dbconn.getConnection();  //DB����
		int res=0;
		try {
			res=getDAO().duplicatedid(con, id);
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con);
		}  //try end
		return res;
	}  //duplicatedid() end
	
	//�̸��� �ߺ� Ȯ��
		public int duplicatedemail(String email) {
			Connection con=dbconn.getConnection();  //DB����
			int res=0;
			try {
				res=getDAO().duplicatedemail(con, email);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}  //try end
			return res;
		}  //duplicatedemail() end
		
		//ȸ�� �α���
		public MemberDTO loginproc(MemberDTO dto) {
			Connection con=dbconn.getConnection();
			//int res=0;
			try {
				dto=getDAO().loginproc(con, dto);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}  //try end
			return dto;
		}  //loginproc() end
		
		//������ ȸ�� �α���
			public MemberDTO adminloginproc(MemberDTO dto) {
				Connection con=dbconn.getConnection();
				//int res=0;
				try {
					dto=getDAO().adminloginproc(con, dto);
				} catch(Exception e) {
					System.out.println(e);
				} finally {
					DBClose.close(con);
				}  //try end
				return dto;
			}  //loginproc() end
	
		//ȸ�� Ż��
		public int delete(MemberDTO dto) {
			Connection con=dbconn.getConnection();
			int res=0;
			try {
				res=getDAO().delete(con, dto);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}
			return res;
		}  //delete() end
		
		//������ ȸ�� Ż��
		public int delete(String id) {
			Connection con=dbconn.getConnection();
			int res=0;
			try {
				res=getDAO().delete(con, id);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}
			return res;
		}  //delete(id) end
		
		//ȸ������ ������
		public MemberDTO updateform(MemberDTO dto) {
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
		
		//ȸ������ ����
		public int updateproc(MemberDTO dto) {
			Connection con=dbconn.getConnection();
			int res=0;
			try {
				res=getDAO().updateproc(con, dto);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}
			return res;
		}  //updateproc() end
		
		//������ ȸ������ ������
		public MemberDTO editform(MemberDTO dto) {
			Connection con=dbconn.getConnection();
			//int res=0;
			try {
				dto=getDAO().editform(con, dto);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}
			return dto;
		}  //updateform() end
		
		//������ ȸ������ ����
		public int update(MemberDTO dto) {
			Connection con=dbconn.getConnection();
			int res=0;
			try {
				res=getDAO().update(con, dto);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}
			return res;
		}  //delete(id) end
		
		//ȸ�� ����Ʈ
		public ArrayList<MemberDTO> list() {
			Connection con=dbconn.getConnection();  //DB����
			ArrayList<MemberDTO> list=null;
			
			try {
				list=getDAO().list(con);
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con);
			}  //try end
			return list;
		}  //list() end
		
		//ȸ�� ����Ʈ ������
		/*public ArrayList<MemberDTO> list(int nowPage) {
			Connection con=dbconn.getConnection();
			int res=0;
			ArrayList<MemberDTO> list=null;
			try {
				list=getDAO().list(con,nowPage);
			}catch(Exception e) {
				System.out.println(e);
			}finally{
				DBClose.close(con);
			}
			return list;
		}  //end*/

		
		public ArrayList<MemberDTO> list(int nowPage) {
			Connection con=null;
	    	PreparedStatement pstmt=null;
	    	ResultSet rs=null;
	    	StringBuffer sql=new StringBuffer();
	    	ArrayList<MemberDTO> list=new ArrayList<MemberDTO>();
	    	MemberDTO dto=new MemberDTO();
	    	
			/* �־��� �������� ���� ���ڵ� ��ȣ
			����: ������ ���� ��ȣ�� 0���� ����
			���ڵ� ��ȣ�� 0���� ����
			   
			 1������: 0 * 10 = 0���� ����
			 2������: 1 * 10 = 10���� ���� 
			 3������: 2 * 10 = 20���� ����
			 4������: 3 * 10 = 30���� ���� */
			
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

	            sql.append(" SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate, r");
	            sql.append(" FROM(");
	            sql.append("           SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate, rownum as r");
	            sql.append("           FROM (");
	            sql.append("                      SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate ");
	            sql.append("                      FROM member ");
	            sql.append("                      WHERE mlevel<>'F' ");
	            sql.append("                      ORDER BY id");
	            sql.append("                      )");
	            sql.append("            )");
	            sql.append(" WHERE " + range); // WHERE r >= 1 and r <= 12
	            pstmt = con.prepareStatement(sql.toString());
	            rs = pstmt.executeQuery();
	            
	            while (rs.next() == true) {            
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
	    		sql="SELECT count(*) FROM member WHERE mlevel <> 'F' ";
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
	    
	    public int pageCount(int count){
	        double _count=(double)count; // �������� double�� ��ȯ
	        // System.out.println(_count);    // 1.0, 11.0
	        
	        //  1.0 / 10 --> 0.1 --> 1.0, numPerPage: �������� ���ڵ� ��, 10 
	        // 11.0 / 10 --> 1.1 --> 2.0 
	        double retVal = Math.ceil( _count / this.numPerPage); 
	        // System.out.println(retVal);    // 1.0, 2.0
	        
	        return (int)retVal;  // �Ҽ��� ©�����, 1, 2        
	    
	    }  //pageCount() end
	    
	    public int blockCount(int count){
	        double _count=(double)count;
	        
	        double retVal=Math.ceil(_count/this.pagePerBlock);
	        
	        return (int)(retVal);       
	    }  //blockCount() end
	    
	    public int nowBlock(int nowPage){
	        int retVal = nowPage / this.pagePerBlock;
	        // ���� �� = ���� ������/ ���� ������ ��
	        //  1 -->  1 / 10 --> 0 Block
	        // 11 --> 11 / 10 --> 1 Block
	        // 15 --> 15 / 10 --> 1 Block
	        // 21 --> 21 / 10 --> 2 Block
	        
	        return retVal;            
	    }  //nowBlock() end  
	    
	    
}  //class MemberMgr end
