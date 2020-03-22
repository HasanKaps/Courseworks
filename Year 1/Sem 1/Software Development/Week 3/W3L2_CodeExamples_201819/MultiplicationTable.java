import java.util.Scanner;

/**
 * Displays a multiplication table for a given number on the terminal.
 * @author Michael Lones, Heriot-Watt University
 */
public class MultiplicationTable {

	public static void main(String[] args) {
		// variable declarations
		int table;    // multiplicand
		int maxvalue; // largest multiplier
		int product;  // multiplier x multiplicand
		
		// get input from user
		Scanner scan = new Scanner(System.in);
		System.out.println("What number would you like to produce a table for?");
		table = scan.nextInt();
		System.out.println("What is the maximum multiplier for the table?");
		maxvalue = scan.nextInt();

		// output table
		System.out.println("Multiplication table for "+table);
		for(int value=1; value<=maxvalue; value++) {
			product = table * value;
			System.out.println(table+" x "+value+" = "+product);
		}
	}

}
