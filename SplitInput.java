package May_Four_05_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SplitInput {

	public static void main(String[] args) {
		//�Ʒ� ������ �ٸ� �̸��� �ڹ����Ϸ� �и��Ͽ� ������ ��
		//���, �̸�, ������ ������ �� �ִ� ���̺� emp1 ����(�ڹټҽ����� �ۼ�)
		//����ڰ� �Է��� ������ ���� ������(n �Է�) ���������� ���� ���� �Է��� ������ ���α׷� �����
				
				
				System.out.println("���, �̸�, ���� ������ �Է��Ͻÿ�");
				Connection conn = null; //�ʱ�ȭ
				PreparedStatement pstmt = null; //�ʱ�ȭ
				String sql=null; //�ʱ�ȭ
				ResultSet rs = null; //�ʱ�ȭ
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					conn = DriverManager.getConnection(
							"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
					
					//���̺� ����
					sql="create table emp1(\r\n"
							+ "empno number, \r\n"
							+ "ename varchar2(15),\r\n"
							+ "sal number\r\n"
							+ ")"; 
					
					
					pstmt = conn.prepareStatement(sql);
					pstmt.execute();
					
					
					sql = "select * from emp1";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();

					
					while(rs.next()) {
						System.out.print(rs.getString(1));
						System.out.print(" "+rs.getString(2));
						System.out.println(" " +rs.getString(3));
					}
					
				} catch(ClassNotFoundException e) {
					System.out.println("JDBC ����̹� �ε� ����");
				} catch (SQLException e) {
					e.printStackTrace();
					}

	}

}
