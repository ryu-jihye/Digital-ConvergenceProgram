package May_Four_05_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class SplitOutput {

	public static void main(String[] args) {
		//�Ʒ� ������ �ٸ� �̸��� �ڹ����Ϸ� �и��Ͽ� ������ ��
				//���, �̸�, ������ ������ �� �ִ� ���̺� emp1 ����(�ڹټҽ����� �ۼ�)
				//����ڰ� �Է��� ������ ���� ������(n �Է�) ���������� ���� ���� �Է��� ������ ���α׷� �����
				
					String n;
			        boolean tf = true;

					
					Scanner scan = new Scanner(System.in);
					
					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection conn = DriverManager.getConnection(
								"jdbc:oracle:thin:@localhost:1521:xe",
								"scott","tiger");
					
					//insert
					
					String sql="insert into emp1\r\n"
							+ "values(?, ?, ?)"; 
					
					PreparedStatement pstmt = conn.prepareStatement(sql);
					
					conn.setAutoCommit(false);

					
					while(tf) {

						
						System.out.print("���, �̸� ���� ������ �Է��Ͻÿ�.");
						pstmt.setInt(1, scan.nextInt());
						pstmt.setString(2, scan.next());
						pstmt.setInt(3, scan.nextInt());
						pstmt.execute();
						
						
						System.out.println("������ �߰��Ǿ����ϴ�.");
						System.out.println("�Է��� ����Ͻðڽ��ϱ�?(y/n)");
						
						n = scan.next();
			            if( n.equals("n")) {
			               tf = false;
			               conn.rollback();
			            }else if(n.equals("y")) {
			               conn.commit();
			            }else {
			               System.out.println("yn�Է��� �߸��Ͽ����ϴ�.");
			               continue;
			            }
					
					}
					} catch(ClassNotFoundException e) {
					System.out.println("JDBC ����̹� �ε� ����");
					} catch (SQLException e) {
					e.printStackTrace();
					}
				
				}
			
	}


