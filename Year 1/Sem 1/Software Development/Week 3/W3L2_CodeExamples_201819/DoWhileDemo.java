import java.util.Scanner;

/** A simple demonstration of a do...while loop.
* @author Michael Lones, Heriot-Watt University
*/
public class DoWhileDemo {
	public static void main(String[] args) {
		int input;
		Scanner scan = new Scanner(System.in);

		do {
			System.out.println("Please enter a number between 1 and 5");
			input = scan.nextInt();
		} while(input<1 || input>5);
		System.out.println("You entered "+input);
	}
}
