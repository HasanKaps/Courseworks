/**
 *   Example of a for loop nested in another for loop.
 *   @author Michael Lones, Heriot-Watt University
 */
public class NestedForLoop {

	public static void main(String[] args) {
		for(int i=1; i<=3; i++)
			for(int j=1; j<=5; j++)
				System.out.print(""+i+","+j+" ");
	}

}
