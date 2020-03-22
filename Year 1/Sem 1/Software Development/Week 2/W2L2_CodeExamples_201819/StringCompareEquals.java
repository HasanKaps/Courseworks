import java.util.Scanner;

/**
 * Showing how you compare Strings
 * @author Michael Lones, Heriot-Watt University
 */
public class StringCompareEquals {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String a = scan.next();
		System.out.println( a.equals("hello") );
	}

}
