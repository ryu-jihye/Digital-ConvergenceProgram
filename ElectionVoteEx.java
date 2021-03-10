package May_Second_ch03;

class ElectionVote extends Thread{
    public ElectionVote(String name) {
        super(name);
    }
    @Override
    public void run() {
        int limit = 0; //50% 초과하지 못하도록 제한
        String stars = ""; //별 모양(*) 제한 변수
        String stars50 = "";
        
        while(limit<50) {
            int num = (int)(Math.random()*10+1); //while문 밖에다가 두면 숫자가 하나로 고정됨
        
        
        for(int i=0; i<50; i++) {
            stars50 = stars50 + "*";
        } //100초과 시 별모양 추가됨
        
        for(int i=0; i<num; i++) {
            stars = stars + "*";
        }//100이하에서 별모양 추가
        
        limit = limit + num; //0에서 num을 계속 더함
        
        if(limit>50) {
            System.out.printf("%s : %d%%(%d) %s\n", getName(), 50, num, stars50);
        } else {
            System.out.printf("%s : %d%%(%d) %s\n", getName(), limit, num, stars);
        }
        try {
            Thread.sleep((long)(Math.random()*10000));
        } catch(InterruptedException e) {
            return;
        }
        
        }
    }
}


public class ElectionVoteEx {


    public static void main(String[] args) {
        ElectionVote ev1 = new ElectionVote("제1반");
        ElectionVote ev2 = new ElectionVote("제2반");
        ElectionVote ev3 = new ElectionVote("제3반");
        ElectionVote ev4 = new ElectionVote("제4반");
        
        ev1.start();
        ev2.start();
        ev3.start();
        ev4.start();


    }


}
