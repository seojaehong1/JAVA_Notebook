package _20250727;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class BarrelGame {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		Random random = new Random();
		System.out.println("1번부터 12번까지의 열쇠가 있습니다. 열쇠를 선택해주세요");
		int x = random.nextInt(12)+1;
		ArrayList<Integer> chosekey = new ArrayList<>();
		
		boolean d = true;
		while(d) {
			System.out.println("몇번 열쇠를 선택하시겠습니까?");
			int y = Integer.parseInt(sc.nextLine());
			
			if(chosekey.contains(y)) {
				System.out.println("이미선택된 번호입니다.");
				 continue;
			}
			chosekey.add(y);
			if (x==y) {
				System.out.println("통아저씨가 튀어올랐습니다.");
				d =false;
			} else if(x!=y) {
				int k=0;
				
				
				System.out.println("통아저씨가 잠잠합니다.");
			} 
		}
	}

}
