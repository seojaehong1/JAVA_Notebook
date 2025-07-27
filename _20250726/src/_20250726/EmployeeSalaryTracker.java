package _20250726;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalTime;
import java.util.Scanner;

public class EmployeeSalaryTracker {
	public static void main(String[] args) {
		Connection con = null;
		Scanner scan = new Scanner(System.in);
		int hour =0;
		int minute =0;
		int second =0;
		try {
			String id ="root";
			String pw ="1234";
			String url="jdbc:mysql://localhost:3309/sakila";
			int start = 0;
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con = DriverManager.getConnection(url, id, pw);
			Statement stmt = con.createStatement();
			System.out.println("이름을 입력하세요");
			String sql = scan.nextLine();
			boolean x = true;
			int sal =0;
			double ss = 0;
			double sum = 0;
			double secondsum =0;
			ResultSet rs = stmt.executeQuery("select sal from emp where ename = '" + sql + "'");
			if(rs.next()) {
				sal = rs.getInt("sal");
				System.out.println("월급은" + sal*1300 + "원");
				
			} else {
				System.out.println("해당이름의 직원이 없습니다.");
			}
			
			while(x) {
			System.out.println("업무 시작1 업무 종료2 오늘 급여3 총 급여계산기4 입력주세요");
			String choice = scan.nextLine();
			start = Integer.parseInt(choice);
			
			
		
			
			
		
			if (start==1) {
				hour =0;
				minute =0;
				second=0;
				java.time.LocalDateTime now = java.time.LocalDateTime.now();
				hour = now.getHour();
				minute = now.getMinute();
				second = now.getSecond();
				
				System.out.println(now);
				System.out.printf("시작시간 %d시 %d분 %d초\n", hour, minute, second);
		
				
			} 
			if (start==2) {
				java.time.LocalDateTime now = java.time.LocalDateTime.now();
				int endhour = now.getHour();
				int endminute = now.getMinute();
				int endsecond = now.getSecond();
				secondsum = (double)(endhour-hour)*3600 +(double)(endminute-minute)*60 + (double)(endsecond-second);
				int secondtohour = endhour*3600;
				int secondtominute = endminute*60;
				int secondtosecond =endsecond;
				
				hour = hour*3600;
				minute = minute*60;
				
				int endsecondplus = secondtohour + secondtominute + secondtosecond;
				int secondplus = hour + minute+second;
				int total = endsecondplus - secondplus;
				
				System.out.printf("종료시간 %d시 %d분 %d초\n 총업무시간 %d시 %d분 %d초\n", endhour,
						endminute, endsecond, total/3600, total%3600/60, total%3600%60);
			
				ss = (double)sal / 20 / 8 / 60 / 60 * secondsum *1300;
			}
			if (start==3) {
				 
				System.out.printf("오늘의 급여%f \n",ss);
				
			}
			if (start==4) {
				sum += ss;
				System.out.printf("그동안의 급여 %f \n",sum);
			}
			}
		
			
			
			
			
			
			
		} catch(Exception e) {
			System.out.println("로딩실패");
		}
	}	
			
			
			
}
 