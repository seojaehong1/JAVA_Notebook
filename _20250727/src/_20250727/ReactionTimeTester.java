package _20250727;

import java.util.Random;
import java.util.Scanner;

public class ReactionTimeTester {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		boolean xx = true;
		while(xx) {
		System.out.println("반응속도 테스트입니다.\n 시작을 원하실 경우 1을 입력해주세요");
		Scanner sc = new Scanner(System.in);
		String start = sc.nextLine();
		Random random = new Random();
		
		if(start.equals("1")) {
	
			System.out.println("1부터10까지의 숫자가 표시됩니다.\n 그숫자를 입력하세요.");
			int x = random.nextInt(10)+1;
			System.out.println(x);
			long startTime = System.currentTimeMillis();
			String result = sc.nextLine();
			if(x==Integer.parseInt(result)) {
				long endTime = System.currentTimeMillis();
				
				System.out.println("정답입니다. \n 당신의 반응속도는"+(endTime-startTime)+"ms입니다");
			} else {
				System.out.println("정답이 아니므로 반응속도를 계산하지 않았습니다.");
				xx = false;
			}
			}
		}
	}

}
