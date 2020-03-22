import java.util.Scanner;

/**
 * A program that asks a series of questions to determine
 * whether the user is eligible to vote in a UK general election.
 * @author Michael Lones, Heriot-Watt University
 */
public class VoteEligibility {

	public static void main(String[] args) {
		// first, declare variables
		int age;
		boolean isUKorIrish = false;
		boolean isCommonwealth = false;
		
		// obtain information from the user
		Scanner scan = new Scanner(System.in);
		System.out.println("Please enter your age in years: ");
		age = scan.nextInt();
		
		System.out.println("Are you a UK or Irish citizen? (true/false)");
		isUKorIrish = scan.nextBoolean();
		
		if(!isUKorIrish) {
			// we only need to ask this if we know they are not UK or Irish citizens
			System.out.println("Are you a Commonwealth citizen and resident in the UK? (true/false)");
			isCommonwealth = scan.nextBoolean();
		}
		
		// summarise what the user entered
		System.out.println("You are "+age+" years old.");
		if(isUKorIrish)
			System.out.println("You are a UK or Irish citizen.");
		else {
			if(isCommonwealth)
				System.out.println("You are a resident Commonwealth citizen.");
			else
				System.out.println("You are not a UK, Irish, or resident Commonwealth citizen.");
		}
		
		// indicate whether the user is eligible to vote
		if(age >= 18 && (isUKorIrish || isCommonwealth)) {
			System.out.println("You can vote!");
		}
		else {
			System.out.print("Sorry, you are not eligible to vote.");
		}
	}
}
