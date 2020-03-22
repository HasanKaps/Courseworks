import java.awt.Color;
import java.awt.GridLayout;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import java.util.Scanner;

public class PercentageIncrementBar extends JFrame {
private static final long serialVersionUID = 1L;
private JPanel Meter;
private JLabel Line [];
private JLabel increment;
private String next;
Scanner scan;


	public PercentageIncrementBar() {
		super("Percentage Meter");
	//	setLayout(new GridLayout());
		Meter();
		setSize(200,700);
		setVisible(true);
		Increment();
		
	}
	public void Meter() {
		Meter = new JPanel();
		Meter.setLayout(new GridLayout (11,1));
		Line = new JLabel[10];
		for(int i=0; i <10; i++) {
			Line[i] = new JLabel();
			Line[i].setBackground(Color.red);
			Line[i].setOpaque(true);
			Meter.add(Line[i]);
		}
		increment = new JLabel("0%", JLabel.CENTER);
		Meter.add(increment);
		add(Meter);
	}
	public void Increment() {
		scan = new Scanner(System.in);
	while(true) {
		for (int k = 0; k<10;k++) {
			 scan.nextLine();
			Line[k].setBackground(Color.green);
			increment.setText((k+1)*10+"%");
		}
		break;
		
	}
	scan.close();
	}
	
	public String getNext() {
		
		return next;
	}
	public void setNext(String next) {
		this.next = next;
	}
	public static void main(String[] args) {
	
		new PercentageIncrementBar();
	}

}