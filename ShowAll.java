package May_Fifth02;

public class ShowAll {

	public static void main(String[] args) {
		

	}

}

//Members 객체 리스트의 정보들을 모두 출력
private static void showAll(List<Members> al) {
		List<Members> members = al;
		
		for(Members m : members) {
			System.out.println(m.toString());
		}
	
}