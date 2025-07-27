package _20250727;

import java.util.Random;
import java.util.Scanner;

public class ArithmeticQuizGame {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Random random = new Random();
		
		String str[] = {"+","-","*","/"};
		
		boolean a = true;
		while(a) {
			System.out.println("문제입니다!");
			int first = random.nextInt(10);
			int second =  random.nextInt(9)+1;
			int third = random.nextInt(4);
			int result = 0;
			System.out.printf("%d %s %d 의 값은?",first,str[third],second);
			 if(str[third].equals(str[0])) {
				 result = first + second;
				 String result2 = sc.nextLine();
				 if(result == Integer.parseInt(result2)) {
					 System.out.println("정답입니다.");
				 } else {
					 System.out.println("실패");
					 a = false;
				 }
			 } else if(str[third].equals(str[1])) {
				 result = first - second;
				 String result2 = sc.nextLine();
				 if(result == Integer.parseInt(result2)) {
					 System.out.println("정답입니다.");
				 } else {
					 System.out.println("실패");
					 a = false;
				 }
			 } else if(str[third].equals(str[2])){
				 result = first*second;
				 String result2 = sc.nextLine();
				 if(result == Integer.parseInt(result2)) {
					 System.out.println("정답입니다.");
				 } else {
					 System.out.println("실패");
					 a = false;
				 }
			 } else if(str[third].equals(str[3])) {
				 result = first / second;
				 String result2 = sc.nextLine();
				 if(result == Integer.parseInt(result2)) {
					 System.out.println("정답입니다.");
				 } else {
					 System.out.println("실패");
					 a = false;
				 }
			 }
		}
		
		
	}
}
