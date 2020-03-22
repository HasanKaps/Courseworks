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

public class CalculatorPMD extends JFrame{
	private static final long serialVersionUID = 1L;
	private double accumalator;
	public Font font;
	private final Font buttons;
	private JLabel accumalatorBox;
	private JTextField textbox;
	private JPanel buttonPanel;
	private JButton clear;
	private JButton add;
	private JButton minus;
	private JButton multiply;
	private JButton divide;
	
	public CalculatorPMD() {
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
	accumalatorBox = new JLabel(Double.toString(accumalator), JLabel.RIGHT);
	add(accumalatorBox);
	textbox = new JTextField();
	textbox.setHorizontalAlignment(JTextField.RIGHT);
	add(textbox);
		
	buttonPanel = new JPanel();
	buttonPanel.setLayout(new GridLayout());
	
		clear = new JButton("Clear");
		clear.setFont(buttons);
		clear.addActionListener(new ActionListener() {
			public final void actionPerformed(ActionEvent clear) {
				accumalator =0;
				textbox.setText("");
				accumalatorBox.setText(Double.toString(accumalator));
			}
		});
		buttonPanel.add(clear);
		
		add = new JButton("+");
		add.setFont(buttons);
		add.addActionListener(new ActionListener() {
			public final void actionPerformed(ActionEvent add) {
				calc('+');
			}
		});
		buttonPanel.add(add);

		minus = new JButton("-");
		minus.setFont(buttons);
		minus.addActionListener(new ActionListener(){
			public final void actionPerformed(ActionEvent minus) {
				calc('-');
				
			}
		});
		buttonPanel.add(minus);
		
		multiply = new JButton("*");
		multiply.setFont(buttons);
		multiply.addActionListener(new ActionListener(){
			public final void actionPerformed(ActionEvent multiply) {
				calc('*');
			}
		});
		buttonPanel.add(multiply);
		
		divide = new JButton("/");
		divide.setFont(buttons);
		divide.addActionListener(new ActionListener(){
			public final void actionPerformed(ActionEvent divide) {
				calc('/');
				
			}
		});
		buttonPanel.add(divide);
		
		add(buttonPanel);
		}
	private final void calc(char calculations) {
		try {
			
			final double input = Double.valueOf(textbox.getText());
			
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
				if (input!=0) {
				accumalator = accumalator / input;
				} 
				else {
					System.out.print("Cannot divide by 0");
					accumalatorBox.setText("Cannot divide by 0");
				}
				break;
				default:
					accumalatorBox.setText("Is not part of the possible calculations");
			}
			}
			catch (NumberFormatException exception) {
				accumalatorBox.setText("Please retry with a numerical value");
			return;
			}
			finally {
				accumalatorBox.setText(Double.toString(accumalator));
				textbox.setText("");
				
			}
	}
	
	public static final void main(String[] args) {
		new Calculator();
	}

}
