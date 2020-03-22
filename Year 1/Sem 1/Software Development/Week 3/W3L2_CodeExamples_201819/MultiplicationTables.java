import java.util.Scanner;

/**
 * Displays multiplication tables for a given range of numbers on the terminal.
 * @author Michael Lones, Heriot-Watt University
 */
public class MultiplicationTables {

	public static void main(String[] args) {
		// variable declarations
		int maxtable; // largest multiplicand
		int maxvalue; // largest multiplier
		int product;  // multiplier x multiplicand
		
		// get input from user
		Scanner scan = new Scanner(System.in);
		System.out.println("What number would you like to produce tables up to?");
		maxtable = scan.nextInt();
		System.out.println("What is the maximum multiplier for each table?");
		maxvalue = scan.nextInt();
		
		// output tables
		for(int table=1; table<=maxtable; table++) {
			System.out.println("Multiplication table for "+table);
			
			for(int value=1; value<=maxvalue; value++) {
				product = table * value;
				System.out.println(table+" x "+value+" = "+product);
			}
			System.out.println(); // a blank line to separate tables
		}
	}

}
