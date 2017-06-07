package www.utility;

import java.sql.Connection;
import java.sql.DriverManager;
/*import java.sql.PreparedStatement;
import java.sql.ResultSet;*/

public class DBConnect {
	
	//�����ͺ��̽� ���� Ŭ����
	public DBConnect() {}  //�⺻������
	
	public Connection getConnection() {	
		//����Ŭ DB ���� ����
		/*String url="jdbc:oracle:thin://@127.0.0.1:1521:xe";
		String driver="oracle.jdbc.driver.OracleDriver";
		String user="user201303";
		String password="1234";*/
		
		String url="jdbc:oracle:thin:@52.79.149.80:1521:xe";
		String driver="oracle.jdbc.driver.OracleDriver";
		String user="totoro";
		String password="totoro123";
			
		Connection con=null;
		
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
		} catch(Exception e) {
			System.out.println(e);
		} 
		
		return con;  //DB���ᰪ ����
	}  //getConnection end	
	
}  //----------------------class DBConnect end
