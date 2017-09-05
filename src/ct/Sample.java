package ct;

public class Sample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(args[0]);
		Sample s = new Sample();
		s.method1(num);
		
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



