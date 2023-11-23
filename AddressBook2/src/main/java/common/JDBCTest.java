package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCTest {

	public static void main(String[] args) {
		Connection conn = null;
		
		String driverClass = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		String user = "jweb";
		String pw = "pwjweb";
		
		//  위쪽에 있는 변수명을 그대로 삽입
		try {
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, user, pw);
			System.out.println("db연결 성공: " + conn);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
