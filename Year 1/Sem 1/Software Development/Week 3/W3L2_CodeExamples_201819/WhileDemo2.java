import java.util.Scanner;

/**
 * Another simple demonstration of a while loop.
 * @author Michael Lones, Heriot-Watt University
 */
public class WhileDemo2 {

	public static void main(String[] args) {
		String input = "";
		Scanner scan = new Scanner(System.in);
		System.out.println("Type stop to stop");
		while(!input.equals("stop")) {
			input = scan.nextLine();
		}
		System.out.println("Stopped!");
	}

}
