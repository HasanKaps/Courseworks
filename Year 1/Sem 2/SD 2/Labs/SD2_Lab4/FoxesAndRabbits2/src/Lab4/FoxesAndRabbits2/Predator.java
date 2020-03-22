package Lab4.FoxesAndRabbits2;

import java.util.Iterator;
import java.util.List;

public abstract class Predator extends Animal{
	
		protected int foodLevel;

	public Predator(Field field, Location location) {
		super(field, location);
		// TODO Auto-generated constructor stub
	}
	
	protected Location hunt(int foodValue) {
		
		Field field = getField();
		List<Location> adjacent = field.adjacentLocations(getLocation());
		Iterator<Location> it = adjacent.iterator();
		while(it.hasNext()) {
			
			Location where = it.next();
			Object animal = field.getObjectAt(where);
			if(animal instanceof Prey) {
				Prey prey = (Prey) animal;
			if(prey.isAlive()) {
				prey.setDead();
				foodLevel = foodValue;
				return where;
			}
			}
		}
		return null;
	}
	
	
	
	
	
	
	@Override
	public void act(List<Animal> newAnimals) {
		// TODO Auto-generated method stub
		
	}

}
