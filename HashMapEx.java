package May_Four02_Review;


import java.util.HashMap;
import java.util.Scanner;


public class HashMapEx {

   public static void main(String[] args) {
      
      Scanner scan = new Scanner(System.in);
      HashMap<String, Integer> nations = new HashMap<String, Integer>();
      
      System.out.println("����� �α��� ������� �Է��Ͻÿ� >> ");
      
      for(int i=0; i<5; i++) {
         String nation = scan.next();
         int people = scan.nextInt();
         
         nations.put(nation, people); //�ؽø� �����̸��� �α� ����
      
         }
      
      for(int i=0; i<5; i++) {
      System.out.println("���� �Է��Ͻÿ� >> ");
      String nation = scan.next();
      if(nations.containsKey(nation)) {
         System.out.println(nation + "�� �α����� " + nations.get(nation) + "���Դϴ�");
      } else {
         System.out.println(nation + " ����� �����ϴ�.");
      }
      
      }

      scan.close();
   }

}
