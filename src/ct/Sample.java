package ct;

public class Sample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num1 = Integer.parseInt(args[0]);
	//	int num2 = Integer.parseInt(args[1]);
		Sample s = new Sample();
		s.primeNumBetweenRange(10, 20);
	}
	
	//**********How to get the prime numbers between a given range.*************
	public void primeNumBetweenRange(int low, int high) {
		
	}
	
	//***********Factorial of a given number***********
	public void factorialOfNumber(int num) {
		int fact = num;
		for (int i = num; i > 1; i--) {
			fact *= (i - 1);
		}
		System.out.println("Factorial of a given nuber is : " + fact);
	}
	
	//*********Swapping Numbers without using 3rd variable************
	public void swappingTwoNumwithoutThird(int num1, int num2) {
		System.out.println("Before swapping: " + num1 +" , "+ num2);
		num1 = num1 + num2;
		num2 = num1 - num2;
		num1 = num1 - num2;
		System.out.println("After swapping: " + num1 +" , "+ num2);
	}

	//*********Program one***********************
	//54545
	//45454
	//54545
	//45454
	//54545
	public void method1(int num) {
		int count = 0;
		for (int i = 0; i < num; i++) {
			for (int j = 0; j < num; j++) {
				if (count % 2 == 0) {
					System.out.print(num);
				} else {
					System.out.print(num - 1);
				}
				count++;
			}
			System.out.println();
		}
	}
	
	//*********Program Two***********************
	//12345
	//1234
	//123
	//12
	//1

}



