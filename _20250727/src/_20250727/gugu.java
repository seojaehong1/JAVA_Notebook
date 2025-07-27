package _20250727;



public class gugu {
	public static void main(String[] args) {
		for(int k=1; k<=7; k+=3) {
			for(int q=k; q<k+3; q++) {
				System.out.printf("\t\t %d단 \t\t\t",q);
			}
			System.out.println();
		
		
			for(int i=1; i<=9; i++) {
				for(int q=k; q<k+3; q++) {
					System.out.printf("%d * %d = %2d\t", i,q,i*q);
			}
		}
	}
	}
}



