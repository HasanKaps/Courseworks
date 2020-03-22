import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

class WhitePMD extends JFrame
{ 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public WhitePMD(final Color color)
	{  
		super ();
		getContentPane().setBackground(color);
	}
}

abstract class TestWhitePMD
{  	
	public static void main(String [] args)
	{  
		WhitePMD redcolor;
		redcolor = new WhitePMD(Color.red);
		redcolor.setSize(250,250);
		redcolor.setTitle("Red");
		redcolor.setVisible(true);
		redcolor.addWindowListener
		(new WindowAdapter()
		{  
			public void windowClosing(WindowEvent e)
			{  System.exit(0); }
		});
	
		WhitePMD bluecolor;
		bluecolor = new WhitePMD(Color.blue);
		bluecolor.setSize(350,100);
		bluecolor.setTitle("Blue");
		bluecolor.setVisible(true);
		bluecolor.addWindowListener
		(new WindowAdapter()
		{  
			public void windowClosing(WindowEvent e)
			{  System.exit(0); }
		});
	
	
		WhitePMD greencolor;
		greencolor = new WhitePMD(Color.green);
		greencolor.setSize(200,450);
		greencolor.setTitle("Green");
		greencolor.setVisible(true);
		greencolor.addWindowListener
		(new WindowAdapter()
		{  
			public void windowClosing(WindowEvent e)
			{  System.exit(0); }
		});
	}
	
}

