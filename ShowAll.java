package May_Fifth02;

public class ShowAll {

	public static void main(String[] args) {
		

	}

}

//Members ��ü ����Ʈ�� �������� ��� ���
private static void showAll(List<Members> al) {
		List<Members> members = al;
		
		for(Members m : members) {
			System.out.println(m.toString());
		}
	
}