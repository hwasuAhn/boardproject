package www.member;

import java.sql.Connection;
import java.util.ArrayList;

import www.utility.ConnectionMgr;
import www.utility.DBClose;

public class ZipcodeMgr {

	ConnectionMgr dbconn=null;  //DBConnect dbconn=null;
	ZipcodeDAO dao=null;

	public ZipcodeMgr() {
		//DB���ᰪ�� ���� ��쿡�� ��ü����
		if(dbconn==null)
		{
			dbconn=new ConnectionMgr();
		}
	}  //�⺻ ������
	
	synchronized public ZipcodeDAO getDAO() {
		if(dao==null)
		{
			dao=new ZipcodeDAO();
		}
		return dao;
	}  //getDAO() end
	
	public ArrayList<ZipcodeDTO> list(ZipcodeDTO dto){
		Connection con = dbconn.getConnection();
		ArrayList<ZipcodeDTO> list = null;
		
		try{
			list = getDAO().list(con, dto);
		}catch(Exception e){
			System.out.println(e);
		}finally{
			DBClose.close(con);
		}
		return list;
	}  //list() end
	
}  //---------------------class ZipcodeMgr end
