/**
 * Demonstration of a more complex if statement.
 * @author Michael Lones, Heriot-Watt University
 */
public class ComplicatedCount {

	public static void main(String[] args) {
		int i, j;
		for(i=100, j=1; i>0; i=i-j, j++) {
			System.out.print(i+" ");
		}
	}

}
