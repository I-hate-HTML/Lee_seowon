package semi.common;

public class HomeCalendar {
	
	// 1. 년도를 넘겨받아 윤년=true,평년=false를 리턴하는 메소드
	public static boolean isLeapYear(int year) {
		// 윤년, 평년 판별식
		// 4로 나누어지고 100으로 나누었을 때 딱 떨어지지 않으면 윤년
		// 아니면 평년		
		// 이건 윤년 구하는 공식
		return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;		
	}
	
	// 2. 년, 월을 넘겨받아 그 달의 마지막 날짜를 리턴하는 메소드
	public static int lastDay(int year, int month) {
		int m[] = {31,28,31,30,31,30,31,31,30,31,30,31};
		m[1] = isLeapYear(year) ? 29 : 28; // 2월 마지막 날짜
		return m[month - 1]; // month도 0부터 시작이라서 -1, 그에 해당하는 배열 가져옴
	}
	
	// 3. 년, 월, 일을 념겨받아 1-1-1부터 지난날수 합계 리턴하는 메소드
	public static int totalDay(int year, int month, int day) {
		// 1년 1월 1일 부터 전년도 12월 31일까지 지나온 날 수 합계 계산
		int sum = (year-1) * 365 + (year-1) / 4 - (year-1)/100 + (year-1) / 400;
		// 전년도 까지 지나온 날짜의 합계에 전달까지 지나온 날짜를 더한다
		for (int i=1; i < month; i++) {
			sum += lastDay(year, i);
		}
		return sum + day;
	}
	
	// 4. 년, 월, 일을 넘겨받아 요일을 숫자로 리턴하는 메소드
	// 일요일(0), 월요일(1) ...
	public static int weekDay(int year, int month, int day) {
		return totalDay(year, month, day) % 7;
	}
	

}
