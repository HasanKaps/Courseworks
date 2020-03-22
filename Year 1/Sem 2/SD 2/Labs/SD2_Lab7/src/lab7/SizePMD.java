package lab7;

import java.awt.Font;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class SizePMD extends JFrame {
	/*
	 * 
	 * 
	 */
private static final long serialVersionUID = 1L;
private Font font;
private JPanel display;
private JLabel letter;
private JLabel number;
private JPanel buttonPanel;
private JButton increase;
private JButton decrease;
public int increment;
private int fontsize;
	public SizePMD() {
		super();
		setLayout(new GridLayout(2,1));
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Layout();
		setSize(250,200);
		setVisible(true);

	}
public void Layout() {
	fontsize = 18;
	font = new Font("Serif", Font.PLAIN, fontsize);
	display = new JPanel();
	display.setLayout(new GridBagLayout());
		letter = new JLabel("X");
		letter.setFont(font);
		display.add(letter);
		number = new JLabel(Integer.toString(fontsize));
		number.setFont(font);
		display.add(number);
	add(display);
		
	buttonPanel = new JPanel();
	buttonPanel.setLayout(new GridBagLayout());
		increase = new JButton("Increase");
		increase.addActionListener(new ActionListener() {
			public final void actionPerformed(ActionEvent arg0) {
				letter.setFont(new Font("Serif", Font.PLAIN, ++fontsize));
				number.setText(Integer.toString(fontsize));
			}
		});
		buttonPanel.add(increase);
		decrease = new JButton("Decrease");
		decrease.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if(fontsize>0) {
					letter.setFont(new Font("Serif", Font.PLAIN, --fontsize));
					number.setText(Integer.toString(fontsize));
				}
			}
		});
		buttonPanel.add(decrease);
		add(buttonPanel);
}
	public static final void main(String[] args) {
		new Size();

	}

}
