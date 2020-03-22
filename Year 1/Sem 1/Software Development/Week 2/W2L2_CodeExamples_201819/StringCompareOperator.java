import java.util.Scanner;

/**
 * Showing that you can't use Boolean operators with Strings
 * @author Michael Lones, Heriot-Watt University
 */
public class StringCompareOperator {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String a = scan.next();
		System.out.println( a == "hello" );
	}

}
