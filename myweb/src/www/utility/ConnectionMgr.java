package www.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 데이터베이스 접속 관리
 */
public class ConnectionMgr{

    /** 데이터베이스 접속 커넥션 모드를 정의 
     *  1: Connection Pool 사용 안함
     *  2: DBCP Connection Pool 사용
     */    
    int connectionMode=1; 
    
    /**
     * 기본 생성자
     */
    public ConnectionMgr() {
        super();
    }
    
    public ConnectionMgr(int connectionMode){
        this.connectionMode = connectionMode;
    }

    /**
     * DBMS에 연결하여 Connection 객체 리턴
     * @return
     */
    public Connection getConnection(){
        Connection con = null;
        try {
            if ( connectionMode == 1 ){ // Pool 사용 안함
                DBConnect dbconnect = new DBConnect();
                con = dbconnect.getConnection();
                System.out.println("ConnectionMode 1: " + con.hashCode());
            } else if ( connectionMode == 2 ){ // Pool 사용
                // ora10g2 은 web.xml의 registerPool 변수의 값이어야 함  
                String poolName = "jdbc:apache:commons:dbcp:ora10g2";
                con = DriverManager.getConnection(poolName);
                System.out.println("ConnectionMode 2: " + con.hashCode());
            }
        } catch(SQLException ex) {
            ex.printStackTrace();
        } finally {
        }
        return con;
    }
}

