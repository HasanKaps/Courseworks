/**
 * Simple demonstration of defining and using a constant.
 * @author Michael Lones, Heriot-Watt University
 */
public class ConstantDemo {
	static final int DAYS_IN_YEAR = 365;

	public static void main(String[] args) {
		int age = 18;
		int days = age * DAYS_IN_YEAR;
		System.out.println("I am " + days + " days old.");
	}
}
