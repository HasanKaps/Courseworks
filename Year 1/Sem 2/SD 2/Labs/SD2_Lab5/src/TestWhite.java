import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

class White extends JFrame
{ 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public White(Color color)
	{  
		getContentPane().setBackground(color);
	}
}

class TestWhite
{  	
	public static void main(String [] args)
	{  
		White r;
		r = new White(Color.red);
		r.setSize(250,250);
		r.setTitle("Red");
		r.setVisible(true);
		r.addWindowListener
		(new WindowAdapter()
		{  
			public void windowClosing(WindowEvent e)
			{  System.exit(0); }
		});
	
		White b;
		b = new White(Color.blue);
		b.setSize(350,100);
		b.setTitle("Blue");
		b.setVisible(true);
		b.addWindowListener
		(new WindowAdapter()
		{  
			public void windowClosing(WindowEvent e)
			{  System.exit(0); }
		});
	
	
		White g;
		g = new White(Color.green);
		g.setSize(200,450);
		g.setTitle("Green");
		g.setVisible(true);
		g.addWindowListener
		(new WindowAdapter()
		{  
			public void windowClosing(WindowEvent e)
			{  System.exit(0); }
		});
	}
	
}

