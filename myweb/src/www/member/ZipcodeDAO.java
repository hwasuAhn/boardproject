package www.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import www.utility.DBClose;

public class ZipcodeDAO {

	public ArrayList<ZipcodeDTO> list(Connection con, ZipcodeDTO dto)throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		ArrayList<ZipcodeDTO> list = null;
		
		String temp=" WHERE dongli like '%"+ dto.getDongli() +"%' ";
		sql+=" SELECT * FROM zipcode ";
		sql+=temp;
			
		System.out.println(sql);
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			list = new ArrayList<ZipcodeDTO>();
		
			do{
				dto=new ZipcodeDTO();
				dto.setZipcode(rs.getString("zipcode"));
				dto.setSido(rs.getString("sido"));
				dto.setGugun(rs.getString("gugun"));
				dto.setDongli(rs.getString("dongli"));
				dto.setEtc(rs.getString("etc"));				
				
				list.add(dto);
				
				System.out.println(dto);
				
			}while(rs.next());
		}
		DBClose.close(con, pstmt, rs);
		return list;		
	}  //list() end
	
}  //-------------------------------------class ZipcodeDAO end
