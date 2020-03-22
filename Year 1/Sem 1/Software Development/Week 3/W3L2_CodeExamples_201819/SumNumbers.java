import java.util.Scanner;

/**
 * Adds up some numbers entered by the user.
 * @author Michael Lones, Heriot-Watt University
 */
public class SumNumbers {
	
	// max number of number user can enter
	static final int MAX = 10;
	
	public static void main(String[] args) {
		int sum = 0; // running total
		int input;   // number entered by user
		
		System.out.println("Enter up to "+MAX+" numbers to sum");
		System.out.println("(enter 0 to finish early)");
		Scanner scan = new Scanner(System.in);
		for(int i=0; i<MAX; i++) {
			input = scan.nextInt();
			if(input==0) break; // exit loop if input is 0
			sum += input; // add input to sum
		}
		
		System.out.println("Total: "+sum);
	}
}
