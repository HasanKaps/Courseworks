package Lab3.Network;



public class CommentedPost extends Post{
	
	private String likes;
	private String comments;
	
	public CommentedPost(String author, String likes, String comments) {
		
		super (author);
		this.comments = comments;
		this.likes = likes;
		
	}

	public String getComments() {
		
		return comments;

	}

	public String getLikes() {
		
		return likes;
		
	}

	public void display() {
		
		super.display();
		
		System.out.println("Comment Subscribe");
		System.out.println("Like");
		
	}

}