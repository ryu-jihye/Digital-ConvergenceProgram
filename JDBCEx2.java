package May_Fifth01_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCEx2 {

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//DB������ �����۾� -> DriverManager Ŭ������ getConnection �̿�
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = DriverManager.getConnection(url, "scott","tiger");
			
			//Statement �����ϱ� : �ڹ����α׷��� DB������ SQL���� �����ϰ� DB�� ó���� ����� �ٽ� �ڹ� ���α׷��� ����
			Statement stmt = conn.createStatement();
			
			//SQL �����ϱ� 
			//test ���̺� �����ϱ�
			stmt.executeUpdate("create table test"
					+ "(id varchar2(5), pwd varchar(5))");
			
			stmt.executeUpdate("insert into test values('aa','11')");
			stmt.executeUpdate("insert into test values('bb','22')");
			stmt.executeUpdate("insert into test values('cc','33')");
			
			ResultSet rs = stmt.executeQuery("select * from test");
			
			while(rs.next()) {
				System.out.print(rs.getString("id")+":"+rs.getString(2)); 
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
			 } catch(ClassNotFoundException e) {
		         System.out.println("JDBC ����̹� �ε� ����");
		     } catch (SQLException e) {
		         System.out.println("DB ���� ����");
		     }
	}

}
