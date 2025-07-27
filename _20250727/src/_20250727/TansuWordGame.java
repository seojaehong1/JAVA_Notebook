package _20250727;

import java.util.Scanner;

public class TansuWordGame {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String x[] = {"탕", "수", "육"};
		boolean run = true;
		Scanner sc = new Scanner(System.in);
		
		int index = 0;
		while(run) {
			System.out.println("다음 단어를 입력해주세요");
			String y = sc.nextLine();
			
			String ee = x[index];
			if(!y.equals(ee)) {
				System.out.println("땡 틀렸습니다");
				break;
			}
			
			index = (index+1)%x.length;
			
			String computer = x[index];
			System.out.println(computer);
			
			index = (index+1)%x.length;
		}
	}

}
