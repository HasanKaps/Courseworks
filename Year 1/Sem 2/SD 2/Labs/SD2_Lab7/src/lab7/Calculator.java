package lab7;

import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Calculator extends JFrame{
	private static final long serialVersionUID = 1L;
	private double accumalator;
	public Font font;
	private Font buttons;
	private JLabel AccumalatorBox;
	private JTextField Textbox;
	private JPanel buttonPanel;
	private JButton clear;
	private JButton add;
	private JButton minus;
	private JButton multiply;
	private JButton divide;
	
	public Calculator() {
		super("Calculator");
		setLayout(new GridLayout(3,1));
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		font = new Font("Serif", Font.PLAIN, 12);
		buttons = new Font("Serif",Font.BOLD, 14);
		Layout();
		setSize(400,400);
		setVisible(true);
	}
	
	public void Layout() {
	accumalator = 0;
	AccumalatorBox = new JLabel(Double.toString(accumalator), JLabel.RIGHT);
	add(AccumalatorBox);
	Textbox = new JTextField();
	Textbox.setHorizontalAlignment(JTextField.RIGHT);
	add(Textbox);
		
	buttonPanel = new JPanel();
	buttonPanel.setLayout(new GridLayout());
	
		clear = new JButton("Clear");
		clear.setFont(buttons);
		clear.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent clear) {
				accumalator =0;
				Textbox.setText("");
				AccumalatorBox.setText(Double.toString(accumalator));
			}
		});
		buttonPanel.add(clear);
		
		add = new JButton("+");
		add.setFont(buttons);
		add.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent add) {
				calc('+');
			}
		});
		buttonPanel.add(add);

		minus = new JButton("-");
		minus.setFont(buttons);
		minus.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent minus) {
				calc('-');
				
			}
		});
		buttonPanel.add(minus);
		
		multiply = new JButton("*");
		multiply.setFont(buttons);
		multiply.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent multiply) {
				calc('*');
			}
		});
		buttonPanel.add(multiply);
		
		divide = new JButton("/");
		divide.setFont(buttons);
		divide.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent divide) {
				calc('/');
				
			}
		});
		buttonPanel.add(divide);
		
		add(buttonPanel);
		}
	private void calc(char calculations) {
		try {
			
			double input = Double.valueOf(Textbox.getText());
			switch(calculations) {
			case '+':
				accumalator = accumalator + input;
				break;
			case '-':
				accumalator = accumalator - input;
				break;
			case'*': 
				accumalator = accumalator * input;
				break;
			case'/':
				if(input!=0) {
				accumalator = accumalator / input;
				} else {
					System.out.println("Cannot divide by 0");
					AccumalatorBox.setText("Cannot divide by 0");
				}
				break;
				default:
					AccumalatorBox.setText("Is not part of the possible calculations");
			}
			}
			catch (NumberFormatException exception) {
				AccumalatorBox.setText("Please retry with a numerical value");
			return;
			}
			finally {
				AccumalatorBox.setText(Double.toString(accumalator));
				Textbox.setText("");
				
			}
	}
	
	public static void main(String[] args) {
		new Calculator();
	}

}
