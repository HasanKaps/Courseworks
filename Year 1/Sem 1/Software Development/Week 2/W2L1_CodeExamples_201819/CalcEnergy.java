/**
 * Applies the formula e = mc^2 to some values.
 * @author Michael Lones, Heriot-Watt University
 */
public class CalcEnergy {

	public static void main(String[] args) {
		double mass = 25.457;
		double c = 3e8; // 3x10^8 in Java
		double energy = mass * (c * c);
		System.out.println(energy);
	}

}
