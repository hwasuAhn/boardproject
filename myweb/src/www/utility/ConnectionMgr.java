package www.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * �����ͺ��̽� ���� ����
 */
public class ConnectionMgr{

    /** �����ͺ��̽� ���� Ŀ�ؼ� ��带 ���� 
     *  1: Connection Pool ��� ����
     *  2: DBCP Connection Pool ���
     */    
    int connectionMode=1; 
    
    /**
     * �⺻ ������
     */
    public ConnectionMgr() {
        super();
    }
    
    public ConnectionMgr(int connectionMode){
        this.connectionMode = connectionMode;
    }

    /**
     * DBMS�� �����Ͽ� Connection ��ü ����
     * @return
     */
    public Connection getConnection(){
        Connection con = null;
        try {
            if ( connectionMode == 1 ){ // Pool ��� ����
                DBConnect dbconnect = new DBConnect();
                con = dbconnect.getConnection();
                System.out.println("ConnectionMode 1: " + con.hashCode());
            } else if ( connectionMode == 2 ){ // Pool ���
                // ora10g2 �� web.xml�� registerPool ������ ���̾�� ��  
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

