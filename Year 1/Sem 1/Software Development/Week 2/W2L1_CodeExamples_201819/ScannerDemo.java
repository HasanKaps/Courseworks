import java.util.Scanner;

/**
 * Simple demonstration of reading input from a user.
 * @author Michael Lones, Heriot-Watt University
 */
public class ScannerDemo {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String input = scan.nextLine();
		System.out.println("Your input: " + input);
	}

}
