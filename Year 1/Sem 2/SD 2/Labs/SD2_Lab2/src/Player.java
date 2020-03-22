/**
 * 
 */

/**
 * @author hkapa
 *
 */
public class Player {

	private  String name;
	private Room PlayerRoom;
	
	public Player(String playername, Room CurrentRoom)  {
		
		name = playername;
		PlayerRoom = CurrentRoom;
	}
	
	public String getName() {
		
		return  name;
	}
	
	public Room getRoom() {
		
		return PlayerRoom;
	}
	
 


}

