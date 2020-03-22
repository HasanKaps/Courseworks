package lab8;

import java.awt.Font;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class GUI extends JFrame  {
	private static final long serialVersionUID = 1L;
	private Font font;
	private Font buttons;
	private JPanel scoreBoard;
	private JButton next;
	private JLabel score;
	private JPanel Questions;
	private JLabel questions;
	private JPanel Answers;
	private JButton Option1;
	private JButton Option2;
	private JButton Option3;
	private JButton Option4;
	private Questions q = new Questions();
	private int count =0;
	private int scoreCount = 0;

	
	public GUI() {
	super("GUI");
	setLayout(new GridLayout(4,1));
	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	font = new Font("Serif", Font.PLAIN, 12);
	buttons = new Font("Serif",Font.BOLD, 14);
	Layout();
	setSize(400,400);
	setVisible(true);
	}
	public void Layout() {
		score = new JLabel("Score : " + scoreCount);
		add(score);		
		
		Questions = new JPanel();
		Questions.setLayout(new GridBagLayout());
			questions = new JLabel(q.result.get(count++));
			Questions.add(questions);
			add(Questions);
			
		Answers = new JPanel();
		Answers.setLayout(new GridLayout(4,1));
		
			Option1 = new JButton(q.result.get(count++));
			Option1.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent a) {
					if(q.result.get(count).equals("1"))
					  {
						  scoreCount++;
						  score.setText("Score : "+scoreCount);
					  } 
			
				}
			});
			Option1.setFont(buttons);
			Answers.add(Option1);
			
			Option2 = new JButton(q.result.get(count++));
			Option2.setFont(buttons);
			Option2.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent b) {
					if(q.result.get(count).equals("2"))
					  {
						  scoreCount++;
						  score.setText("Score : "+scoreCount);
					  } 
	
				}
			});
			Answers.add(Option2);
			
			Option3 = new JButton(q.result.get(count++));
			Option3.setFont(buttons);
			Option3.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent d) {
					if(q.result.get(count).equals("3"))
					  {
						  scoreCount++;
						  score.setText("Score : "+scoreCount);
						  
					  } 

				}
			});
			Answers.add(Option3);
		
			Option4 = new JButton(q.result.get(count++));
			Answers.add(Option4);
			Option4.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent c) {
					if(q.result.get(count).equals("4"))
					  {
						  scoreCount++;
						  score.setText("Score : "+scoreCount);
					 
					  } 
					
				}
			});
			
			add(Answers);
			
		scoreBoard = new JPanel();
		scoreBoard.setLayout(new GridLayout(1,1));
		next = new JButton("Next");
		next.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent clear) {
				nextQ();
			}
		});
		scoreBoard.add(next);
		add(next);

	}
	public void nextQ() {
		if(count < 20)
		{
		count++;
		questions.setText(q.result.get(count++));
		Option1.setText(q.result.get(count++));
		Option2.setText(q.result.get(count++));
		Option3.setText(q.result.get(count++));
		Option4.setText(q.result.get(count++));
		} 
	}
	public void answers() {
		if(Option1.getText() == q.result.get(count = 2))
		scoreCount++;
	}
	
}
