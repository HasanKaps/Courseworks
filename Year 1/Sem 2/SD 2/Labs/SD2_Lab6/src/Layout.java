import java.awt.*;
import javax.swing.*;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Layout extends JFrame{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel Window;
	private Font font;
	private JLabel h;
	private JLabel m;
	private JLabel s;
	private JLabel Convections;
	Calendar GCalendar;
	
	
	private Layout() {
	super("Digital Clock");
	setLayout(new GridLayout(2,1));
	font = new Font("Serif", Font.ITALIC, 36);
	Clock();
	setSize(300,300);
	setVisible(true);
	while(true) {
		update();
	}
	}	



	private void Clock() {
		Window = new JPanel();
		Window.setLayout(new GridBagLayout());
		
		h = new JLabel();
		h.setFont(font);
		Window.add(h);
		
		m = new JLabel();
		m.setFont(font);
		Window.add(m);
		
		s = new JLabel();
		s.setFont(font);
		Window.add(s);
		
		add(Window);
		
		Convections = new JLabel("AM-PM", JLabel.CENTER);
		Convections.setFont(font);
		add(Convections);
	}


	private void update(){

		GCalendar = new GregorianCalendar();
	    
		h.setText(GCalendar.get(Calendar.HOUR_OF_DAY)+ " : ");
	    m.setText(GCalendar.get(Calendar.MINUTE)+ " : ");
	    s.setText(GCalendar.get(Calendar.SECOND)+ "");
	   
	    if (GCalendar.get(Calendar.AM_PM) == Calendar.AM)
	    	 Convections.setText("AM");
	    
	    else if (GCalendar.get(Calendar.AM_PM) == Calendar.PM)
	    	 Convections.setText("PM");
	    
	    try {
	    	 Thread.sleep(1000);
	    
	    } catch (InterruptedException i) {
	    	 i.printStackTrace();
	    	
	     }
	
	}

	public static void main(String[] args) {
		
		new Layout();
	}

}
