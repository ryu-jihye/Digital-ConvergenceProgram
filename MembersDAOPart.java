public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
		String dbUserId = "scott"; 	String dbPwd = "tiger";
		Scanner scan = new Scanner(System.in);
		int menu=0;  //선택된 메뉴 저장용 변수
		//DB 연동에 필요한 객체들 참조변수 초기화 
		Connection conn = null; 
		PreparedStatement pstmt=null; 
		ResultSet rs = null; 
		//DML 작업에 필요한 변수들 초기화
		int userId = 0;
		String userPwd = null;
		Members mem = null; 
		List<Members> al = null;
		//DB 연결
		conn = getConnectivity(url, dbUserId, dbPwd);
		BREAK:
			while(true) {
				System.out.println("================================================");
				System.out.println("1.추가\t2.조회\t3.수정\t4.삭제\t5.모두 보기\t6.종료");
				System.out.println("================================================");
				System.out.println("메뉴를 선택하시오 >>");
				menu = scan.nextInt();
				switch(menu) {
				case 1: //추가 
					System.out.println("비밀번호, 이름, 이메일, 전화번호 순으로 입력하시오>> ");
					mem = new Members(scan.next(), scan.next(), scan.next(), scan.next() );
					insertMember(conn, pstmt, mem); 
					break;
				case 2: //조회 
					System.out.println("검색할 회원의 이름을 입력하시오>> ");
					al = getMembers(conn, pstmt, rs, scan.next()); 
					showAll(al); 
					break;
				case 3: //수정
					System.out.println("수정할 회원의 아이디와 비밀번호를 입력하시오>> ");
					userId = scan.nextInt(); userPwd=scan.next();
					if(isMember(conn, pstmt, rs, userId, userPwd)) {
						System.out.println("비밀번호, 이름, 이메일, 전화번호 순으로 입력하시오>> ");
						mem = new Members(userId, scan.next(), scan.next(), scan.next(), scan.next() );
						updateMembers(conn, pstmt, mem);
					}
					else {System.out.println("존재하지 않는 회원입니다."); 
					}
					break;
				case 4: //삭제
					System.out.println("삭제할 회원의 이름과 비밀번호를 입력하시오>> ");
					userId = scan.nextInt(); userPwd=scan.next();
					if(isMember(conn, pstmt, rs, userId, userPwd)) {
						System.out.println("비밀번호, 이름, 이메일, 전화번호 순으로 입력하시오>> ");
						mem = new Members(userId, scan.next(), scan.next(), scan.next(), scan.next() );
						deleteMembers(conn, pstmt, userId);
						}
					else {System.out.println("존재하지 않는 회원입니다."); 
					} break;
				case 5: //모두보기 
					al = getMemberListAll(conn, pstmt, rs); 
					showAll(al); 
					break;
				case 6:
					break BREAK;
				}
			}