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
			//DB연결값이 없을 경우에만 객체생성
			if(dbconn==null)
			{
				dbconn=new ConnectionMgr();
			}
		}  //기본 생성자
		
		synchronized public PdsDAO getDAO() {
			if(dao==null)
			{
				dao=new PdsDAO();
			}
			return dao;
		}  //getDAO() end
		
		//파일등록
		public int insert(PdsDTO dto) {
			Connection con=dbconn.getConnection();  //DB연결
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
		
		//상세보기
		public PdsDTO read(int pdsno) {
			Connection con=dbconn.getConnection();  //DB연결
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
		
		//조회수 증가
		public void increment(int pdsno) {
			Connection con=null;
			PreparedStatement pstmt=null;
			String sql="";
			int res=0;
			
			try {
				con=dbconn.getConnection();  //DB연결
				sql+=" UPDATE tb_pds ";
				sql+=" SET readcnt=readcnt+1 ";
				sql+=" WHERE pdsno=? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, pdsno);
				res=pstmt.executeUpdate();
				if(res==0)
				{
					System.out.println("조회수 증가 실패");
				}
			} catch(Exception e) {
				System.out.println(e);
			} finally {
				DBClose.close(con, pstmt);
			}  //try end
		}  //increment() end
		
		//삭제
		public int delete(PdsDTO dto) {
			Connection con=dbconn.getConnection();  //DB연결
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
		
		//관리자 삭제
		public int admindelete(PdsDTO dto) {
			Connection con=dbconn.getConnection();  //DB연결
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
		
		//파일업로드 수정폼
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
		
		//관리자 파일업로드 수정폼
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
		
		//파일업로드 수정
		public int updateproc(PdsDTO dto) {
			Connection con=dbconn.getConnection();  //DB연결
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
		
		//파일 목록
		public ArrayList<PdsDTO> list() {
			Connection con=dbconn.getConnection();  //DB연결
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
		
		//메인 파일 목록
		public ArrayList<PdsDTO> listMain() {
			Connection con=dbconn.getConnection();  //DB연결
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
		
		/** 페이지당 출력할 레코드 수 */
		public int numPerPage=4;
		/** 블럭당 출력 페이지 수 */
		private int pagePerBlock=10;
		
		//현재 페이지 목록
		public ArrayList<PdsDTO> list(int nowPage) {
			Connection con=null;
	    	PreparedStatement pstmt=null;
	    	ResultSet rs=null;
	    	StringBuffer sql=new StringBuffer();
	    	ArrayList<PdsDTO> list=new ArrayList<PdsDTO>();
	    	PdsDTO dto=new PdsDTO();
	    	
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
	
}  //--------------class PdsMgr end
