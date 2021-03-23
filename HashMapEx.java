package May_Four02_Review;


import java.util.HashMap;
import java.util.Scanner;


public class HashMapEx {

   public static void main(String[] args) {
      
      Scanner scan = new Scanner(System.in);
      HashMap<String, Integer> nations = new HashMap<String, Integer>();
      
      System.out.println("나라와 인구를 순서대로 입력하시오 >> ");
      
      for(int i=0; i<5; i++) {
         String nation = scan.next();
         int people = scan.nextInt();
         
         nations.put(nation, people); //해시맵 나라이름과 인구 저장
      
         }
      
      for(int i=0; i<5; i++) {
      System.out.println("나라를 입력하시오 >> ");
      String nation = scan.next();
      if(nations.containsKey(nation)) {
         System.out.println(nation + "의 인구수는 " + nations.get(nation) + "명입니다");
      } else {
         System.out.println(nation + " 나라는 없습니다.");
      }
      
      }

      scan.close();
   }

}
