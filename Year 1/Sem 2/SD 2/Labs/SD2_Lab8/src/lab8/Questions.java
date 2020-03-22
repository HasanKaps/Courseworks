package lab8;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class Questions {

	public ArrayList<String> result = new ArrayList<>();
	
	Scanner scan;
	public Questions() {
		String fileName = "Questions";
		String line = null;
		try {
			 scan = new Scanner(new File("Questions"));
		} catch (FileNotFoundException e) {	
			e.printStackTrace();
		}
		
		try {
		FileReader fileReader = new FileReader("Questions");
		BufferedReader bufferedReader = new BufferedReader(fileReader);
		try (BufferedReader br = new BufferedReader(new FileReader("Questions"))) {
		    while (br.ready()) {
		        result.add(br.readLine());

		    }
		}	
		while((line = bufferedReader.readLine()) != null) {
			result.add(line);
		}
		bufferedReader.close();
		}
	catch(IOException ex) {
        System.out.println("The Input file '" + fileName + "' cannot be read from");  
	}
		
	}
	public static void main(String[] args)  {
		
	
	}
	
}