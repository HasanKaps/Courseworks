/**
 * Is this letter a vowel or a consonant? (switch...case version)
 * @author Michael Lones, Heriot-Watt University
 */
public class VowelConsonantSwitch {

	public static void main(String[] args) {
		String letter = "a";
		
		// Note that we don't use the String variable directly,
		// but rather use its toUpperCase() method, which returns
		// a new String containing the upper case version. This
		// saves us from having separate cases for upper and lower
		// case letters.
		
		// The first four cases do not have break statements,
		// causing execution to run on until the "U" case. This
		// saves us having to code an output for each case.
		
		switch(letter.toUpperCase()) {
			case "A":
			case "E":
			case "I":
			case "O":
			case "U": System.out.println("Vowel");
					  break;
			default:  System.out.println("Consonant");
		}
	}

}
