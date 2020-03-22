/**
 * Simple demonstration of an if statement within a for loop.
 * @author Michael Lones, Heriot-Watt University
 */
public class EvenOdd {

	public static void main(String[] args) {
		for(int num=1; num<=5; num++) {
			
			if(num % 2 == 0) // uses the modulus operator %
				System.out.println(num+" is even");
			else
				System.out.println(num+" is odd");
			
		}
	}

}
