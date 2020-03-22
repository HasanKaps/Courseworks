/**
 * Is this letter a vowel or a consonant? (if...else version)
 * @author Michael Lones, Heriot-Watt University
 */
public class VowelConsonantIf {

	public static void main(String[] args) {
		String letter = "a";
		letter = letter.toUpperCase();
		
		// Note that you can't use the quality operator (==)
		// to determine if two strings are equal. This is because
		// String is a reference type rather than a primitive type.
		// For reference types, == compares the memory address of
		// the variables rather than their content.
		
		if(letter.equals("A") || letter.equals("E") ||
		   letter.equals("I") || letter.equals("O") ||
		   letter.equals("U"))
		   System.out.println("Vowel");
		else
			System.out.println("Consonant");
	}

}
