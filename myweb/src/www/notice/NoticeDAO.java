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
	
	/** 페이지당 출력할 레코드 수 */
	public int numPerPage=5;
	/** 블럭당 출력 페이지 수 */
	private int pagePerBlock=10;
	
	public int countList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		
		try {
			con = dbconn.getConnection();
			
			sql += "select count(*) from tb_notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return count;
	}
	
	public ArrayList<NoticeDTO> list() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		ArrayList<NoticeDTO> list=null;
		NoticeDTO dto=null;
		
		try {
			con=dbconn.getConnection();  //DB연결
			
			//1차 : 그룹번호는 내림차순 2차 : 글순서는 오름차순 정렬
			sql+=" SELECT * From tb_notice ";  //쿼리문 작성
			sql+=" ORDER BY noticeno DESC ";
			pstmt=con.prepareStatement(sql);  //쿼리문 생성
			rs=pstmt.executeQuery();  //쿼리문 실행
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
	
	//메인 페이지 목록
	public ArrayList<NoticeDTO> listMain() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		ArrayList<NoticeDTO> list=null;
		NoticeDTO dto=null;
		
		try {
			con=dbconn.getConnection();  //DB연결
			
			//1차 : 그룹번호는 내림차순 2차 : 글순서는 오름차순 정렬
			sql+="SELECT noticeno, subject, content, regdt, r FROM(SELECT noticeno, subject, content, regdt, rownum as r FROM(SELECT * From tb_notice ";  //쿼리문 작성
			sql+=" ORDER BY noticeno DESC)) WHERE r<6 ";
			pstmt=con.prepareStatement(sql);  //쿼리문 생성
			rs=pstmt.executeQuery();  //쿼리문 실행
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
	
	//현재 페이지 목록
		public ArrayList<NoticeDTO> list(int nowPage) {
			Connection con=null;
	    	PreparedStatement pstmt=null;
	    	ResultSet rs=null;
	    	StringBuffer sql=new StringBuffer();
	    	ArrayList<NoticeDTO> list=new ArrayList<NoticeDTO>();
	    	NoticeDTO dto=new NoticeDTO();
	    	
			/* 주어진 페이지의 시작 레코드 번호
			조건: 페이지 시작 번호는 0부터 시작
			레코드 번호도 0부터 시작
			   
			 1페이지: 0 * 10 = 0부터 시작
			 2페이지: 1 * 10 = 10부터 시작 
			 3페이지: 2 * 10 = 20부터 시작
			 4페이지: 3 * 10 = 30부터 시작
			*/
	    	int beginOfPage=beginOfPage(nowPage);
	    	
	    	try{
	    		con=dbconn.getConnection();  
	    		
	            // ---------------------------------------------------
	            // 레코드를 추출할 범위 생성
	            // ---------------------------------------------------
	            // 1 페이지:  1 ~ 12   WHERE r >= 1 and r <= 12
	            // 2 페이지: 13 ~ 24  WHERE r >= 13 and r <= 24
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
	     * 페이지의 시작레코드번호
	     * nowPage: 현재 페이지 
	     * 페이지당 출력할 레코드 수 ★
	     * 현재 페이지 번호 * 페이지당 레코드 수
	     * 1 Page = (0 * 12) + 1 --> 1
	     * 2 Page = (1 * 12) + 1 --> 13
	     * 3 Page = (2 * 12) + 1 --> 25
	     * @param nowPage 현재 페이지
	     * @return
	     */
	    public int beginOfPage(int nowPage){
	        return (nowPage * this.numPerPage)+1;       
	    }  //beginOfPage(nowPage) end	
	    
	    // ----------------------------------------------------------
	    // 페이징 관련 메소드 시작
	    // ----------------------------------------------------------
	    public String paging(int nowPage,String fileName) {

	        int pagePerBlock=this.pagePerBlock; //블럭당 페이지 수 기본값은 10페이지
	        
	        // 검색 레코드수 산출
	        int searchCount=recordCount();
	        // 전체 페이지 산출
	        int totalPage=pageCount(searchCount);
	        // 전체 블럭 산출
	        int totalBlock=blockCount(totalPage);
	        // 현재 블럭 산출
	        int nowBlock=nowBlock(nowPage);
	        
	        StringBuffer sb=new StringBuffer();
	        
	        // 페이징 시작
	        if(searchCount > 0) { // 레코드가 존재한다면
	            sb.append("[<a href=./" + fileName);
	            sb.append("?nowPage=0"); 
	            sb.append(">처음 페이지</a>]&nbsp;");            
	            
	            // 현재 나열된 페이지가 11페이지 이상일 경우
	            // 이전 10페이지 출력
	            // 0 Block:  1~10 page 
	            // 1 Block: 11~20 page 
	            if(nowBlock > 0) { // 1 이상임으로 이전블럭 이동 가능
	                // 이전 10개 링크, 이전 블럭으로 이동
	                // 1 Block --> ((1 - 1) * 10) =  0 Block page 0 
	                // 2 Block --> ((2 - 1) * 10) =  1 Block page 10
	                sb.append("[<a href=./" + fileName);
	                sb.append("?nowPage=" + ((nowBlock-1)*pagePerBlock)); // ((2-1)*10)=10
	                sb.append(">이전"+ pagePerBlock+"개</a>] ::: ");
	            }
	            
	            // 페이지 목록 출력
	            for (int i = 0; i < pagePerBlock; i++) {
	                sb.append("<a href=./" + fileName);
	             // 1 page: ((0 * 10) + 0) = 0
	             // 2 page: ((0 * 10) + 1) = 1
	             // 3 page: ((0 * 10) + 2) = 2
	             // 4 page: ((0 * 10) + 3) = 3
	                sb.append("?nowPage=" + ((nowBlock*pagePerBlock) + i));
	                sb.append(">");
	                
	             // 현재 페이지는 차별화해서 출력  
	                if(((nowBlock * pagePerBlock) + i)==nowPage) {
	                    sb.append("<b><u>"+((nowBlock * pagePerBlock) + i + 1)+"</u></b></a>&nbsp;");
	                }else{
	                    sb.append(((nowBlock * pagePerBlock) + i + 1)+"</a>&nbsp;");
	                }
	                
	                // 마지막 페이지이면 페이지 번호 출력을 종료
	                // 페이지는 0부터 시작임으로 +1을하여 마지막 페이지인지
	                // 검사
	                if ((nowBlock * pagePerBlock) + i + 1 == totalPage) break;
	            }
	            
	            // 다음 10개 출력
	            // nowBlock은 0부터 시작임으로 +1을하여 블럭 이동여부 결정
	            if ( nowBlock + 1 < totalBlock) {
	                // 다음 블럭으로 이동 링크
	                sb.append(" ::: [<a href=./" + fileName);
	                sb.append("?nowPage="+((nowBlock + 1) * pagePerBlock)); // (1+1)*10
	                sb.append(">다음 "+pagePerBlock+"개</a>]");
	            }
	            
	            sb.append("[<a href=./" + fileName);
	            
	            // 페이지 0부터 시작임으로 -1을 함.
	            sb.append("?nowPage=" + (totalPage - 1)); 
	            sb.append(">마지막 페이지</a>]&nbsp;");            
	        }        
	        return sb.toString();
	    }  //paging() end
	    
	    //레코드 갯수
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
	     * 전체 페이지수 산출, 하나의 페이지는 레코드가 1개 있어도 하나의 
	     * 페이지로 처리되어야 한다. 따라서 0.1을 1로 자리올림한다.<br>
	     * 레코드 1개: 0.1 --> 1로 올림<br>
	     * 레코드 11개: 1.1 --> 2로 올림<br>
	     * 레코드 25개: 2.5 --> 3로 올림<br>
	     * @param count 검색된 레코드 수
	     * @return
	     */
	    public int pageCount(int count){
	        double _count=(double)count; // 정수형을 double로 변환
	        // System.out.println(_count);    // 1.0, 11.0
	        
	        //  1.0 / 10 --> 0.1 --> 1.0, numPerPage: 페이지당 레코드 수, 10 
	        // 11.0 / 10 --> 1.1 --> 2.0 
	        double retVal = Math.ceil( _count / this.numPerPage); 
	        // System.out.println(retVal);    // 1.0, 2.0
	        
	        return (int)retVal;  // 소수점 짤라버림, 1, 2        
	    
	    }  //pageCount() end
	    
	    /**
	     * 전체 블럭 수 
	     * @param count 페이지 수
	     * @return
	     */
	    public int blockCount(int count){
	        double _count=(double)count;
	        
	        double retVal=Math.ceil(_count/this.pagePerBlock);
	        
	        return (int)(retVal);       
	    }  //blockCount() end
	    
	    /**
	     * 현재 블럭수를 리턴합니다.
	     * @param nowPage 현재 페이지 번호
	     * @return 현재 블럭 번호
	     */
	    public int nowBlock(int nowPage){
	        int retVal = nowPage / this.pagePerBlock;
	        // 현재 블럭 = 현재 페이지/ 블럭당 페이지 수
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
				con=dbconn.getConnection();  //DB연결
				sql="";  //sql변수 값 초기화
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
				con=dbconn.getConnection();  //DB연결
				sql+=" SELECT * FROM tb_notice ";
				sql+=" WHERE noticeno=? ";
				pstmt=con.prepareStatement(sql);  //쿼리문 생성
				pstmt.setInt(1, noticeno);
				rs=pstmt.executeQuery();  //쿼리문 실행			
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
					System.out.println("관련 게시글 없음");
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
				con=dbconn.getConnection();  //DB연결			
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
				con=dbconn.getConnection();  //DB연결
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
				con=dbconn.getConnection();  //DB연결
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
