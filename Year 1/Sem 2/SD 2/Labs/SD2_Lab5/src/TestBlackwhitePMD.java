import java.awt.*;

import java.awt.event.*;
import javax.swing.*;
import java.util.*;

class BlackwhitePMD extends JFrame
{  
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public BlackwhitePMD()
	{  
		super ();
		getContentPane().setBackground(Color.black);  
		
	}

	private void pause(long millisecs)
	{  
		final long startTime = Calendar.getInstance().getTimeInMillis();
		while (Calendar.getInstance().getTimeInMillis()-startTime<millisecs) {};
	}

	public void flash()
	{  
		final Color [] rainbow ={ Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.magenta};
		while(true)
		{  
			final Scanner input = new Scanner(System.in);
			for(int n = 0; n<rainbow.length;n++) {
				
				//pause(1000);
				input.nextLine();
				getContentPane().setBackground(rainbow [n]);
			}
		}
	}
}

class TestBlackwhitePMD
{  
	public static void main(String [] args)
	{  
		BlackwhitePMD b;
		b = new BlackwhitePMD();
		b.setSize(200,220);
		b.setTitle("Black and white");
		b.setVisible(true);
		b.addWindowListener
		(new WindowAdapter()
		{  
			public void windowClosing(WindowEvent e)
			{  System.exit(0); }
		});
		b.flash();
	}
}
