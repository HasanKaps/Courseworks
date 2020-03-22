+package Lab3.Network;

public class EventPost extends Post{

	private String Eventtype;
	
	public EventPost(String author, String EventType) {
	
		super(author);
		this.Eventtype = EventType;
	
	}
	
	public String getEventType() {
		
		return  Eventtype;
	}

	public void display() {
		
		super.display();
		
		System.out.println("Event");
	}

}
