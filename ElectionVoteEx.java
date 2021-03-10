package May_Second_ch03;

class ElectionVote extends Thread{
    public ElectionVote(String name) {
        super(name);
    }
    @Override
    public void run() {
        int limit = 0; //50% �ʰ����� ���ϵ��� ����
        String stars = ""; //�� ���(*) ���� ����
        String stars50 = "";
        
        while(limit<50) {
            int num = (int)(Math.random()*10+1); //while�� �ۿ��ٰ� �θ� ���ڰ� �ϳ��� ������
        
        
        for(int i=0; i<50; i++) {
            stars50 = stars50 + "*";
        } //100�ʰ� �� ����� �߰���
        
        for(int i=0; i<num; i++) {
            stars = stars + "*";
        }//100���Ͽ��� ����� �߰�
        
        limit = limit + num; //0���� num�� ��� ����
        
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
        ElectionVote ev1 = new ElectionVote("��1��");
        ElectionVote ev2 = new ElectionVote("��2��");
        ElectionVote ev3 = new ElectionVote("��3��");
        ElectionVote ev4 = new ElectionVote("��4��");
        
        ev1.start();
        ev2.start();
        ev3.start();
        ev4.start();


    }


}
